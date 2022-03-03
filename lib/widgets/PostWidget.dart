import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/AvatarWidget.dart';
import 'package:instagram_clone/widgets/ImageData.dart';

class Post extends StatelessWidget {
  Post(
      {required this.postImage,
      required this.friendImage,
      required this.size,
      Key? key})
      : super(key: key);

  var postImage;
  var friendImage;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          _image(),
          _icons(),
          _infoDescription(),
          _replyTextBtn(),
          _dateAgo(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Row(
        children: [
          Avatar(
            avatarType: TYPE.hasStory,
            thumbPath: friendImage,
            size: 32,
          ),
          Text(
            'nickname',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.more_horiz, size: 22),
          ),
          SizedBox(width: 13),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      width: size,
      height: size,
      fadeInDuration: Duration(milliseconds: 500),
      fadeOutDuration: Duration(milliseconds: 500),
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      imageUrl: postImage,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _icons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 70,
              ),
              SizedBox(width: 12),
              ImageData(
                IconsPath.replyIcon,
                width: 65,
              ),
              SizedBox(width: 12),
              ImageData(
                IconsPath.directMessage,
                width: 60,
              ),
            ],
          ),
          Spacer(),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 55,
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 좋아요 정보
          const Text(
            '좋아요 127개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          // 게시물 코멘트
          ExpandableText(
            'hello this is my dream\nhello this is my dream\nhello this is my dream\nhello this is my dream\nhello this is my dream\n',
            prefixText: 'nickname',
            onPrefixTap: () {
              print('프로필로 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더 보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Text(
          '댓글 13개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일 전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}
