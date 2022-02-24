import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gridIndex = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gridIndex != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gridIndex].add(size);
      groupIndex[gridIndex] += size;
    }
    print(groupBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 스크롤을 내렸을 때 앱바가 고정이 아니어야 해서 앱바가 body에 들어감
            _appbar(),
            _body(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.fromLTRB(15, 10, 5, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffefefef),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  '검색',
                  style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                  groupBox[index].length,
                  (value) => Container(
                    height: Get.width * 0.33 * groupBox[index][value],
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.pexels.com/photos/2205647/pexels-photo-2205647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      fit: BoxFit.cover,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
