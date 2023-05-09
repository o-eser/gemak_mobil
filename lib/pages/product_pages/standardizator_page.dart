import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class StandPage extends StatelessWidget {
  StandPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/standardizator.png";
  String title = "Standardizatör";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "GEMAK otomatik sıralı standardizasyon üniteleri, süt ve kremadaki yağ, protein, toplam katı ve katı olmayan yağların krem ayırıcıdan hemen sonraki standardizasyonu için kullanılır. Pastörizatör, krema seperatörü ve homojenizatör ile senkron olarak sürekli çalışabilir. Yağ içeriği tarifin istenen değerine göre ayarlanabilir. Ünitenin kontrolü ünitenin kendi kontrol kabiniyle ya da pastörizatörün kontrol ünitesi üzerinden yapılabilir."
    ],
    [
      "",
      "GEMAK şase monteli modüler standardizasyon sistemleri, süt ve krema, aromalı süt, fermente ürünler için süt ve toz üretimi, peynir sütü, dondurma karışımı ve diğer birçok süt ürünü uygulamaları için hat içi teknolojiyle üretilmektedir."
    ]
  ];
  List<List<String>> yazi1 = [
    ["", "Kapasite: 5.000 - 50.000 lt/h"],
    [
      "",
      "Süt Standardizasyonu, Krema Standardizasyonu, Tam Yağlı, Yarım Yağlı, Yağsız olmak üzere yüksek hassasiyette standardizasyon sağlanmaktadır."
    ],
    [
      "",
      "Yoğunluk ölçebilen Kütlesel ve Elektromanyetik Flowmetreler ve Samson oransal vanalar ile sistem yüksek hassasiyette ölçüm yapmakta, yağ oranı ve krema yüzdesini ayarlamaktadır. Sistem Siemens PLC ve paslanmaz çelik elektrik panosu ile tedarik edilmektedir. DIN ya da SMS normunda kolaylıkla separatör ya da pastörizatöre bağlanmakta ve gerekli haberleşme protokolleri sağlanmaktadır."
    ],
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
              child: PastModelCard(
                  pic: pic,
                  title:
                      """Sütün yağını otomatik olarak ölçer, istenen yağ oranına düşürür."""),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
