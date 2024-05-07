package com.sinkconnector;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component
public class FirebaseAdmin {

  private DatabaseReference databaseReference;

  @Value("${firebase.url}")
  private String firebaseUrl;

  @Value("${firebase.config}")
  private String firebaseConfig;

  @PostConstruct
  public void initializeFirebase() {
    try {
      ByteArrayInputStream serviceAccount = new ByteArrayInputStream(firebaseConfig.getBytes(StandardCharsets.UTF_8));
      FirebaseOptions options = new FirebaseOptions.Builder()
          .setCredentials(GoogleCredentials.fromStream(serviceAccount))
          .setDatabaseUrl(firebaseUrl)
          .build();

      if (FirebaseApp.getApps().isEmpty()) {
        FirebaseApp.initializeApp(options);
      }
    } catch (IOException e) {
      System.out.println("Failed to initialize Firebase with error: " + e.getMessage());
      throw new IllegalStateException("Failed to initialize Firebase", e);
    }

    FirebaseDatabase database = FirebaseDatabase.getInstance();
    databaseReference = database.getReference();
  }
  void saveData(String path, String id, Object object) {
    DatabaseReference childRef = databaseReference.child(path);
    childRef.child(id).setValueAsync(object);
  }
}
