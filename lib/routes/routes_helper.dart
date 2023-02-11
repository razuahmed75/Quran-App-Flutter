import 'package:get/get.dart';
import 'package:quran_app/routes/routes_name.dart';
import 'package:quran_app/views/home.dart';

class RouteHelper {
  static String getInitial() => RouteName.home;

  static List<GetPage> routes() => [
        GetPage(name: RouteName.home, page: () => HomePage()),
      ];
}
