import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gemak/wigdets/firstslide.dart';
import 'package:gemak/wigdets/footer.dart';
import 'package:gemak/wigdets/kesfedin_widget.dart';
import 'package:gemak/wigdets/newswidget.dart';
import 'package:gemak/wigdets/satislar.dart';
import 'package:gemak/wigdets/secondslide.dart';
import 'package:gemak/wigdets/tiles.dart';

import '../utulity/models.dart';
import '../wigdets/buildCustomWidget.dart';

class HomePage extends StatefulWidget {
  List<PicSlideModel> firstSlides;
  List<SecondSlideModel> secondSlides;
  List<NewsModel> newsList;
  List<SatisModel> satisList;
  List<String> kurumsalList;
  List<String> urunlerList;
  List<String> temsilcilikler;
  List<String> endustrialanlari;
  List<String> solutions;
  List<String> rd;
  List<String> hr;

  HomePage(
      {Key? key,
      required this.firstSlides,
      required this.secondSlides,
      required this.newsList,
      required this.satisList,
      required this.kurumsalList,
      required this.urunlerList,
      required this.temsilcilikler,
      required this.endustrialanlari,
      required this.solutions,
      required this.rd,
      required this.hr})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _customTileTrailing = false;
  late List<Map> draweList = [
    {"label": "KURUMSAL", "item": widget.kurumsalList},
    {"label": "İNSAN KAYNAKLARI", "item": widget.hr},
    {"label": "ÜRÜNLERİMİZ", "item": widget.urunlerList},
    {"label": "TEMSİLCİLİKLERİMİZ", "item": widget.temsilcilikler},
    {"label": "ENDÜSTRİLER", "item": widget.endustrialanlari},
    {"label": "ÇÖZÜMLER", "item": widget.solutions},
    {"label": "AR-GE", "item": widget.rd},
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: FirstSlide(slides: widget.firstSlides),
          ),
          SliverToBoxAdapter(child: SecondSlide(slides: widget.secondSlides)),
          SliverToBoxAdapter(
            child: FirstNews(widget.newsList),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return NewsWidget(widget.newsList, index + 1);
          }, childCount: widget.newsList.length - 1)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                  child: const Text("GEMAK İLE ÜRETİN",
                      style: TextStyle(
                        color: Color(0xFF004A87),
                        fontSize: 35,
                      )),
                ),
                buildDivider()
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SatisWidget(widget.satisList, 0),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return SatisWidget(widget.satisList, index + 1);
          }, childCount: widget.satisList.length - 1)),
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: const Text("KEŞFEDİN",
                    style: TextStyle(
                      color: Color(0xFF004A87),
                      fontSize: 35,
                    )),
              ),
              buildDivider(),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return KesfedinWidget(index);
          }, childCount: 3)),
          const SliverToBoxAdapter(
            child: Footer(),
          )
        ],
      ),
      drawer: Drawer(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: buildDrawerHeader(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return CustomExpansionTile(
                label: draweList[index]["label"],
                isExpanded: _customTileTrailing,
                item: draweList[index]["item"]);
          }, childCount: draweList.length))
        ]),
      ),
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: const Icon(
                Icons.phone,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: const Icon(Icons.location_on_outlined),
            ),
          ],
        ));
  }
}
