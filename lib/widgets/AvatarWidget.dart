import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum TYPE { hasStory, noStory, type3 }

class Avatar extends StatelessWidget {
  Avatar({
    Key? key,
    required this.avatarType,
    required this.thumbPath,
    this.size = 65,
  }) : super(key: key);

  TYPE avatarType;
  String thumbPath;
  double size;

  @override
  Widget build(BuildContext context) {
    switch (avatarType) {
      case TYPE.hasStory:
        return AvatarType1();
        break;
      case TYPE.noStory:
        return AvatarType2();
        break;
      case TYPE.type3:
        return Container();
        break;
    }
  }

  // 스토리가 있는 아바타
  Widget AvatarType1() {
    return Container(
      margin: const EdgeInsets.fromLTRB(6, 8, 6, 4),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.orange]),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: Container(
              width: size,
              height: size,
              child: CachedNetworkImage(
                imageUrl: thumbPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 스토리가 없는 아바타
  Widget AvatarType2() {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.fromLTRB(8, 8, 7, 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: Container(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
