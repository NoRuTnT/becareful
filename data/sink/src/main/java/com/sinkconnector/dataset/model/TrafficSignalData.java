package com.sinkconnector.dataset.model;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Objects;

import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.SchemaBuilder;
import org.apache.kafka.connect.data.Struct;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.sinkconnector.dataset.CustomLocalDateTimeDeserializer;

@JsonIgnoreProperties(ignoreUnknown=true)
public class TrafficSignalData {


	@JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
	@JsonSerialize(using= LocalDateTimeSerializer.class)
	private final LocalDateTime regDt;
	private final Long itstId;

	private final Double ntPdsgRmdrCs;
	private final Double etPdsgRmdrCs;
	private final Double stPdsgRmdrCs;
	private final Double wtPdsgRmdrCs;
	private final Double nePdsgRmdrCs;
	private final Double sePdsgRmdrCs;
	private final Double swPdsgRmdrCs;
	private final Double nwPdsgRmdrCs;

	public static String regDt_FIELD = "regDt";

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
		.field(regDt_FIELD, Schema.STRING_SCHEMA)
		.field(itstId_FIELD, Schema.INT64_SCHEMA)
		.field(ntPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(etPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(stPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(wtPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(nePdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(sePdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(swPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.field(nwPdsgRmdrCs_FIELD, Schema.OPTIONAL_FLOAT64_SCHEMA)
		.build();

	@JsonCreator
	public TrafficSignalData(
		@JsonProperty("regDtTime") LocalDateTime regDt,
		@JsonProperty("itstId") Long itstId,
		@JsonProperty("ntPdsgRmdrCs") Double ntPdsgRmdrCs,
		@JsonProperty("etPdsgRmdrCs") Double etPdsgRmdrCs,
		@JsonProperty("stPdsgRmdrCs") Double stPdsgRmdrCs,
		@JsonProperty("wtPdsgRmdrCs") Double wtPdsgRmdrCs,
		@JsonProperty("nePdsgRmdrCs") Double nePdsgRmdrCs,
		@JsonProperty("sePdsgRmdrCs") Double sePdsgRmdrCs,
		@JsonProperty("swPdsgRmdrCs") Double swPdsgRmdrCs,
		@JsonProperty("nwPdsgRmdrCs") Double nwPdsgRmdrCs
		) {

		this.regDt = regDt;
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

	public LocalDateTime getRegDt() {
		return regDt.atOffset(ZoneOffset.UTC).toLocalDateTime();
	}

	public long getKey() {
		return getRegDt()
			.withMinute(0)
			.withSecond(0)
			.withNano(0)
			.toEpochSecond(ZoneOffset.UTC);
	}


	public Struct toStruct() {
		return new Struct(schema)
			.put(regDt_FIELD, getRegDt().toString())
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
		return itstId == that.itstId && regDt.equals(that.regDt);
	}



	@Override
	public int hashCode() {
		return Objects.hash(regDt, itstId, ntPdsgRmdrCs, etPdsgRmdrCs, stPdsgRmdrCs, wtPdsgRmdrCs, nePdsgRmdrCs, sePdsgRmdrCs, swPdsgRmdrCs, nwPdsgRmdrCs);
	}
}