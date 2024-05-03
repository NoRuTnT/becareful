package com.kafka.data.connector.sink.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FirebaseConfig {

  @Value("${firebase.url}")
  private String firebaseUrl;

  @Value("${firebase.path}")
  private String firebasePath;

  public String getFirebaseUrl() {
    return firebaseUrl;
  }

  public String getFirebasePath() {
    return firebasePath;
  }
}
