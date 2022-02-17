import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/AvatarWidget.dart';
import 'package:instagram_clone/widgets/ImageData.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0,
      title: Image.asset(IconsPath.logo,
          width: 300 / Get.mediaQuery.devicePixelRatio),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.directMessage),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return ListView(
      children: [
        _storyBoardList(),
        // _postList(),
      ],
    );
  }

  // 스토리보드
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _myStory(),
          ...List.generate(
            100,
            (index) => Avatar(
              avatarType: TYPE.hasStory,
              thumbPath:
                  'http://static01.nyt.com/images/2012/02/02/sports/DUKE/DUKE-articleLarge.jpg?quality=75&auto=webp&disable=upscale',
            ),
          ),
        ],
      ),
    );
  }

  Widget _myStory() {
    return Stack(
      children: [
        Avatar(
          avatarType: TYPE.noStory,
          thumbPath:
              'https://images.pexels.com/photos/11146073/pexels-photo-11146073.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
          size: 67,
        ),
        Positioned(
          right: 1.7,
          bottom: 8,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 21),
          ),
        ),
      ],
    );
  }

  // Widget _postList() {
  //   return
  // }
}
