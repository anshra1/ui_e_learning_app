import 'dart:math';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:line_icons/line_icons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

class PhotoAvtar extends StatelessWidget {
  const PhotoAvtar({
    super.key,
    this.photoUrl,
    this.heroTag,
    this.membership,
    this.progress,
    this.color,
    this.isHideProgressBar,
  });

  final String? photoUrl;
  final String? heroTag;
  final String? membership;
  final int? progress;
  final Color? color;
  final bool? isHideProgressBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isHideProgressBar!
          ? photoUrl?.isEmpty ?? true
              ? emptyPhotoBorder(context)
              : EmptyWidget(heroTag: heroTag, photoUrl: photoUrl)
          : profileWidget(context),
    );
  }

  Widget emptyPhoto(BuildContext context) {
    return Hero(
      tag: 'empty-avtar${heroTag ?? Random().nextInt(100).toString()}',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 70,
        child: Center(
          child: Icon(
            LineIcons.alternateUser,
            size: 50,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget emptyPhotoBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.theme.primaryColor,
        ),
      ),
      child: Hero(
        tag: 'empty-avtar${heroTag ?? Random().nextInt(100).toString()}',
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 70,
          child: Center(
            child: Icon(
              LineIcons.alternateUser,
              size: 70,
              color: context.theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }

  Stack profileWidget(BuildContext context) {
    return Stack(
      children: [
        CircularStepProgressIndicator(
          padding: 0,
          currentStep: progress!,
          totalSteps: 100,
          selectedStepSize: 3.7,
          width: 65,
          height: 65,
          startingAngle: 2.3,
          selectedColor: color ?? Colors.yellow.shade600,
          roundedCap: (_, __) => true,
          child: Center(
            child: photoUrl?.isEmpty ?? true
                ? emptyPhoto(context)
                : Hero(
                    tag:
                        'empty-avtar${heroTag ?? Random().nextInt(100).toString()}',
                    child: CachedNetworkImage(
                      imageUrl: photoUrl!,
                      errorWidget: (context, url, error) => const CircleAvatar(
                        maxRadius: 27,
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: imageProvider,
                      ),
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: -2,
          child: Badge(
            badgeAnimation: const BadgeAnimation.scale(),
            badgeStyle: BadgeStyle(
              shape: BadgeShape.square,
              badgeColor: color ?? Colors.yellow.shade600,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.2),
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.white, width: 2),
              elevation: 0,
            ),
            badgeContent: Text(
              membership ?? 'Free',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    required this.heroTag,
    required this.photoUrl,
    super.key,
  });

  final String? heroTag;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'empty-avtar${heroTag ?? Random().nextInt(100).toString()}',
      child: CachedNetworkImage(
        imageUrl: photoUrl!,
        errorWidget: (context, url, error) => const CircleAvatar(maxRadius: 27),
        imageBuilder: (context, imageProvier) => CircleAvatar(
          maxRadius: 27,
          backgroundColor: Colors.white,
          backgroundImage: imageProvier,
        ),
      ),
    );
  }
}
