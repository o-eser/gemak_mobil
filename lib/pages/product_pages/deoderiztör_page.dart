import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class DeoPage extends StatelessWidget {
  DeoPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/deoderizator.png";
  String title = "Deoderizatör";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    ["", "AISI 304L - 316L kalite paslanmaz çelik sac ve profilden imal edilmiştir. DIN ve SMS normuna uygun TIG kaynağı metoduyla birleştirilmiştir. Sistem, deaerasyon tankı, vakum altında çalışan ürün pompası, vakum pompası, borulu veya plakalı kondenzasyon eşanjörü, PT 100, vakum metre, regülasyon vanaları, elektro manyetik debimetre ve gerekli seviye kontrolü sensörlerinden oluşmaktadır. Kuvvet ve kumanda panosu Siemens malzemelerden üretilmekte, kontrol sistemi PLC olarak imal edilmektedir."],
  ];
  List<List<String>> yazi1 = [
    ["", "Kapasite: 500 lt/h - 35.000 l/h"],
    ["", "Kullanım alanları:"],
    ["", """
    •  Süt
    •  Krema
    •  Meyve Suyu
    •  Bal"""],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              footerIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
            SliverToBoxAdapter(
                child: Center(
                  child: PastModelCard(pic: pic, title: "Akışkan içerisindeki istenmeyen koku, gaz ve havanın vakum yolu ile giderilmesi için kullanılır."),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
