import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CLOUDINARY_NAME')
  static const nameKey = _Env.nameKey;
    @EnviedField(varName: 'CLOUDINARY_API_KEY')
  static const apiKey = _Env.apiKey;
    @EnviedField(varName: 'CLOUDINARY_SECRET_KEY')
  static const secretKey = _Env.secretKey;
}