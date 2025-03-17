import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_blog/core/models/article.dart';

class NewsService {
  final String apiKey = '55739d8840e948559a0f7be37314b6f5';
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesJson = data['articles'];
      final List<Article> articles = articlesJson
          .map(
            (article) => Article.fromJson(articlesJson as Map<String, dynamic>),
          )
          .toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> publishNews(Map<String, dynamic> newsData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/articles?apiKey=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newsData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to publish news');
    }
  }
}
