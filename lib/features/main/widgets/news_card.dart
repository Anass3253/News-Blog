import 'package:flutter/material.dart';
import 'package:news_blog/core/models/article.dart';
import 'package:news_blog/features/article_details/article_details_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  article.urlToImage.toString(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(article.author!),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        article.description!,
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
