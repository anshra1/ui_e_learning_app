import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_e_learning_app/components/buttons/app_rounded_button.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/cores/extensions/data_time.dart';
import 'package:ui_e_learning_app/models/course/live_course.dart';

class AppointmentDialog extends StatelessWidget {
  const AppointmentDialog({required this.item, super.key});

  final LiveCourse item;

  @override
  Widget build(BuildContext context) {
    const radius = 20.0;
    final width = context.screenWidth * .9;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      errorWidget: (context, url, error) => const SizedBox(),
                      imageBuilder: (context, assetProvider) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: MemoryImage(kTransparentImage),
                            image: assetProvider,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title.overflow,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: p22.bold,
                        ),
                        const Gap(17),
                        Row(
                          children: [
                            Flexible(
                              child: UserInfo(
                                onPressed: () {},
                                title: item.teacher.name,
                                titleStyle: p16.grey,
                                avatarURL: item.teacher.avatarURL,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.grey,
                                ),
                                const Gap(6),
                                Text(
                                  item.liveTime
                                      .toDDMMhmmaFormat()
                                      .toLowerCase(),
                                  style: p16.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 17),
                    child: AppRoundedButton(
                      onPressed: () => context.pop(),
                      label: 'Appointment Now',
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          Assets.iconsSVG.premium,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            IconButton(
              onPressed: context.mayBePop,
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.class_rounded,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
