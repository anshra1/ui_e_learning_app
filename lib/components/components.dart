library component;


import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/app_bottom_bar_item.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/bottom_navigation_tile.dart';
import 'package:ui_e_learning_app/components/app_bottom_bar/bubble_bottom_cliper.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';

part 'app_bottom_bar/app_buttom_bar.dart';
part 'cards/learned_card.dart';
part 'cards/new_course_card.dart';
part 'cards/video_course_card.dart';
part 'cards/video_learning_card.dart';
part 'common/app_pull_refresh.dart';
part 'common/dot_container.dart';
part 'common/sub_header.dart';
part 'common/user_info.dart';
