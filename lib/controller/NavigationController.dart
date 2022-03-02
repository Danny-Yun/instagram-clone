import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/router/RoutePage.dart';
import 'package:instagram_clone/widgets/MessagePopup.dart';

enum PAGE { home, search, upload, active, profile }

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt pageIdx = 0.obs;
  // 히스토리를 저장하는 리스트
  List<int> bottomHistory = [0];

  GlobalKey<NavigatorState> searchPageNavigationKey =
      GlobalKey<NavigatorState>();

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
      // 나가기 전 확인하는 팝업메시지
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '앱을 종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: () {
            Get.back();
          },
        ),
      );
      print('Exit');
      return true;
    } else {
      var page = PAGE.values[bottomHistory.last];
      if (page == PAGE.search) {
        var value = await searchPageNavigationKey.currentState!.maybePop();
        if (value) return false;
      }

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
