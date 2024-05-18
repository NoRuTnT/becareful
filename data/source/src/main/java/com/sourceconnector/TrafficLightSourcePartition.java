package com.sourceconnector;

import com.sourceconnector.dataset.DataService;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;


class TrafficLightSourcePartition {

	private int intersectionId;
	private DataService dataService;
	private LocalDateTime lastTimeStamp;
	private Long lastID;


	TrafficLightSourcePartition(int intersectionId, DataService dataService) {
		this.intersectionId = intersectionId;
		this.dataService = dataService;
	}


	public int getIntersectionId() { return intersectionId; }


	public LocalDateTime getLastTimeStamp() { return lastTimeStamp; }

	public Long getLastID() { return lastID; }

	public DataService getDataService() { return dataService; }

	public void setLastTimeStamp(LocalDateTime lastTimeStamp) {
		this.lastTimeStamp = lastTimeStamp;
	}

	public void setLastID(Long lastID) {
		this.lastID = lastID;
	}

	public Map<String, Integer> getSourcePartition() {
		return Collections.singletonMap("intersectionId", intersectionId);
	}


	public Map<String, String> getSourceOffset() {
		final Map<String, String> sourceOffset = new HashMap<>();
		sourceOffset.put("LAST_ID", String.valueOf(lastID));
		sourceOffset.put("LAST_TIMESTAMP", lastTimeStamp.toString());
		return sourceOffset;
	}


	public void setSourceOffset(Map<String, Object> offset) {
		if (offset != null) {
			lastID = Long.parseLong((String) offset.get("LAST_ID"));
			lastTimeStamp = LocalDateTime.parse((String) offset.get("LAST_TIMESTAMP"));
		}
	}

}