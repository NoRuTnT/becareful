package com.sourceconnector;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.stream.Collectors;

import org.apache.kafka.common.config.ConfigDef;
import org.apache.kafka.connect.source.SourceConnector;
import org.apache.kafka.connect.util.ConnectorUtils;


import com.sourceconnector.config.TrafficLightSourceConnectorConfig;

public class TrafficLightSourceConnector extends SourceConnector {



	private TrafficLightSourceConnectorConfig config;

	@Override
	public void start(Map<String, String> props) {

		config = new TrafficLightSourceConnectorConfig(props);
	}

	@Override
	public Class<TrafficLightSourceTask> taskClass() {
		return TrafficLightSourceTask.class;
	}

	/**
	 * Creates the configs for the connector tasks.
	 * It distributes all configured locations evenly among a maximum of maxTasks.
	 *
	 * @param maxTasks the maximum number of tasks
	 * @return the configs for the connector tasks
	 */
	@Override
	public List<Map<String, String>> taskConfigs(int maxTasks) {
		// 단일 Integer 값을 얻기 위한 코드
		Integer intersectionId = config.getintersectionId();

		// 하나의 단일 값을 가지고 여러 task configurations 생성
		List<Map<String, String>> configs = new ArrayList<>();
		for (int i = 0; i < maxTasks; i++) {
			Map<String, String> taskConfig = createTaskConfig(intersectionId);
			configs.add(taskConfig);
		}
		return configs;
	}

	private Map<String, String> createTaskConfig(Integer intersectionId) {
		HashMap<String, String> taskConfig = new HashMap<>(config.originalsStrings());
		taskConfig.put("intersectionId", intersectionId.toString());
		return taskConfig;
	}

	@Override
	public void stop() {
	}

	@Override
	public ConfigDef config() {
		return TrafficLightSourceConnectorConfig.conf();
	}

	@Override
	public String version() {
		return "1.0-SNAPSHOT";
	}
}
