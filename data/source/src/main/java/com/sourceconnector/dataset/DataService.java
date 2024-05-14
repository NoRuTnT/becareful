package com.sourceconnector.dataset;

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

import org.apache.commons.text.StringSubstitutor;
import org.springframework.beans.factory.annotation.Value;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sourceconnector.dataset.model.TrafficSignalData;

public class DataService {
	private final URI uri;

	private final HttpClient client;

	private LocalDateTime lastCall;



	private DataService(final URI uri, final HttpClient client) {
		this.uri = uri;
		this.client = HttpClient.newBuilder()
			.followRedirects(HttpClient.Redirect.ALWAYS) // 리다이렉션을 자동으로 따름
			.build();

	}


	public List<TrafficSignalData> getData() throws IOException, InterruptedException {
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

		private String baseURL = "http://t-data.seoul.go.kr/apig/apiman-gateway/tapi/v2xSignalPhaseTimingInformation/1.0?";

		private final String query = "apiKey=ff9d3b2d-bd93-4f8d-a91e-5602af57840e&type=json&pageNo=1&numOfRows=1&itstId=${intersectionId}";


		private final Map<String, Integer> values;

		private final HttpClient client = HttpClient.newHttpClient();



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


		public DataService build() throws URISyntaxException {
			final StringSubstitutor substitutor = new StringSubstitutor(values);
			URI uri = new URI(substitutor.replace(baseURL + query));
			System.out.println("Constructed URI: " + uri);
			return new DataService(uri, client);
		}
	}
}
