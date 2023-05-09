import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class EnergyPage extends StatelessWidget {
  EnergyPage({Key? key}) : super(key: key);
  String title = "Enerji";
  List<List<String>> yazi = [
    [
      "",
      "Gemak, enerji sektörüne dünya çapında tedarikçiler olan Alfa Laval ve Grundfos ürünleriyle hizmet vermektedir. Gıda dışı kullanım için Alfa Laval plakalı eşanjörlerinin montajını yapıyoruz, dekantör ve hava ünitelerini tedarik ediyoruz. Ürünlerin detaylarına erişmek ve satın almak için esanjorsatis.com online satış sitemizi ziyaret edebilirsiniz."
    ],
  ];
  List<List<String>> yazi1 = [
    ["Alfa Laval Plakalı Eşanjörler:", "•  Plakalardaki akışın iyileştirilmesiyle genel ısı transferini arttırır,"],
    [
      "",
      "•  Asgari enerji tüketimi ile azami verim elde eder,"
    ],
    ["", "•  Az yer kaplayan kompakt bir ekipmandır,"],
    ["", "•  Esnek bir tasarıma sahiptir ve servis ile bakım işlemlerinin yapılması kolaydır,"],
    ["", "•  Isıtma, soğutma, ısı geri kazanımı, evaporasyon ve kondenzasyon görevlerinde kullanılır,"],
    ["", "•  HVAC, soğutma, motor yağı soğutma kimyasal işlemler ve enerji üretimi gibi daha ağır proseslerde kullanılabilir."],
    ["", "•  Yerinde temizlik (CIP) sistemleri,"],
  ];
  List<List<String>> yazi2 = [
    [
      "",
      "Pompa çözümleri için dünya çapında bir lider olan Grundfos ekipmanlarını tedarik ediyoruz."
    ],
    ["Grundfos pompaları:", "•  Su çözümlerinin enerji verimliliğini artırmaya yardımcı olacak eşsiz bir fırsat sunar,"],
    ["", "•  Altyapı yetersizliği ve CO2 emisyonunun giderek artması gibi sorunlara yönelik kaliteli çözümler sunar."],
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
              titleIn: false,
              yazi: yazi2,
              title: "",
              pic: "",
            ),

          ],
        ));
  }
}
