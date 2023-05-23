import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class RdProsesPage extends StatelessWidget {
  RdProsesPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "AR-GE Amaçlı Proses Hatları";
  List<List<String>> yazi = [
    [
      "",
      "Ar-Ge merkezimiz kapsamında TÜBİTAK, KOSGEB, Sanayi ve Teknoloji Bakanlığı, Ticaret Bakanlığı gibi kurumlardan devlet desteği ile, üniversitelerdeki akademik personeller ile birlikte çalışarak teorik bilgiyi pratiğe ve sanayiye taşıma amaçlı Üniversite-Sanayi İşbirliği kapsamında ve kendi öz sermayemizle makine/üretim yöntemi geliştirme, makinelerde enerji verimliliği ve maliyetleri azaltma üzerine, dünya çapında üretimi olmayan veya teknolojisi mevcut ancak henüz ülkemizde yerli olarak kurulumu yapılmayan teknolojiler üzerine çalışıp yerli üretim yapmaya yönelik yenilikçi projeler tasarlıyor ve makine/ekipman/proseslerin prototip üretimlerini gerçekleştiriyoruz."
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
