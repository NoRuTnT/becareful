package com.kafka.data.connector.sink;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import com.kafka.data.connector.sink.config.FirebaseConfig;
import java.io.FileInputStream;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
class FirebaseAdmin {

  private DatabaseReference databaseReference;

  @Autowired
  private FirebaseConfig firebaseConfig;

  public FirebaseAdmin() {
    initializeFirebase();
  }

  private void initializeFirebase() {
    FirebaseOptions options = null;
    try (FileInputStream serviceAccount = new FileInputStream(firebaseConfig.getFirebasePath())) {
      options = new FirebaseOptions.Builder()
          .setCredentials(GoogleCredentials.fromStream(serviceAccount))
          .setDatabaseUrl(firebaseConfig.getFirebaseUrl())
          .build();

      FirebaseApp.initializeApp(options);
    } catch (IOException e) {
      e.printStackTrace();
    }

    final FirebaseDatabase database = FirebaseDatabase.getInstance();
    databaseReference = database.getReference();
  }

  void saveData(String path, String id, Object object) {
    DatabaseReference childRef = databaseReference.child(path);
    childRef.child(id).setValueAsync(object);
  }
}
