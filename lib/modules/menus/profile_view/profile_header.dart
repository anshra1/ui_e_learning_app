import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:line_icons/line_icons.dart';

import 'package:ui_e_learning_app/components/common/photo_avtar.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/models/user/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          PhotoAvtar(
            photoUrl: user.profile.avatarURL,
            membership: user.membership,
            progress: user.leveling.progress,
            color: context.theme.primaryColor,
            isHideProgressBar: false,
            
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.7),
                  child: Text(
                    user.profile.firstname,
                    style: p21.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    user.profile.email,
                    style: p14.bold.grey,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Badge(
                badgeAnimation: BadgeAnimation.scale(),
                badgeContent: Text(
                  '7',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                child: Icon(
                  LineIcons.bell,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
