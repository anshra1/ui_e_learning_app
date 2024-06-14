import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    required this.items,
    required this.currentItem,
    required this.onChanged,
    super.key,
  });

  final List<String> items;
  final String currentItem;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: items.map(
            (item) {
              final isActivated =
                  currentItem.toLowerCase() == item.toLowerCase();
              return GestureDetector(
                onTap: () => onChanged(item),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 450),
                  padding:
                      const EdgeInsets.only(bottom: 4, right: 15, left: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: !isActivated ? null : context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 19.5,
                        color: !isActivated ? null : Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
