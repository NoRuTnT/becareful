package com.kafka.data.connector.sink;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kafka.data.dataset.model.TrafficSignalData;
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

  private static final Logger logger = LoggerFactory.getLogger(TrafficLightSinkTask.class);

  @Autowired
  private FirebaseAdmin firebaseAdmin;

  @Override
  public void start(Map<String, String> props) {
  }
  @Override
  public void put(Collection<SinkRecord> records) {
    ObjectMapper mapper = new ObjectMapper();
    for (SinkRecord record : records) {
      TrafficSignalData trafficSignalData = (TrafficSignalData) record.value();
      String id = String.valueOf(trafficSignalData.getItstId());
      if (id != null) {
        firebaseAdmin.saveData(record.topic(), id, trafficSignalData);
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