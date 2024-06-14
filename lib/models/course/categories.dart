import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.imagePath,
    this.description,
  });

  const Category.empty()
      : this(
          id: 1,
          name: 'Writing',
          slug: 'Writing',
          imagePath: 'assets/icons/svg/pencil.svg',
          description: '',
        );

  const Category.w()
      : id = 1,
        name = ' ',
        slug = '',
        imagePath = '',
        description = '';

  Category.fromJson(Map<String, dynamic> json)
      : this(
          id: int.tryParse(json['id'].toString()) ?? 0,
          name: json['name'] as String,
          slug: json['slug'] as String,
          imagePath: json['imagePath'] as String,
          description: (json['description']) != null
              ? (json['description'] as String)
              : '',
        );

  final int id;
  final String name;
  final String slug;
  final String imagePath;
  final String? description;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'imagePath': imagePath,
        'description': description,
      };

  @override
  List<Object?> get props => [id, name, slug, description, imagePath];
}
