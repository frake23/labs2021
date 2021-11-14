import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future<String> calculate() async {
  var dio = Dio();
  var cookieJar= new PersistCookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var response = await dio.get("https://mangalib.me/search?type=manga&q=naruto");
  return response.data.toString();

}
