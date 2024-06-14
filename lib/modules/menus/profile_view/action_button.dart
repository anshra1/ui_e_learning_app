import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () async {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade300,
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: .2,
          textStyle: const TextStyle(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: const Icon(
          LineIcons.alternateSignOut,
          size: 27,
          color: AppColors.white,
        ),
        label: Text(
          'Sign Out',
          style: p21.white,
        ),
      ),
    );
  }
}
