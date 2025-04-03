class NewsModel {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String imageUrl;
  final DateTime publishDate;

  NewsModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.imageUrl,
    required this.publishDate,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      summary: json['summary'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      publishDate: json['publishDate'] != null 
          ? (json['publishDate'] is DateTime 
              ? json['publishDate'] 
              : DateTime.parse(json['publishDate']))
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'content': content,
      'imageUrl': imageUrl,
      'publishDate': publishDate.toIso8601String(),
    };
  }
}
