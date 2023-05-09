import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemak/inhwidget.dart';
import 'package:gemak/pages/industries_pages/chemistry_page.dart';
import 'package:gemak/pages/industries_pages/dairy_page.dart';
import 'package:gemak/pages/industries_pages/drink_page.dart';
import 'package:gemak/pages/industries_pages/energy_page.dart';
import 'package:gemak/pages/industries_pages/medicine_page.dart';
import 'package:gemak/pages/product_pages/cip_page.dart';
import 'package:gemak/pages/product_pages/cooker_page.dart';
import 'package:gemak/pages/product_pages/deoderizt%C3%B6r_page.dart';
import 'package:gemak/pages/product_pages/excahnger_test_page.dart';
import 'package:gemak/pages/product_pages/freezer_page.dart';
import 'package:gemak/pages/kurumsal_page/hakkimizda.dart';
import 'package:gemak/pages/product_pages/heat_exchanger_page.dart';
import 'package:gemak/pages/product_pages/homojenizator_page.dart';
import 'package:gemak/pages/kurumsal_page/isg_page.dart';
import 'package:gemak/pages/kurumsal_page/kalite_page.dart';
import 'package:gemak/pages/product_pages/oil_smelting_page.dart';
import 'package:gemak/pages/product_pages/past_page.dart';
import 'package:gemak/pages/product_pages/pompa_page.dart';
import 'package:gemak/pages/product_pages/ribbon_blender_page.dart';
import 'package:gemak/pages/product_pages/seperator_page.dart';
import 'package:gemak/pages/product_pages/standardizator_page.dart';
import 'package:gemak/pages/product_pages/sterilizator_page.dart';
import 'package:gemak/pages/kurumsal_page/tanitim_film_page.dart';
import 'package:gemak/pages/product_pages/tank_page.dart';
import 'package:gemak/pages/kurumsal_page/tarihce_page.dart';
import 'package:gemak/pages/product_pages/valve_cluster_page.dart';
import 'package:gemak/pages/representatives_page/alfa_laval_page.dart';
import 'package:gemak/pages/representatives_page/bertolli_page.dart';
import 'package:gemak/pages/representatives_page/others_page.dart';
import 'package:gemak/pages/representatives_page/teknoice_page.dart';
import 'package:gemak/utulity/http_helper.dart';

import 'pages/home_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(ContextWidget(
    httpHelper: HttpHelper(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _videoUrl;
  final HttpHelper _helper = HttpHelper();
  bool _data = false;
  bool _data1 = false;
  final List<String> kurumsalList = [
    "HAKKIMIZDA",
    "TARİHÇE",
    "KALİTE POLİTİKAMIZ",
    "ÇEVRE POLİTİKASI",
    "KURUMSAL TANITIM FİLMİ"
  ];
  final List<String> temsilcilikler = [
    "Alfa Laval",
    "Andritz & Frautech",
    "Au2mate",
    "Bertoli",
    "Cmt Atomizers",
    "Endress + Hauser EH",
    "Grundfos",
    "Teknoice"
  ];
  final List<String> urunlerList = [
    "PASTÖRİZATÖR",
    "YIKAMA SİSTEMİ (CIP)",
    "STANDARDİZATÖR",
    "VANA TARLASI",
    "HOMOJENİZATOR",
    "VAKUMLU PİŞİRİCİ (COOKER)",
    "TANK",
    "RIBBON BLENDER",
    "POMPA",
    "STERİLİZATÖR",
    "YAĞ ERİTME TANKI",
    "EŞANJÖR TEST HİZMETİ",
    "ISI DEĞİŞTİRİCİLER (EŞANJÖR)",
    "FREEZER",
    "SEPERATÖR",
    "DEODERİZATÖR"
  ];
  final List<String> endustrialanlari = [
    "SÜT ve SÜT ÜRÜNLERİ",
    "GIDA ve İÇECEK",
    "İLAÇ",
    "KİMYA",
    "ENERJİ"
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getPic();
    getVideoUrl();
    super.initState();
  }

  getVideoUrl() async {
    await _helper.getVideoUrl();
    _videoUrl = _helper.vidUrl;
    if (_videoUrl != "") {
      setState(() {
        _data1 = true;
      });
    }
  }

  Future getPic() async {
    await _helper.getPicData().then((value) {
      _data = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: routes(),
      debugShowCheckedModeBanner: false,
    );
  }

  Map<String, WidgetBuilder> routes() {
    final Map<String, WidgetBuilder> routesMap = {
      "/": (context) => _data
          ? HomePage(
              firstSlides: _helper.firstSlides,
              secondSlides: _helper.secondSlides,
              newsList: _helper.newsList,
              satisList: _helper.satisList,
              kurumsalList: kurumsalList,
              urunlerList: urunlerList,
              temsilcilikler: temsilcilikler,
              endustrialanlari: endustrialanlari)
          : const Center(child: CircularProgressIndicator()),
    };
    urunlerList.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "PASTÖRİZATÖR":
            return PastPage();
          case "YIKAMA SİSTEMİ (CIP)":
            return CipPage();
          case "STANDARDİZATÖR":
            return StandPage();
          case "VANA TARLASI":
            return ValveCluster();
          case "HOMOJENİZATOR":
            return HomojenizatorPage();
          case "VAKUMLU PİŞİRİCİ (COOKER)":
            return CookerPage();
          case "TANK":
            return TankPage();
          case "RIBBON BLENDER":
            return RibbonBlenderPage();
          case "POMPA":
            return PumpPage();
          case "STERİLİZATÖR":
            return SterilPage();
          case "YAĞ ERİTME TANKI":
            return OilSmeltingPage();
          case "FREEZER":
            return FreezerPage();
          case "EŞANJÖR TEST HİZMETİ":
            return ExchangerTestPage();
          case "ISI DEĞİŞTİRİCİLER (EŞANJÖR)":
            return HeatExchangerPage();
          case "SEPERATÖR":
            return SeperatorPage();
          case "DEODERİZATÖR":
            return DeoPage();
          default:
            return Container();
        }
      };
    });
    kurumsalList.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "HAKKIMIZDA":
            return HakkimizdaPage();
          case "TARİHÇE":
            return TarihcePage();
          case "KALİTE POLİTİKAMIZ":
            return KalitePage();
          case "ÇEVRE POLİTİKASI":
            return IsgPage();
          case "KURUMSAL TANITIM FİLMİ":
            return _data1
                ? TanitimFilmi(_videoUrl)
                : const Center(child: CircularProgressIndicator());
          default:
            return Container();
        }
      };
    });
    temsilcilikler.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "Alfa Laval":
            return AlfaLavalPage();
          case "Andritz & Frautech":
            return OthersPage(pageroute: 0);
          case "Au2mate":
            return OthersPage(pageroute: 1);
          case "Bertoli":
            return BertoliPage();
          case "Cmt Atomizers":
            return OthersPage(pageroute: 2);
          case "Endress + Hauser EH":
            return OthersPage(pageroute: 3);
          case "Grundfos":
            return OthersPage(pageroute: 4);
          case "Teknoice":
            return TeknoIcePage();
          default :return Container();
        }
      };
    });
    endustrialanlari.forEach((String title) {
      routesMap["/$title"]= (context){
        switch (title){
          case "SÜT ve SÜT ÜRÜNLERİ": return DairyPage();
          case "GIDA ve İÇECEK": return DrinkPage();
          case "İLAÇ": return MedicinePage();
          case "KİMYA": return ChemistryPage();
          case "ENERJİ": return EnergyPage();
          default : return Container();
        }
      };
    });
    return routesMap;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
