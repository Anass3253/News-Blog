import 'package:news_blog/core/models/source.dart';

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? 'no-author',
      title: json['title'] ?? 'no-title',
      description: json['description'] ?? 'no-description',
      url: json['url'] ?? 'no-url',
      urlToImage: json['urlToImage'] ??
          'https://www.intl-spectrum.com/articles/a425/ArticleDefault.jpg?x=80x56',
      publishedAt: json['publishedAt'] ?? 'no-publishedAt',
      content: json['content'] ?? 'no-content',
    );
  }
}
