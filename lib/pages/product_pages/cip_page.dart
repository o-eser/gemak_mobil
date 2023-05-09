import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class CipPage extends StatelessWidget {
  CipPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/yikama-sistemi-cip.png";
  String title = "Yıkama Sistemi CIP";String title1 = "Teknik Özellikler";
  List<String> titlelist=["Plakalı Pastörizatör","Borulu Pastörizatör"];
  List<List<String>> yazi = [
    [
      "",
      "GEMAK CIP modülleri, tanklar, dolum makineleri, pastörizatörler, sıhhi tesisat boruları, aseptik tanklar, plakalı ısı eşanjörü ve diğer proses ekipmanları gibi proses ekipmanlarının temizliğinde kullanılan gelişmiş bir otomatik temizleme sistemidir. GEMAK CIP modülleri, her müşteri için kapasite ve seçeneklere sahip geniş bir yelpazede esnek çözümler sunan kompakt ünitelerdir."
    ],
    [
      "",
      "Tam otomatik CIP üniteleri, PLC kontrollü ve tüm sistem ile 5 basınç hattına kadar tasarlanabilir. GEMAK CIP modülleri temizleme süresini, kimyasal sıcaklığını, akışını ve konsantrasyonunu otomatik olarak kontrol eder. GEMAK CIP modülündeki kimyasal konsantrasyonunun ve sıvıların sınıflandırılmasının kontrolü bir iletkenlik ileticisi kullanılarak yapılır."
    ],
    ["","•  Üretim öncesi ve sonrası tank, ve proses ekipmanları iç yüzeylerinin temizlenmesine yönelik bir basınç hattından beş basınç hattına kadar birçok seçenek mevcuttur."],
    ["","•  Ayrıca, Mobil CIP üniteleri de mevcuttur.                                          "],
    ["","•  Sistem, sıcaklık, basınç, iletkenlik sensörleri ve debi ölçer ile donatılmıştır."],
    ["","•  Bu sensörler ile sistem otomatik olarak kontrol edilmektedir. Sistem paslanmaz çelik PLC elektrik panosu ile sunulmaktadır."]
  ];
  List<List<String>> yazi1=[["","Kapasite: 500 - 60.000 lt/h"],
    ["","KULLANIM ALANLARI :"],
    ["","•  Süt ve Süt Mamulleri"],
    ["","•  Süt ve Süt Mamulleri"],
    ["","•  Gıda Tesisleri"],
    ["","•  Endüstriyel Tesisler"],
    ["","•  Meyve Suyu Tesisleri"],
    ["","•  İlaç ve Kozmetik Endüstrisi"],
    ["","•  Kimya Endüstrisi"],
    ["","•  Su"],
    ["","•  İşlenmiş Gıdalar"]
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
            SliverToBoxAdapter(child: Center(
              child: PastModelCard(pic: pic, title: """GEMAK şase monteli modüler CIP sistemleri, gıda, kimya ve ilaç endüstrisindeki çeşitli uygulamalar için üretilmiştir."""),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }

}
