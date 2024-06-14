import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({required this.courses, super.key});

  final List<VideoCourse> courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
      margin:
          const EdgeInsets.only(right: 18.5, left: 18.5, bottom: 20, top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 8),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SubHeader(
              title: 'My Courses',
              onPressed: () {},
            ),
          ),
          const Gap(23),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight * .38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: courses
                  .take(2)
                  .map(
                    (e) => buildMyCourses(
                      context,
                      imageUrl: e.imageUrl,
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }

  Widget buildMyCourses(
    BuildContext context, {
    required String imageUrl,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            SizedBox(
              height: context.screenHeight * .38,
              width: context.screenHeight * .38,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => const SizedBox(),
                imageBuilder: (context, imageAsset) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
