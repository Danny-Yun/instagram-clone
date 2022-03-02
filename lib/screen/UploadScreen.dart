import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/ImageData.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0,
      // 취소 버튼
      leading: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageData(IconsPath.closeImage),
        ),
      ),
      title: Text('새 게시물',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      // 다음 버튼
      actions: [
        TextButton(
          onPressed: () {},
          child: Text('다음',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _imagePreview(),
          _header(),
          _imageSelectList(),
        ],
      ),
    );
  }

  Widget _imagePreview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.grey,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  '갤러리',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff808080),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    SizedBox(width: 5),
                    Text(
                      '여러 항목 선택',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xff808080),
                  shape: BoxShape.circle,
                ),
                child: ImageData(IconsPath.cameraIcon),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
      ),
      itemCount: 100,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://images.pexels.com/photos/5232220/pexels-photo-5232220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
      },
    );
  }
}
