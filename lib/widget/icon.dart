import 'package:flutter/material.dart';

enum IconName {
  profileUser1,
  profileUser2,
  profileUser3,
  profileUser4,
  profileUser5,
  profileUser6,
  profileStaff1,
  profileStaff2,
  profileStaff3,
  profileStaff4,
  profileStaff5,
  profileStaff6,
  bottomBarIconChat,
  bottomBarIconCommunity,
  bottomBarIconNote,
  bottomBarIconBooking,
}

class CustomIcon extends StatelessWidget {
  final IconName name;
  final double? width;
  final double? height;
  final Color? color;
  const CustomIcon(this.name, {this.width, this.height, this.color, super.key});

  Widget _pngImage(String path) {
    return Image.asset('asset/icons/$path.png', width: width, height: height, color: color);
  }

  @override
  Widget build(BuildContext context) {
    switch (name) {
      case IconName.profileUser1:
        return _pngImage('profile1');

      case IconName.profileUser2:
        return _pngImage('profile2');

      case IconName.profileUser3:
        return _pngImage('profile3');

      case IconName.profileUser4:
        return _pngImage('profile4');

      case IconName.profileUser5:
        return _pngImage('profile4');

      case IconName.profileUser6:
        return _pngImage('profile6');

      case IconName.bottomBarIconChat:
        return _pngImage('chat_icon');

      case IconName.bottomBarIconNote:
        return _pngImage('note_icon');

      case IconName.bottomBarIconBooking:
        return _pngImage('calendar_icon');

      case IconName.bottomBarIconCommunity:
        return _pngImage('comminity_icon');

      default:
        return Container();
    }
  }
}
