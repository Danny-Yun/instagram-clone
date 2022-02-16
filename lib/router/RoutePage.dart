import 'package:get/get.dart';
import 'package:instagram_clone/binding/NavigationControllerBinding.dart';
import 'package:instagram_clone/screen/NavigationScreen.dart';
import 'package:instagram_clone/screen/UploadScreen.dart';

class RoutePage {
  static movePage(String pageName) => Get.toNamed(pageName);

  static const String NAVIGATION_ROUTE = "/navigation";
  static const String HOME_ROUTE = "/home";
  static const String UPLOAD_ROUTE = "/upload";
  static const String SEARCH_SCREEN = "/searchScreen";
  static const String ACTIVE_SCREEN = "/activeScreen";
  static const String PROFILE_SCREEN = "/profileScreen";

  static final List<GetPage> getPageList = [
    GetPage(
      name: NAVIGATION_ROUTE,
      page: () => NavigationScreen(),
      binding: NavigationControllerBinding(),
    ),
    GetPage(
      name: HOME_ROUTE,
      page: () => NavigationScreen(),
    ),
    GetPage(
      name: UPLOAD_ROUTE,
      page: () => UploadScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
