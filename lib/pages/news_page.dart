import 'package:flutter/material.dart';
import 'package:gemak/utulity/models.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class NewsPage extends StatelessWidget {


  NewsPage({Key? key,required this.newsList}) : super(key: key);

  late final List<NewsModel> newsList;

  final String title = "Haberler";


@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            NewsListWidget(newsItems: newsList)
          ],
        ));
  }
}

class NewsListWidget extends StatelessWidget {
  final List<NewsModel> newsItems;

  const NewsListWidget({Key? key, required this.newsItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          final newsItem = newsItems[index];
          final newsContent=[["https://www.gemak.com.tr/uploads/editor/buyuk_721ccb1e.JPG","https://www.gemak.com.tr/uploads/editor/buyuk_162ccb1e.JPG"],["https://www.gemak.com.tr/uploads/editor/buyuk_523ccb1e.JPG"],["https://www.gemak.com.tr/uploads/editor/buyuk_839ccb1e.JPG"],
          ["https://www.gemak.com.tr/uploads/editor/buyuk_924ccb1e.jpg","https://www.gemak.com.tr/uploads/editor/buyuk_825ccb1e.jpg"],
          ];
          return ListTile(onTap: ()=>_showNewsContent(context,newsItem,newsContent[index]),
            contentPadding: const EdgeInsets.all(8),
            leading: SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  newsItem.pic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              newsItem.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  newsItem.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  newsItem.date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
        childCount: newsItems.length,
      ),
    );
  }
  void _showNewsContent(BuildContext context, NewsModel newsItem, List<String> newsContent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(insetPadding: EdgeInsets.all(5),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItem.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          newsItem.date,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          newsItem.description,
                          style: TextStyle(fontSize: 18),
                        ),
                        Image.network(newsContent[0]),
                        newsContent.length==2 ? Image.network(newsContent[1]):Stack()
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Kapat',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NewsItem {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });
}
