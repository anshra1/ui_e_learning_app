import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({
    required this.name,
    required this.icon,
    this.iconSize,
    this.data, 
    this.trailing,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final double? iconSize;
  final String name;
  final String? data;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Icon(
                icon,
                size: iconSize,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
