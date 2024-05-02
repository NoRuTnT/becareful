import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'config.env')
abstract class Env {
  @EnviedField(varName: 'naver_api_key', obfuscate: true)
  static final String naverApiKey = _Env.naverApiKey;
}
