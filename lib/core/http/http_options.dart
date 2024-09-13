
import 'package:dio/dio.dart';


class HttpOptions{

  HttpOptions._();

   // static const _devUrl = 'https://core-dev.mipuntoverde.com/api';

  static const _productionUrl = 'https://almacen-carmelo.hellostudio.tech/api';


  static const apiUrl = _productionUrl;

  // static PocketBase get pb => PocketBase(apiUrl);

  static Dio get client => Dio(BaseOptions(baseUrl: apiUrl));

}