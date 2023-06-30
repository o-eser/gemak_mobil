import 'package:flutter/material.dart';

import '../utulity/models.dart';

class FirstNews extends StatelessWidget {
  List<NewsModel> news = [];

  FirstNews(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: const Text("HABERLER",
                    style: TextStyle(
                      color: Color(0xFF004A87),
                      fontSize: 35,
                    )),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 25, bottom: 5),
                child: InkWell(onTap: (){Navigator.pushNamed(context, "/newspage");},
                  child: const Text("Tüm Haberler",
                      style: TextStyle(
                        color: Color(0xFF004A87),
                        fontSize: 15,
                      )),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 4,
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Image.network(news.first.pic),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(news.first.date),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 300,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(news.first.title,
                style: const TextStyle(
                  color: Color(0xFF054F7D),
                  fontSize: 24,
                )),
          ),
          const Divider(
            color: Colors.black,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              news.first.description,
              style: const TextStyle(color: Color(0xFF5A5A5A), fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  List<NewsModel> news = [];
  int index;

  NewsWidget(this.news, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: Image.network(news[index].pic),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(news[index].date),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 300,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(news[index].title,
                style: const TextStyle(
                  color: Color(0xFF054F7D),
                  fontSize: 24,
                )),
          ),
          const Divider(
            color: Colors.black,
            height: 10,
          )
        ],
      ),
    );
  }
}
