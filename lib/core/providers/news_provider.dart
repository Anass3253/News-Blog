import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_blog/core/models/article.dart';
import 'package:http/http.dart' as http;

class ArticlesProvider extends StateNotifier<AsyncValue<List<Article>>> {
  ArticlesProvider() : super(const AsyncValue.loading());
  final String apiKey = '55739d8840e948559a0f7be37314b6f5';
  final String baseUrl = 'https://newsapi.org/v2';

  Future<void> fetchNews() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/top-headlines?country=us&apiKey=$apiKey&pageSize=20'),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesJson = data['articles'];

      final List<Article> articles = articlesJson
          .map(
            (article) => Article.fromJson(article),
          )
          .toList();
      state = AsyncValue.data(articles);
    } catch (e, stackTrace) {
      print(e);
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> searchNews(String topic) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/everything?q=$topic&country=us&apiKey=$apiKey'),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesJson = data['articles'];

      final List<Article> articles = articlesJson
          .map(
            (article) => Article.fromJson(article),
          )
          .toList();
      state = AsyncValue.data(articles);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final articlesProvider =
    StateNotifierProvider<ArticlesProvider, AsyncValue<List<Article>>>(
  (ref) => ArticlesProvider(),
);
