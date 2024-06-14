import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_e_learning_app/models/course/categories.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    required this.categories,super.key, 
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories
            .map(
              (item) => _MenuButton(
                onPressed: () {},
                title: item.name,
                imagePath: item.imagePath,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const radius = 17.00;

    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(radius),
          child: Ink(
            padding: const EdgeInsets.all(12),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFF94BFF8).withOpacity(0.3),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: SvgPicture.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 13.5),
          ),
        ),
      ],
    );
  }
}
