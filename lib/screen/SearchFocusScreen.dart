import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/ImageData.dart';

class SearchFocusScreen extends StatefulWidget {
  const SearchFocusScreen({Key? key}) : super(key: key);

  @override
  State<SearchFocusScreen> createState() => _SearchFocusScreenState();
}

class _SearchFocusScreenState extends State<SearchFocusScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<String> tabLabel = ['인기', '계정', '오디오', '태그', '장소'];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabLabel.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SafeArea(
        child: DefaultTabController(
          length: tabLabel.length,
          child: Column(
            children: [
              Expanded(child: _tabBarView()),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0,
      // 뒤로가기 버튼
      leading: GestureDetector(
        onTap: Get.back,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageData(IconsPath.backBtnIcon),
        ),
      ),
      // leading과 title 간의 간격 삭제
      titleSpacing: 0,
      // 검색 영역
      title: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffefefef),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색',
            contentPadding: EdgeInsets.all(10),
            isDense: true,
          ),
        ),
      ),
      // 탭바 영역
      bottom: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.05)),
              bottom: BorderSide(color: Color(0xffe4e4e4)),
            ),
          ),
          height: AppBar().preferredSize.height,
          width: Size.infinite.width,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade400,
            indicatorColor: Colors.black,
            tabs: List.generate(
              tabLabel.length,
              (index) => Tab(
                text: tabLabel[index],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
    );
  }

  // 탭바 뷰
  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        Container(
          child: Center(
            child: Text('aaa'),
          ),
        ),
        Container(
          child: Center(
            child: Text('bbb'),
          ),
        ),
        Container(
          child: Center(
            child: Text('ccc'),
          ),
        ),
        Container(
          child: Center(
            child: Text('ddd'),
          ),
        ),
        Container(
          child: Center(
            child: Text('eee'),
          ),
        ),
      ],
    );
  }
}
