class Lesson {
  Lesson({
    required this.id,
    required this.number,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    required this.videoDuration,
    required this.countVideoPlays,
    required this.progress,
  });

  

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: int.tryParse(json['id'].toString()) ?? 0,
      number: int.tryParse(json['number'].toString()) ?? 0,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      videoDuration: json['videoDuration'] as String,
      countVideoPlays: json['countVideoPlays'] as int,
      progress: double.tryParse(json['progress'].toString()) ?? 0.0,
    );
  }
  final int id;
  final int number;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String videoDuration;
  final int countVideoPlays;
  final double progress;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'title': title,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'videoDuration': videoDuration,
        'countVideoPlays': countVideoPlays,
        'progress': progress,
      };
}
