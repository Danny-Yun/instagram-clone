import 'package:get/get.dart';
import 'package:instagram_clone/router/RoutePage.dart';

enum PAGE { home, search, upload, active, profile }

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt pageIdx = 0.obs;
  // 히스토리를 저장하는 리스트
  List<int> bottomHistory = [0];

  void changeIndex(int index, {bool hasGesture = true}) {
    var page = PAGE.values[index];
    switch (page) {
      case PAGE.home:
        _changePage(index, hasGesture);
        break;
      case PAGE.search:
        _changePage(index, hasGesture);
        break;
      case PAGE.upload:
        RoutePage.movePage(RoutePage.UPLOAD_ROUTE);
        break;
      case PAGE.active:
        _changePage(index, hasGesture);
        break;
      case PAGE.profile:
        _changePage(index, hasGesture);
        break;
    }
    // print('pageIdx - $pageIdx');
  }

  void _changePage(int index, bool hasGesture) {
    pageIdx(index);
    print('hasGesture - $hasGesture');
    // 뒤로가기 버튼을 누를 경우에 hasGesture가 false로 들어오면 히스토리에 인덱스 값을 추가하지 않도록 처리
    if (!hasGesture) return;
    // 추가할 인덱스가 가장 마지막 인덱스와 같지 않을 경우에만 추가 / 같은 페이지만 눌러도 추가가 안되도록
    if (bottomHistory.last != index) {
      bottomHistory.add(index);
    }
    print(bottomHistory);
  }

  // 뒤로가기 버튼을 눌렀을 경우
  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      print('Exit');
      return true;
    } else {
      // 최신 히스토리 삭제 후
      bottomHistory.removeLast();
      print('delete - $bottomHistory');
      // 마지막 인덱스의 페이지로 이동
      var index = bottomHistory.last;
      changeIndex(index, hasGesture: false);
      return false;
    }
  }
}
