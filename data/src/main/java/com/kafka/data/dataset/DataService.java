package com.kafka.data.dataset;

import java.io.IOException;
import java.io.UncheckedIOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kafka.data.dataset.model.TrafficSignalData;
import org.apache.commons.text.StringSubstitutor;

public class DataService {
	private final URI uri;

	private final HttpClient client;

	private LocalDateTime lastCall;

	private final long secondsBetweenCalls;

	private DataService(final URI uri, final HttpClient client, final long secondsBetweenCalls) {
		this.uri = uri;
		this.client = client;
		this.secondsBetweenCalls = secondsBetweenCalls;
	}

	private long getTimeToWait() {
		if (lastCall == null) {
			return 0;
		} else {
			LocalDateTime now = LocalDateTime.now();
			long diff = lastCall.until(now, ChronoUnit.SECONDS);
			long timeToWait = secondsBetweenCalls - diff;
			return timeToWait < 0 ? 0 : timeToWait * 1000;
		}
	}

	public List<TrafficSignalData> getData() throws IOException, InterruptedException {
		Thread.sleep(getTimeToWait());
		lastCall = LocalDateTime.now();

		final HttpRequest request = HttpRequest.newBuilder(uri)
			.GET()
			.build();

		return client.send(request, responseInfo -> {
			if(responseInfo.statusCode() != 200) {
				throw new RuntimeException(MessageFormat.format("Got HTTP {0}", responseInfo.statusCode()));
			}
			final HttpResponse.BodySubscriber<String> upstream = HttpResponse.BodySubscribers.ofString(StandardCharsets.UTF_8);
			return HttpResponse.BodySubscribers.mapping(
				upstream,
				(String body) -> {
					final ObjectMapper mapper = new ObjectMapper();
					try {
						return mapper.readValue(body, new TypeReference<List<TrafficSignalData>>() {});
					} catch (IOException e) {
						throw new UncheckedIOException(e);
					}
				});
		}).body();
	}


	public static DataServiceBuilder builder() {
		return new DataServiceBuilder();
	}

	public static class DataServiceBuilder {

		private String apiKey = "bd30bf3b-df36-4c38-9e4e-8dd8b5e94ddc";


		private String baseURL = "http://t-data.seoul.go.kr/apig/apiman-gateway/tapi/v2xSignalPhaseTimingInformation/1.0?";

		private final String query = "apiKey=bd30bf3b-df36-4c38-9e4e-8dd8b5e94ddc&type=json&pageNo=1&numOfRows=2&itstId=${intersectionId}";

		private final Map<String, Integer> values;

		private final HttpClient client = HttpClient.newHttpClient();

		private long secondsBetweenCalls = 3L;

		private DataServiceBuilder() {
			this.values = new HashMap<>();
		}

		public DataServiceBuilder intersectionId(int intersectionId) {
			values.put("intersectionId", intersectionId);
			return this;
		}


		public DataServiceBuilder baseURL(final String baseURL) {
			this.baseURL = baseURL;
			return this;
		}

		public DataServiceBuilder secondsBetweenCalls(final long seconds) {
			this.secondsBetweenCalls = seconds;
			return this;
		}

		public DataService build() throws URISyntaxException {
			final StringSubstitutor substitutor = new StringSubstitutor(values);
			URI uri = new URI(substitutor.replace(baseURL + query));

			return new DataService(uri, client, secondsBetweenCalls);
		}
	}
}
