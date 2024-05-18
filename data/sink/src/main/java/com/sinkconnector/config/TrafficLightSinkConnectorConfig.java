package com.sinkconnector.config;

import java.util.Map;

import org.apache.kafka.common.config.AbstractConfig;
import org.apache.kafka.common.config.ConfigDef;

public class TrafficLightSinkConnectorConfig extends AbstractConfig {

	public static final String FIREBASE_URL_CONFIG = "firebase.url";
	private static final String FIREBASE_URL_DOC = "Firebase URL";

	public static final String FIREBASE_CONFIG_CONFIG = "firebase.config";
	private static final String FIREBASE_CONFIG_DOC = "Firebase account";

	public TrafficLightSinkConnectorConfig(Map<?, ?> originals) {
		super(config(), originals);
	}

	public static ConfigDef config() {
		return new ConfigDef()
			.define(
				FIREBASE_URL_CONFIG,
				ConfigDef.Type.STRING,
				ConfigDef.Importance.HIGH,
				FIREBASE_URL_DOC
			)
			.define(
				FIREBASE_CONFIG_CONFIG,
				ConfigDef.Type.STRING,
				ConfigDef.Importance.HIGH,
				FIREBASE_CONFIG_DOC
			);
	}

	public String getFirebaseUrl() {
		return this.getString(FIREBASE_URL_CONFIG);
	}

	public String getFirebaseConfig() {
		return this.getString(FIREBASE_CONFIG_CONFIG);
	}
}