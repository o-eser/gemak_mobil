import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemak/inhwidget.dart';
import 'package:gemak/pages/gallery_page/23_april_exhibition_page.dart';
import 'package:gemak/pages/gallery_page/co_gallery.dart';
import 'package:gemak/pages/industries_pages/chemistry_page.dart';
import 'package:gemak/pages/industries_pages/dairy_page.dart';
import 'package:gemak/pages/industries_pages/drink_page.dart';
import 'package:gemak/pages/industries_pages/energy_page.dart';
import 'package:gemak/pages/industries_pages/medicine_page.dart';
import 'package:gemak/pages/kurumsal_page/hr_page.dart';
import 'package:gemak/pages/news_page.dart';
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
import 'package:gemak/pages/rd_pages/innovation_page.dart';
import 'package:gemak/pages/rd_pages/product_development.dart';
import 'package:gemak/pages/rd_pages/prototype_product_page.dart';
import 'package:gemak/pages/rd_pages/rd_proses_page.dart';
import 'package:gemak/pages/representatives_page/alfa_laval_page.dart';
import 'package:gemak/pages/representatives_page/bertolli_page.dart';
import 'package:gemak/pages/representatives_page/others_page.dart';
import 'package:gemak/pages/representatives_page/teknoice_page.dart';
import 'package:gemak/pages/solutions_pages/automation_software.dart';
import 'package:gemak/pages/solutions_pages/installation_commissioning.dart';
import 'package:gemak/pages/solutions_pages/project_consulting_page.dart';
import 'package:gemak/pages/solutions_pages/ssh_page.dart';
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
  final GemakProvider gemakProvider = GemakProvider(helper: HttpHelper());
  bool _data = false;
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
  final List<String> solutions = [
    "SATIŞ SONRASI HİZMETLER",
    "PROJE DANIŞMANLIK",
    "OTOMASYON - YAZILIM",
    "MONTAJ & DEVREYE ALMA",
  ];
  final List<String> rd = [
    "AR-GE",
    "Ürün Geliştirme",
    "Prototip Makine Üretimi",
    "AR-GE Amaçlı Proses Hatları",
    "Inovasyon"
  ];
  final List<String> hr = [
    "İnsan Kaynakları Politikamız",
    "Çalışan Profili",
    "İşe Alım Süreci"
  ];
  final List<String> gallery = [
    "Şirket Galerisi",
    """2. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""",
    """3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""",
    """3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await gemakProvider.fetchData();
    setState(() {
      _data = true;
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
              firstSlides: gemakProvider.data.firstSlides,
              secondSlides: gemakProvider.data.secondSlides,
              newsList: gemakProvider.data.newsList,
              satisList: gemakProvider.data.satisList,
              kurumsalList: kurumsalList,
              urunlerList: urunlerList,
              temsilcilikler: temsilcilikler,
              endustrialanlari: endustrialanlari,
              solutions: solutions,
              rd: rd,
              hr: hr,
              gallery: gallery,
            )
          : const Center(child: CircularProgressIndicator()),
      "/newspage":(context)=> NewsPage(newsList: gemakProvider.data.newsData,)
    };
    gallery.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "Şirket Galerisi":
            return CompanyGallery(photoList: gemakProvider.data.photoList);
          case """2. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""":
            return SecondExhibitionPage(
                photoList: gemakProvider.data.exhibitionPhotoList);
          case """3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""":
            return ThirdExhibitionPage(
                photoList: gemakProvider.data.thirdExhibitionPhotoList);
          case """3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""":
            return FourthExhibitionPage(
                photoList: gemakProvider.data.fourthExhibitionPhotoList);
          default:
            return Container();
        }
      };
    });
    solutions.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "SATIŞ SONRASI HİZMETLER":
            return CompanyGallery(photoList: gemakProvider.data.photoList);
          case "PROJE DANIŞMANLIK":
            return ProjectConsultingPage();
          case "OTOMASYON - YAZILIM":
            return AutomationSofwarePage();
          case "MONTAJ & DEVREYE ALMA":
            return InstallationPage();
          default:
            return Container();
        }
      };
    });
    rd.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "AR-GE":
            return SshPages();
          case "Ürün Geliştirme":
            return ProductDevelopment();
          case "Prototip Makine Üretimi":
            return PrototypeProductPage();
          case "AR-GE Amaçlı Proses Hatları":
            return RdProsesPage();
          case "Inovasyon":
            return InnovationPage();
          default:
            return Container();
        }
      };
    });
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
    hr.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "İnsan Kaynakları Politikamız":
            return HumanResourcesPage(pageroute: 0);
          case "Çalışan Profili":
            return HumanResourcesPage(pageroute: 1);
          case "İşe Alım Süreci":
            return HumanResourcesPage(pageroute: 2);
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
            return _data
                ? TanitimFilmi(gemakProvider.data.videoUrl)
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
          case "Grundfos":
            return OthersPage(pageroute: 4);
          case "Teknoice":
            return TeknoIcePage();
          default:
            return Container();
        }
      };
    });
    endustrialanlari.forEach((String title) {
      routesMap["/$title"] = (context) {
        switch (title) {
          case "SÜT ve SÜT ÜRÜNLERİ":
            return DairyPage();
          case "GIDA ve İÇECEK":
            return DrinkPage();
          case "İLAÇ":
            return MedicinePage();
          case "KİMYA":
            return ChemistryPage();
          case "ENERJİ":
            return EnergyPage();
          default:
            return Container();
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
