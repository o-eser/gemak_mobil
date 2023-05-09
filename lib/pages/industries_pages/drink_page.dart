import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class DrinkPage extends StatelessWidget {
  DrinkPage({Key? key}) : super(key: key);
  String title = "İçecek";
  List<List<String>> yazi = [
    [
      "",
      "Gemak, meyve suyu, meyve nektarı, meyve aromalı içecekler, çorba, domates, bebek maması, yağ, yumurta, bal, soslar, soya ve badem sütü gibi sıvı gıda ürünleri için anahtar teslim hatlar, proses ekipmanları, mühendislik ve Ar-Ge çözümleri sağlamaktadır."
    ],
  ];
  List<List<String>> yazi1 = [
    ["Ürettiğimiz Ürünler:", "•  Holder ve Proses tankları,"],
    [
      "",
      "•  Yüksek Isı Kısa Süre (HTST) ve Ultra Yüksek Isı (UHT) süt pastörizasyon ve standardizasyon sistemleri,"
    ],
    ["", "•  Enzim sistemleri,"],
    ["", "•  Buharlaştırma sistemleri,"],
    ["", "•  Filtrasyon hatları,"],
    ["", "•  Konsantrasyon hatları,"],
    ["", "•  Yerinde temizlik (CIP) sistemleri,"],
  ];
  List<List<String>> yazi2 = [
    [
      "Tedarik Ettiğimiz Ürünler:",
      "•  Presleme sistemleri,"
    ],
    ["", "•  Temizleme makinaları,"],
    ["", "•  Ayırma makinaları,"],
    ["", "•  Komple laboratuvar ve bağlantı ekipmanları."],
  ];
  List<List<String>> yazi3 = [
    [
      "Sunduğumuz Hizmetler:",
      "•  Müşterilerimizin kapasite, özel ihtiyaç ve büyüme planlarına göre her türlü sıvı gıda tesisi çözümleri sunuyoruz."
    ],
    [
      "",
      "•  AR-GE ekibimiz ve mühendislerimiz güncel teknolojileri kullanarak tüm uygulamalar için ürün kaybının en aza indirgenmesini sağlar."
    ],
    [
      "",
      "•  Periyodik bakım paketleri, yedek parçalar ve teknik destek içeren kapsamlı bir satış sonrası hizmet yelpazesiyle yatırımınızdan yüksek getiri almanızı sağlıyoruz."
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              titleIn: false,
              yazi: yazi1,
              title: "",
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              titleIn: false,
              yazi: yazi2,
              title: "",
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              titleIn: false,
              yazi: yazi3,
              title: "",
              pic: "",
            ),
          ],
        ));
  }
}
