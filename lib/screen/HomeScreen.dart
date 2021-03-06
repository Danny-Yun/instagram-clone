import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/AvatarWidget.dart';
import 'package:instagram_clone/widgets/ImageData.dart';
import 'package:instagram_clone/widgets/PostWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var storyImage;
  var profileImage;
  var postImage;
  var friendImage;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _images();
  }

  _images() {
    storyImage =
        'http://static01.nyt.com/images/2012/02/02/sports/DUKE/DUKE-articleLarge.jpg?quality=75&auto=webp&disable=upscale';
    postImage =
        'https://i.pinimg.com/originals/b4/23/08/b4230802ec5854745d89b1f0a186bfd5.jpg';
    profileImage =
        'https://images.pexels.com/photos/11146073/pexels-photo-11146073.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
    friendImage =
        'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  }

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
        Divider(),
        _postList(),
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
            (index) => Column(
              children: [
                Avatar(
                  avatarType: TYPE.hasStory,
                  thumbPath: storyImage,
                ),
                Text(
                  'riudiux',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _myStory() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Avatar(
              avatarType: TYPE.noStory,
              thumbPath: profileImage,
              size: 67,
            ),
            Positioned(
              right: 1,
              bottom: 6,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
        Text('내 스토리'),
      ],
    );
  }

  // 게시물
  Widget _postList() {
    return Column(
      children: List.generate(
        50,
        (index) => Post(
          postImage: postImage,
          friendImage: friendImage,
          size: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
