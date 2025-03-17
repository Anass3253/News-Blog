import 'package:flutter/material.dart';
import 'package:news_blog/core/models/article.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({super.key, required this.article});
  final Article article;
  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.article.urlToImage!),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('By ${widget.article.author}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.article.content!,
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
