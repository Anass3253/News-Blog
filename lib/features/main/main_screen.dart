import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_blog/core/models/article.dart';
import 'package:news_blog/core/providers/news_provider.dart';
import 'package:news_blog/features/main/widgets/news_card.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    Future(
      () {
        ref.watch(articlesProvider.notifier).fetchNews();
      },
    );
    super.initState();
  }

  void _searchFunc(String topic){
    ref.watch(articlesProvider.notifier).searchNews(topic);
  }

  @override
  Widget build(BuildContext context) {
    final newsAsyncValue = ref.watch(articlesProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search for a topic....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 3),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _searchFunc(searchController.text);
                      });
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            newsAsyncValue.when(
              data: (news) {
                Widget content = news.isEmpty
                    ? Center(
                        child: Text('No such an article!'),
                      )
                    : SizedBox(
                        height: 800,
                        child: ListView.builder(
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            final Article article = news[index];
                            return NewsCard(article: article);
                          },
                        ),
                      );
                return content;
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ],
        )),
      ),
    );
  }
}
