package com.sourceconnector.config;

import java.util.Map;

import org.apache.kafka.common.config.AbstractConfig;
import org.apache.kafka.common.config.ConfigDef;
import org.apache.kafka.common.config.ConfigException;

public class TrafficLightSourceConnectorConfig extends AbstractConfig {
	public static final String INTERSECTIONID_CONFIG = "intersection.id";

	public static final String INTERSECTIONID_DOC = "Intersection identifier";

	public static final String TOPIC_CONFIG = "topics";

	public static final String TOPIC_DOC = "Topic where the data shall be written";

	public int getintersectionId() {
		return this.getInt(INTERSECTIONID_CONFIG);
	}

	public String getTopic() {
		return this.getString(TOPIC_CONFIG);
	}

	public TrafficLightSourceConnectorConfig(Map<?, ?> originals) {
		super(conf(), originals);
	}


	public static ConfigDef conf() {
		return new ConfigDef()
			.define(
				INTERSECTIONID_CONFIG,
				ConfigDef.Type.INT,
				ConfigDef.NO_DEFAULT_VALUE,
				new IntegersectionIdValidator(),
				ConfigDef.Importance.HIGH,
				INTERSECTIONID_DOC
			)
			.define(
				TOPIC_CONFIG,
				ConfigDef.Type.STRING,
				ConfigDef.Importance.HIGH,
				TOPIC_DOC
			);
	}


	private static class IntegersectionIdValidator implements ConfigDef.Validator {

		@Override
		@SuppressWarnings("unchecked")
		public void ensureValid(String name, Object value) {
			if (value instanceof String) {
				try {
					int intersectionId = Integer.parseInt((String) value);
					if (intersectionId <= 0) {
						throw new ConfigException(name, value, "IntersectionId는 0보다 커야합니다.");
					}
				} catch (NumberFormatException e) {
					throw new ConfigException(name, value, "IntersectionId는 정수여야합니다.");
				}
			} else {
				throw new ConfigException(name, value, "IntersectionId는 숫자형식입니다.");
			}
		}
	}


}
