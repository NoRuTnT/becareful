package com.sinkconnector;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class FirebaseAdmin {

	private DatabaseReference databaseReference;

	private String firebaseUrl;
	private String firebaseConfig;

	public FirebaseAdmin(String firebaseUrl, String firebaseConfig) {
		this.firebaseUrl = firebaseUrl;
		this.firebaseConfig = firebaseConfig;
		initializeFirebase();
	}

	private void initializeFirebase() {
		try {
			ByteArrayInputStream serviceAccount = new ByteArrayInputStream(
				firebaseConfig.getBytes(StandardCharsets.UTF_8));
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

	public void saveData(String path, String id, Object object) {
		DatabaseReference childRef = databaseReference.child(path).child(id);
		childRef.setValueAsync(object);
	}
}