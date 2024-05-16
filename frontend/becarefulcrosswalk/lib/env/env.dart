import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'config.env')
abstract class Env {
  // Naver API Keys
  @EnviedField(varName: 'naver_api_key', obfuscate: true)
  static final String naverApiKey = _Env.naverApiKey;
  @EnviedField(varName: 'naver_client_secret', obfuscate: true)
  static final String naverClientSecret = _Env.naverClientSecret;

  // Traffic Light API keys
  @EnviedField(varName: 'traffic_light_api_key', obfuscate: true)
  static final String trafficLightApiKey = _Env.trafficLightApiKey;

  // Firebase API Keys
  @EnviedField(varName: 'WEB_FIREBASE_API_KEY')
  static const String webFirebaseApiKey = _Env.webFirebaseApiKey;
  @EnviedField(varName: 'ANDROID_FIREBASE_API_KEY')
  static const String androidFirebaseApiKey = _Env.androidFirebaseApiKey;
  @EnviedField(varName: 'IOS_FIREBASE_API_KEY')
  static const String iosFirebaseApiKey = _Env.iosFirebaseApiKey;
  @EnviedField(varName: 'MACOS_FIREBASE_API_KEY')
  static const String macosFirebaseApiKey = _Env.macosFirebaseApiKey;
  @EnviedField(varName: 'WINDOWS_FIREBASE_API_KEY')
  static const String windowsFirebaseApiKey = _Env.windowsFirebaseApiKey;

  // Firebase App IDs
  @EnviedField(varName: 'WEB_FIREBASE_APP_ID')
  static const String webFirebaseAppId = _Env.webFirebaseAppId;
  @EnviedField(varName: 'ANDROID_FIREBASE_APP_ID')
  static const String androidFirebaseAppId = _Env.androidFirebaseAppId;
  @EnviedField(varName: 'IOS_FIREBASE_APP_ID')
  static const String iosFirebaseAppId = _Env.iosFirebaseAppId;
  @EnviedField(varName: 'MACOS_FIREBASE_APP_ID')
  static const String macosFirebaseAppId = _Env.macosFirebaseAppId;
  @EnviedField(varName: 'WINDOWS_FIREBASE_APP_ID')
  static const String windowsFirebaseAppId = _Env.windowsFirebaseAppId;

  // Firebase Common Configuration
  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID')
  static const String firebaseMessagingSenderId =
      _Env.firebaseMessagingSenderId;
  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static const String firebaseProjectId = _Env.firebaseProjectId;
  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN')
  static const String firebaseAuthDomain = _Env.firebaseAuthDomain;
  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET')
  static const String firebaseStorageBucket = _Env.firebaseStorageBucket;

  // Specific Configuration for Platforms
  @EnviedField(varName: 'WEB_FIREBASE_MEASUREMENT_ID')
  static const String webFirebaseMeasurementId = _Env.webFirebaseMeasurementId;
  @EnviedField(varName: 'WINDOWS_FIREBASE_MEASUREMENT_ID')
  static const String windowsFirebaseMeasurementId =
      _Env.windowsFirebaseMeasurementId;
  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID')
  static const String firebaseIosBundleId = _Env.firebaseIosBundleId;
}
