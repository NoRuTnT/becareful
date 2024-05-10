package com.sourceconnector.dataset.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Objects;

import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.SchemaBuilder;
import org.apache.kafka.connect.data.Struct;


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


	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "UTC")
	@JsonDeserialize(using= LocalDateTimeDeserializer.class)
	@JsonSerialize(using= LocalDateTimeSerializer.class)
	private final LocalDateTime trsmUtcTime;
	private final Long itstId;

	private final BigDecimal ntPdsgRmdrCs;
	private final BigDecimal etPdsgRmdrCs;
	private final BigDecimal stPdsgRmdrCs;
	private final BigDecimal wtPdsgRmdrCs;
	private final BigDecimal nePdsgRmdrCs;
	private final BigDecimal sePdsgRmdrCs;
	private final BigDecimal swPdsgRmdrCs;
	private final BigDecimal nwPdsgRmdrCs;

	public static String trsmUtcTime_FIELD = "trsmUtcTime";

	public static String itstId_FIELD = "itstId";
	public static String ntPdsgRmdrCs_FIELD = "ntPdsgRmdrCs";
	public static String etPdsgRmdrCs_FIELD = "etPdsgRmdrCs";
	public static String stPdsgRmdrCs_FIELD = "stPdsgRmdrCs";
	public static String wtPdsgRmdrCs_FIELD = "wtPdsgRmdrCs";
	public static String nePdsgRmdrCs_FIELD = "nePdsgRmdrCs";
	public static String sePdsgRmdrCs_FIELD = "sePdsgRmdrCs";
	public static String swPdsgRmdrCs_FIELD = "swPdsgRmdrCs";
	public static String nwPdsgRmdrCs_FIELD = "nwPdsgRmdrCs";


	public static Schema schema = SchemaBuilder.struct()
		.name("com.sourceconnector.dataset.model").version(1).doc("Schema for traffic signal data")
		.field(trsmUtcTime_FIELD, Schema.STRING_SCHEMA)
		.field(itstId_FIELD, Schema.INT64_SCHEMA)
		.field(ntPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(etPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(stPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(wtPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(nePdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(sePdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(swPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.field(nwPdsgRmdrCs_FIELD, Schema.FLOAT64_SCHEMA)
		.build();

	@JsonCreator
	public TrafficSignalData(
		@JsonProperty("trsmUtcTime") LocalDateTime trsmUtcTime,
		@JsonProperty("itstId") Long itstId,
		@JsonProperty("ntPdsgRmdrCs") BigDecimal ntPdsgRmdrCs,
		@JsonProperty("etPdsgRmdrCs") BigDecimal etPdsgRmdrCs,
		@JsonProperty("stPdsgRmdrCs") BigDecimal stPdsgRmdrCs,
		@JsonProperty("wtPdsgRmdrCs") BigDecimal wtPdsgRmdrCs,
		@JsonProperty("nePdsgRmdrCs") BigDecimal nePdsgRmdrCs,
		@JsonProperty("sePdsgRmdrCs") BigDecimal sePdsgRmdrCs,
		@JsonProperty("swPdsgRmdrCs") BigDecimal swPdsgRmdrCs,
		@JsonProperty("nwPdsgRmdrCs") BigDecimal nwPdsgRmdrCs
		) {

		this.trsmUtcTime = trsmUtcTime;
		this.itstId = itstId;
		this.ntPdsgRmdrCs = ntPdsgRmdrCs;
		this.etPdsgRmdrCs = etPdsgRmdrCs;
		this.stPdsgRmdrCs = stPdsgRmdrCs;
		this.wtPdsgRmdrCs = wtPdsgRmdrCs;
		this.nePdsgRmdrCs = nePdsgRmdrCs;
		this.sePdsgRmdrCs = sePdsgRmdrCs;
		this.swPdsgRmdrCs = swPdsgRmdrCs;
		this.nwPdsgRmdrCs = nwPdsgRmdrCs;



	}

	public Long getItstId() {
		return itstId;
	}

	public LocalDateTime getTrsmUtcTime() {
		return trsmUtcTime.atOffset(ZoneOffset.UTC).toLocalDateTime();
	}

	public long getKey() {
		return getTrsmUtcTime()
			.withMinute(0)
			.withSecond(0)
			.withNano(0)
			.toEpochSecond(ZoneOffset.UTC);
	}


	public Struct toStruct() {
		return new Struct(schema)
			.put(trsmUtcTime_FIELD, getTrsmUtcTime().toString())
			.put(itstId_FIELD, itstId)
			.put(ntPdsgRmdrCs_FIELD,ntPdsgRmdrCs)
			.put(etPdsgRmdrCs_FIELD,etPdsgRmdrCs)
			.put(stPdsgRmdrCs_FIELD,stPdsgRmdrCs)
			.put(wtPdsgRmdrCs_FIELD,wtPdsgRmdrCs)
			.put(nePdsgRmdrCs_FIELD,nePdsgRmdrCs)
			.put(sePdsgRmdrCs_FIELD,sePdsgRmdrCs)
			.put(swPdsgRmdrCs_FIELD,swPdsgRmdrCs)
			.put(nwPdsgRmdrCs_FIELD,nwPdsgRmdrCs)
			;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		TrafficSignalData that = (TrafficSignalData) o;
		return itstId == that.itstId && trsmUtcTime.equals(that.trsmUtcTime);
	}



	@Override
	public int hashCode() {
		return Objects.hash(trsmUtcTime, itstId, ntPdsgRmdrCs, etPdsgRmdrCs, stPdsgRmdrCs, wtPdsgRmdrCs, nePdsgRmdrCs, sePdsgRmdrCs, swPdsgRmdrCs, nwPdsgRmdrCs);
	}
}