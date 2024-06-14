import 'package:flutter_test/flutter_test.dart';
import 'package:ui_e_learning_app/dummies/categories_dummy.dart';
import 'package:ui_e_learning_app/models/course/categories.dart';

void main() {
  const tCategories = Category.empty();
  final tMap = categoriesJSON[0];

  setUp(
    () {},
  );
  group(
    'Categories',
    () {
      test(
        'should a categories',
        () {
          expect(tCategories, isA<Category>());
        },
      );

      test(
        'should return an empty an EmptyCategory',
        () {
          expect(tCategories.name, 'Writing');
        },
      );

      test(
        'should return a CategoryClass from the jsonData',
        () {
          final result = Category.fromJson(tMap);
          

          expect(result, equals(tCategories));
        },
      );
    },
  );
}
