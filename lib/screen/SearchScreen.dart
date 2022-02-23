import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
    return Container();
  }
}
