import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/NavigationController.dart';
import 'package:instagram_clone/screen/HomeScreen.dart';
import 'package:instagram_clone/screen/SearchScreen.dart';
import 'package:instagram_clone/widgets/ImageData.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WillPopScope - 뒤로가기 버튼을 관리하고 history를 적용하기 위해 사용
    return WillPopScope(
      child: Scaffold(
        body: _body(),
        bottomNavigationBar: _bnb(),
      ),
      // 뒤로가기 버튼을 눌렀을 경우
      onWillPop: () async {
        bool result = await NavigationController.to.willPopAction();
        return result;
      },
    );
  }

  Widget _body() {
    return Obx(
      () => IndexedStack(
        index: NavigationController.to.pageIdx.value,
        children: [
          const HomeScreen(),
          Navigator(
            key: NavigationController.to.searchPageNavigationKey,
            onGenerateRoute: (RouteSetting) {
              return MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              );
            },
          ),
          Container(
            color: Colors.blueGrey,
            child: Center(child: Text('업로드')),
          ),
          Container(
            color: Colors.blueGrey,
            child: Center(child: Text('활동')),
          ),
          Container(
            color: Colors.blueGrey,
            child: Center(child: Text('프로필')),
          ),
        ],
      ),
    );
  }

  // 네비게이션 바
  Widget _bnb() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: NavigationController.to.pageIdx.value,
        elevation: 0,
        onTap: (int index) {
          // print(index);
          NavigationController.to.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.homeOff),
            activeIcon: ImageData(IconsPath.homeOn),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.searchOff),
            activeIcon: ImageData(IconsPath.searchOn),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.uploadIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.activeOff),
            activeIcon: ImageData(IconsPath.activeOn),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: CircleAvatar(
                radius: 13,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
