import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/item_list_card.dart';

class MenuButtoned extends StatefulWidget {
  const MenuButtoned({super.key});

  @override
  State<MenuButtoned> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButtoned> {
  final lightModeNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    lightModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Text(
                'Other',
                style: p20.bold,
              ),
            ),
            ItemListCard(
              name: 'Light Model',
              onPressed: () =>
                  lightModeNotifier.value = !lightModeNotifier.value,
              icon: LineIcons.sunAlt,
              iconSize: 17,
              trailing: SizedBox(
                height: 17,
                child: ValueListenableBuilder<bool>(
                  valueListenable: lightModeNotifier,
                  builder: (_, lightModel, __) {
                    return Switch.adaptive(
                      value: lightModel,
                      onChanged: (value) {
                        lightModeNotifier.value = value;
                      },
                    );
                  },
                ),
              ),
            ),
            ItemListCard(
              onPressed: () => Share.share('Please Subscribe Us'),
              icon: LineIcons.gift,
              name: 'Invite Friends',
            ),
            ItemListCard(
              onPressed: () {},
              icon: LineIcons.userShield,
              name: 'User Agreement',
            ),
            const ItemListCard(
              name: 'Help and Feedback',
              icon: LineIcons.questionCircleAlt,
              iconSize: 26.5,
            ),
            const ItemListCard(
              name: 'Settings',
              icon: LineIcons.cog,
            ),
          ],
        ),
      ),
    );
  }
}
