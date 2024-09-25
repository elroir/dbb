

import 'package:pocketbase/pocketbase.dart';

class PocketBaseOptions{

  PocketBaseOptions._();

  static const _devUrl = 'https://pb.elroir.cloud/';

  // static const _productionUrl = 'https://pb.elroir.cloud/';

  static const apiUrl = _devUrl;

  static const apiKey = 'Th7NtmYQeYAn9K5q';

  static PocketBase get pb => PocketBase(apiUrl);

}