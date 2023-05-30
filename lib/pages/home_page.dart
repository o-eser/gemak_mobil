import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gemak/utulity/openurl.dart';
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
  List<String> gallery;

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
      required this.hr,
      required this.gallery})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _drawerKey = GlobalKey();

  final bool _customTileTrailing = false;
  late List<Map> draweList = [
    {"label": "KURUMSAL", "item": widget.kurumsalList},
    {"label": "İNSAN KAYNAKLARI", "item": widget.hr},
    {"label": "ÜRÜNLERİMİZ", "item": widget.urunlerList},
    {"label": "TEMSİLCİLİKLERİMİZ", "item": widget.temsilcilikler},
    {"label": "ENDÜSTRİLER", "item": widget.endustrialanlari},
    {"label": "ÇÖZÜMLER", "item": widget.solutions},
    {"label": "AR-GE", "item": widget.rd},{"label": "GALERİ", "item": widget.gallery},
  ];
  double drawerWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        drawerWidth = getDrawerWidth();
      });
    });
  }

  double getDrawerWidth() {
    final RenderBox? renderBox =
        _drawerKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
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
      endDrawer: Drawer(
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
          }, childCount: draweList.length)),
          SliverToBoxAdapter(
            child: buildInkWell("Online Eşanjör Satış", "https://esanjorsatis.com/"),
          ),
          SliverToBoxAdapter(
            child: buildInkWell(
                "Online Pompa Satış", "https://www.gemak.com.tr/pompa-satis"),
          ),
          SliverToBoxAdapter(
            child: buildInkWell(
                "Online Atık Su Sistemleri Satış", "https://flowell.com.tr/"),
          )
        ]),
      ),
    );
  }

  InkWell buildInkWell(String title, String link) {
    return InkWell(
      child: Card(
          elevation: 5,
          color: Colors.deepOrange,
          child: SizedBox(
            height: 40,
            child: Center(
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
          )),
      onTap: () => openURL("link"),
    );
  }

  DrawerHeader buildDrawerHeader() {
    String phone = "+903126413252";
    String location =
        "https://www.google.com/maps/place/GEMAK+GIDA+END.+MAK.+VE+T%C4%B0C.+A.%C5%9E./@39.792496,32.442489,15z/data=!4m6!3m5!1s0x14d31d26ac838581:0x3cd187fe6134458!8m2!3d39.7924961!4d32.4424893!16s%2Fg%2F11h_4867h6?hl=tr&entry=ttu";
    List<String> socialMediaUrl = [
      "https://www.facebook.com/gemakfoodindustry/",
      "https://www.linkedin.com/company/gemakfoodindustry/",
      "https://www.instagram.com/gemakfoodindustry/",
      "https://www.youtube.com/@gemakfoodindustry6107"
    ];
    List<Widget> socialMediaIcon = [
      Icon(Icons.facebook_outlined,color: Color(0xff1877F2),),
      Icon(FontAwesomeIcons.linkedin,color:Color(0xff0A66C2) ,),
      Icon(FontAwesomeIcons.instagram,color: Color(0xffE4405F),),
      Icon(FontAwesomeIcons.youtube,color: Color(0xffFF0000),)
    ];
    return DrawerHeader(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                drawerWidgets(() => launchPhoneCall(phone), Icon(Icons.phone),
                    drawerWidth / 8),
                drawerWidgets(() => launchMaps(location), Icon(Icons.location_on_outlined),
                    drawerWidth / 8),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                drawerWidgets(()=>openURL(socialMediaUrl[0]), socialMediaIcon[0],
                    drawerWidth / (socialMediaUrl.length * 4.2)),
                drawerWidgets(()=>openURL(socialMediaUrl[1]), socialMediaIcon[1],
                    drawerWidth / (socialMediaUrl.length * 4.2)),
                drawerWidgets(()=>openURL(socialMediaUrl[2]), socialMediaIcon[2],
                    drawerWidth / (socialMediaUrl.length * 4.2)),
                drawerWidgets(()=>openURL(socialMediaUrl[3]), socialMediaIcon[3],
                    drawerWidth / (socialMediaUrl.length * 4.2)),
              ],
            )
          ],
        ));
  }

  Container drawerWidgets(_onTap, Widget _icon, double widht) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, left: widht, right: widht, top: 20),
      child: InkWell(
        onTap: _onTap,
        child: _icon,
      ),
    );
  }
}
