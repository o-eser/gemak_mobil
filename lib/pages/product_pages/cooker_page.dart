import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class CookerPage extends StatelessWidget {
  CookerPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/vakumlu-pisirici-cooker.png";
  String title = "Vakumlu Pişirici (Cooker)";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "Sistem farklı türde ve değişik viskozitede ürünlerin üretimi için özel olarak tasarlanmıştır. Hazırlama, pişirme ve bekletme soğutma bölümlerinden oluşur. Ön hazırlama ünitelerinde bulunan tartım üniteleri yardımı ile hammaddeler otomatik olarak bu tanklara alınmakta ve  karıştırılmaktadır.  Bu sayede üretim zamanından tasarruf edilir ve saatte yapılacak çevrim sayısı artırılır. Buharlı bir pişiriciye sahiptir. Vakum altında ve/veya vakumsuz pişirebilir. Tam otomatik sistem, PLC kontrol ünitesi ve dokunmatik renkli ekran ile donatılmıştır."
    ],
    [
      "",
      "EHEDG kurallarına ve ilkelerine göre tasarlanmış ve üretilmiştir. İsteğe bağlı olarak bir yüksek hızlı karıştırıcı içerebilir. Sistem  AISI 304 - 316 malzemeden tek şase üzerinde platform ve merdiven üniteleri ile birlikte kompakt bir ünitedir."
    ]
  ];
  List<List<String>> yazi1 = [
    ["", "•  Buharlı Pişirme"],
    ["", "•  Buzlu Su veya Chiller yoluyla Soğutma"],
    ["", "•  Vakumlu Pişirme veya Soğutma"],
    ["", "•  Homojenizasyon Kafası"],
    ["", "•  Steril Ürün Tahliye Vanası"],
    ["", "•  Kazıyıcılı Karıştırıcı"],
    ["", "•  Çırpıcı Kafalar"],
    ["", "KULLANIM ALANLARI :"],
    ["", "•  Reçel ve Türevleri"],
    ["", "•  Marshmellow"],
    ["", "•  İnvert Şurup"],
    ["", "•  Karamel"],
    ["", "•  Sos"],
    ["", "•  Süt ve Süt Ürünleri"],
    ["", "•  Kek"],
    ["", "•  Krema"],
    ["", "•  Puding"],
    ["", "•  Mayonez"]
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
                      """Gemak Cooker, sistemin mutfağı için üst kalite ekipman, tam otomasyon ve ekstra hijyenik sistemiyle yüksek nitelikli üretim yapar."""),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
