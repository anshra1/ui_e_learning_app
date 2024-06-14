import 'package:flutter_test/flutter_test.dart';
import 'package:ui_e_learning_app/dummies/video_courses_dummy.dart';
import 'package:ui_e_learning_app/models/course/comment.dart';

void main() {
  final tComment = Comment.empty();

  setUp(
    () {},
  );

  group(
    'comment',
    () {
      test(
        'should a Comment',
        () {
          expect(tComment, isA<Comment>());
        },
      );

      test(
        ' From Json - should  return Comment when json  Data Given ',
        () {
          // ignore: lines_longer_than_80_chars
          final s =
              videoCoursesJSON[0]['comments']! as List<Map<String, dynamic>>;
          final map = s[0];

          final result = Comment.fromJson(map);

          expect(result.id, tComment.id);
          expect(result.text, tComment.text);
          //     expect(result.user, tComment.user);
          //    expect(result.createdAt?.day, equals(tComment.createdAt?.day));
        },
      );
    },
  );
}
