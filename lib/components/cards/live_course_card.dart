import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/cores/extensions/data_time.dart';
import 'package:ui_e_learning_app/models/course/live_course.dart';

class LiveCourseCard extends StatelessWidget {
  const LiveCourseCard({
    required this.item,
    required this.onPressed,
    super.key,
  });

  final LiveCourse item;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const textGreyStyle = TextStyle(color: AppColors.grey, fontSize: 15);
    const radius = 15.0;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: 100,
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
                Positioned(
                  top: 8,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    child: SvgPicture.asset(
                      Assets.iconsSVG.premium,
                      height: 13,
                      width: 13,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3 ),
                          child: UserInfo(
                            onPressed: () {},
                            title: item.teacher.name,
                            avatarURL: item.teacher.avatarURL,
                            maxRadius: 10,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          item.title.overflow,
                          style: p18.bold,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Expanded(
                          child: Text(
                            item.liveDuration,
                            style: textGreyStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                item.liveTime.toStringByFormat('dd-mm h:mm a'),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const Gap(6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4.5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  item.level,
                                  overflow: TextOverflow.ellipsis,
                                  style: textGreyStyle.copyWith(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
