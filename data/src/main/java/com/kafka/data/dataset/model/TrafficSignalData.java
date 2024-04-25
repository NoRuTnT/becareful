package com.kafka.data.dataset.model;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.SchemaBuilder;
import org.apache.kafka.connect.data.Struct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@JsonIgnoreProperties(ignoreUnknown=true)
public class TrafficSignalData {
	private static final Logger logger = LoggerFactory.getLogger(TrafficSignalData.class);

	public static class TrafficSignalDataValue {

		private final long id;
		private final int remainingSeconds;
		private final String signalType;

		public long getId() {
			return id;
		}

		public int getRemainingSeconds() {
			return remainingSeconds;
		}

		public String getSignalType() {
			return signalType;
		}

		public static String ID_FIELD = "id";
		public static String REMAINING_SECONDS_FIELD = "remainingSeconds";
		public static String SIGNAL_TYPE_FIELD = "signalType";

		public static Schema schema = SchemaBuilder.struct()
			.field(ID_FIELD, Schema.INT64_SCHEMA)
			.field(REMAINING_SECONDS_FIELD, Schema.INT32_SCHEMA)
			.field(SIGNAL_TYPE_FIELD, Schema.STRING_SCHEMA)
			.build();

		@JsonCreator
		public TrafficSignalDataValue(@JsonProperty("id") long id,
			@JsonProperty("remainingSeconds") int remainingSeconds,
			@JsonProperty("signalType") String signalType) {
			this.id = id;
			this.remainingSeconds = remainingSeconds;
			this.signalType = signalType;
		}

		public Struct toStruct() {
			return new Struct(schema)
				.put(ID_FIELD, id)
				.put(REMAINING_SECONDS_FIELD, remainingSeconds)
				.put(SIGNAL_TYPE_FIELD, signalType);
		}

		public static TrafficSignalDataValue fromStruct(Struct struct) {
			return new TrafficSignalDataValue(
				struct.getInt64(ID_FIELD),
				struct.getInt32(REMAINING_SECONDS_FIELD),
				struct.getString(SIGNAL_TYPE_FIELD)
			);
		}

		public String toString(){
			return "{TrafficSignalId:" + getId() + ", RemainingSeconds: " + getRemainingSeconds() + ", SignalType: " + getSignalType() + "}";
		}

		@Override
		public boolean equals(Object o) {
			if (this == o) return true;
			if (o == null || getClass() != o.getClass()) return false;
			TrafficSignalDataValue that = (TrafficSignalDataValue) o;
			return Objects.equals(id, that.id) && remainingSeconds == that.remainingSeconds && Objects.equals(signalType, that.signalType);
		}

		@Override
		public int hashCode() {
			return Objects.hash(id, remainingSeconds, signalType);
		}
	}

	private final long id;

	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "UTC")
	@JsonDeserialize(using= LocalDateTimeDeserializer.class)
	@JsonSerialize(using= LocalDateTimeSerializer.class)
	private final LocalDateTime timestamp;

	private final List<TrafficSignalDataValue> trafficSignalDataValues;

	public static String ID_FIELD = "id";
	public static String TIMESTAMP_FIELD = "timestamp";
	public static String TRAFFIC_SIGNAL_DATA_VALUES_FIELD = "trafficSignalDataValues";

	public static Schema schema = SchemaBuilder.struct()
		.name("com.kafka.data.dataset.model;").version(1).doc("Schema for traffic signal data")
		.field(ID_FIELD, Schema.INT64_SCHEMA)
		.field(TIMESTAMP_FIELD, Schema.STRING_SCHEMA)
		.field(TRAFFIC_SIGNAL_DATA_VALUES_FIELD, SchemaBuilder.array(TrafficSignalDataValue.schema))
		.build();

	@JsonCreator
	public TrafficSignalData(@JsonProperty("id") long id,
		@JsonProperty("timestamp") LocalDateTime timestamp,
		@JsonProperty("trafficSignalDataValues") List<TrafficSignalDataValue> trafficSignalDataValues) {
		this.id = id;
		this.timestamp = timestamp;
		this.trafficSignalDataValues = trafficSignalDataValues;
	}

	public Long getId() {
		return id;
	}

	public LocalDateTime getTimestamp() {
		return timestamp.atOffset(ZoneOffset.UTC).toLocalDateTime();
	}

	public List<TrafficSignalDataValue> getTrafficSignalDataValues() {
		return trafficSignalDataValues;
	}

	public Struct toStruct() {
		return new Struct(schema)
			.put(ID_FIELD, id)
			.put(TIMESTAMP_FIELD, getTimestamp().toString())
			.put(TRAFFIC_SIGNAL_DATA_VALUES_FIELD, trafficSignalDataValues.stream().map(TrafficSignalDataValue::toStruct).collect(Collectors.toList()));
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		TrafficSignalData that = (TrafficSignalData) o;
		return id == that.id && timestamp.equals(that.timestamp) && trafficSignalDataValues.equals(that.trafficSignalDataValues);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, timestamp, trafficSignalDataValues);
	}
}