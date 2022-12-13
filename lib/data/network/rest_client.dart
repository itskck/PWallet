import 'package:dio/dio.dart';
import 'package:pwallet/constants.dart';
import 'package:pwallet/data/ipdata/ipdata.dart';

class RestClient {
  static Future<IpData> getIpData() async {
    try {
      final Response<Map<String, Object?>> response = await Dio().get(
        'http://ip-api.com/json/',
      );
      final IpData ipData = IpData.fromJson(response.data!);
      return ipData;
    } on Exception catch (_) {
      return errorIpData;
    }
  }
}
