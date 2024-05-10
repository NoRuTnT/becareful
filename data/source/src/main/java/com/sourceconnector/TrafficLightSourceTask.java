package com.sourceconnector;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.IntStream;


import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.errors.ConnectException;
import org.apache.kafka.connect.source.SourceRecord;
import org.apache.kafka.connect.source.SourceTask;
import org.apache.kafka.connect.storage.OffsetStorageReader;

import com.sourceconnector.config.TrafficLightSourceConnectorConfig;
import com.sourceconnector.dataset.DataService;
import com.sourceconnector.dataset.model.TrafficSignalData;

public class TrafficLightSourceTask extends SourceTask {



	private final Function<Integer, DataService> dataServiceSupplier;
	private String topic;
	private long pollIntervalMs;
	private TrafficLightSourceConnectorConfig config;

	private TrafficLightSourcePartition trafficLightSourcePartitions;

	public TrafficLightSourceTask() {
		super();
		this.pollIntervalMs = pollIntervalMs;
		this.dataServiceSupplier = (intersectionId) -> {
			try {
				return DataService.builder()
					.intersectionId(intersectionId)
					.pollIntervalMs(pollIntervalMs) // poll 간격 설정 추가
					.build();
			} catch (URISyntaxException e) {
				throw new ConnectException(e);
			}
		};
	}

	public TrafficLightSourceTask(final Function<Integer, DataService> dataServiceSupplier) {
		super();
		this.dataServiceSupplier = dataServiceSupplier;
	}
	@Override
	public String version() {
		// 버전 반환
		return "1.0";
	}
	@Override
	public void start(Map<String, String> props) {

		this.pollIntervalMs = Long.parseLong(props.get("poll.interval.ms"));
		config = new TrafficLightSourceConnectorConfig(props);
		topic = config.getTopic();
		OffsetStorageReader offsetStorageReader = context.offsetStorageReader();


		int intersectionId = config.getintersectionId();
		trafficLightSourcePartitions = createTrafficLightPartition(intersectionId, offsetStorageReader);



	}

	@Override
	public List<SourceRecord> poll() throws InterruptedException {
		// 데이터 추출 로직 구현
		try {

			List<SourceRecord> sourceRecords = new ArrayList<>();
			pollSourcePartition(trafficLightSourcePartitions, sourceRecords);

			return sourceRecords;
		} catch (IOException e) {
			throw new ConnectException(e);
		}
	}

	private void pollSourcePartition(TrafficLightSourcePartition trafficLightSourcePartition, List<SourceRecord> sourceRecords)
		throws IOException, InterruptedException {
		List<TrafficSignalData> data = getLastData(trafficLightSourcePartition);


		for (TrafficSignalData signalData : data) {
			trafficLightSourcePartition.setLastID(signalData.getItstId());
			trafficLightSourcePartition.setLastTimeStamp(signalData.getRegDt());
			sourceRecords.add(
				new SourceRecord(
					trafficLightSourcePartition.getSourcePartition(),
					trafficLightSourcePartition.getSourceOffset(),
					topic,
					Schema.INT64_SCHEMA,
					signalData.getKey(),
					TrafficSignalData.schema, signalData.toStruct()
				)
			);
		}
	}

	private List<TrafficSignalData> getLastData(TrafficLightSourcePartition trafficLightSourcePartition) throws IOException, InterruptedException {
		List<TrafficSignalData> data = trafficLightSourcePartition.getDataService().getData();
		int idx = IntStream.range(0, data.size())
			.filter(i -> Objects.equals(data.get(i).getItstId(), trafficLightSourcePartition.getLastID())
				&& Objects.equals(data.get(i).getRegDt(), trafficLightSourcePartition.getLastTimeStamp()))
			.map(i -> i+1)
			.findFirst()
			.orElse(0);

		return data.subList(idx, data.size());
	}




	@Override
	public void stop() {

	}

	//config 추가예정
	private TrafficLightSourcePartition createTrafficLightPartition(int intersectionId, OffsetStorageReader offsetStorageReader) {

		TrafficLightSourcePartition trafficLightSourcePartition = new TrafficLightSourcePartition(intersectionId,
			this.dataServiceSupplier.apply(intersectionId));
		Map<String, Object> offset = offsetStorageReader.offset(trafficLightSourcePartition.getSourcePartition());
		trafficLightSourcePartition.setSourceOffset(offset);
		return trafficLightSourcePartition;
	}

}
