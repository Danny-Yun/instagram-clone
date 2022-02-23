import 'package:get/get.dart';
import 'package:instagram_clone/binding/NavigationControllerBinding.dart';
import 'package:instagram_clone/screen/NavigationScreen.dart';
import 'package:instagram_clone/screen/UploadScreen.dart';

class RoutePage {
  static movePage(String pageName) => Get.toNamed(pageName);

  static const String NAVIGATION_ROUTE = "/navigation";
  static const String UPLOAD_ROUTE = "/upload";

  static final List<GetPage> getPageList = [
    GetPage(
      name: NAVIGATION_ROUTE,
      page: () => NavigationScreen(),
      binding: NavigationControllerBinding(),
    ),
    GetPage(
      name: UPLOAD_ROUTE,
      page: () => UploadScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
