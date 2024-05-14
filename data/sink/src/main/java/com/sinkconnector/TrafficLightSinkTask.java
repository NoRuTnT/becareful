package com.sinkconnector;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sinkconnector.dataset.model.TrafficSignalData;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import org.apache.kafka.connect.sink.SinkRecord;
import org.apache.kafka.connect.sink.SinkTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TrafficLightSinkTask extends SinkTask {
  private static final Logger log = LoggerFactory.getLogger(TrafficLightSinkTask.class);
  private ObjectMapper objectMapper = new ObjectMapper(); // JSON 파서


  @Autowired
  private com.sinkconnector.FirebaseAdmin firebaseAdmin;

  @Override
  public void start(Map<String, String> props) {
  }
  @Override
  public void put(Collection<SinkRecord> records) {
    log.info("put 메소드 실행 Received {} records",records.size());
    for (SinkRecord record : records) {
      try {
        String value = (String) record.value(); // 문자열로 읽어오기
        TrafficSignalData trafficSignalData = objectMapper.readValue(value, TrafficSignalData.class); // JSON 파싱
        String id = String.valueOf(trafficSignalData.getItstId());
        if (id != null) {
          log.info("firebase save data");
          firebaseAdmin.saveData(record.topic(), id, trafficSignalData);
        }
      } catch (Exception e) {

      }
    }
  }

  @Override
  public void stop() {
  }

  @Override
  public String version() {
    return "1.0";
  }
}