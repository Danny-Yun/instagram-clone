import 'package:get/get.dart';
import 'package:instagram_clone/router/RoutePage.dart';

enum PAGE { home, search, upload, active, profile }

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt pageIdx = 0.obs;

  void changeIndex(int index) {
    var page = PAGE.values[index];
    switch (page) {
      case PAGE.home:
        _changePage(index);
        break;
      case PAGE.search:
        _changePage(index);
        break;
      case PAGE.upload:
        RoutePage.movePage(RoutePage.UPLOAD_ROUTE);
        break;
      case PAGE.active:
        _changePage(index);
        break;
      case PAGE.profile:
        _changePage(index);
        break;
    }
    // print('pageIdx - $pageIdx');
  }

  void _changePage(int index) {
    pageIdx(index);
  }
}
