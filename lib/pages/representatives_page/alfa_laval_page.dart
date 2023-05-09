import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class AlfaLavalPage extends StatelessWidget {
  AlfaLavalPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads/pages/2976.png";
  String title = "Alfa Laval";
  List<List<String>> yazi = [
    [
      "",
      "Alfa Laval ısı transferi, seperasyon ve akış ekipmanları alanlarında üst sınıf ürünler tedarik eden ve alanında lider olan global bir firmadır. Dünya çapında çeşitli endüstrilerdeki müşterilerinin üretkenliğini ve rekabet gücünü arttırmayı hedefleyen firma ile Gemak 1994'ten bu yana iş birliği içindedir.  "
    ],
    [
      "",
      "Yıllardır süregelen Alfa Laval & Gemak işbirliğinin güvencesiyle bugün şirketimiz Alfa Laval'ın İç Anadolu, Karadeniz Akdeniz Bölgeleri Yetkili Bölge Distribütörüdür."
    ],
    [
      "",
      "Alfa Laval Authorized Distributor ve Authorized Service Partner yetki ve sertifikalarına sahip olmamızın yanı sıra, Alfa Laval'ın Türkiye'deki ilk ve tek Master İntegrator sertifikasına sahip olmanın da haklı gururunu yaşamaktayız. "
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PageTitle(title: title),
            ),
            SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(pic: pic, title: ""),
            )),
            CustomTextView1(
              footerIn: true,
              titleIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
