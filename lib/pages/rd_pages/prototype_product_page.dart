import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class PrototypeProductPage extends StatelessWidget {
  PrototypeProductPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "Prototip Ürün Geliştirme";
  List<List<String>> yazi = [
    [
      "",
      "Sektörün tartışılmaz en iyi Ar-Ge merkezinden birine sahip olan firmamız yaptığı Ar-Ge çalışmaları sonucu makine / ekipman veya komple proses hatlarının tasarımında ve üretiminde, yetkinliklerimiz doğrultusunda paslanmaz çelik ham maddeyi işleyerek prototip makine üretimlerini kendi bünyesinde tamamlayacak ve test/deneme faaliyetlerini gerçekleştirecek bilgi birikim, tecrübe ve konusunda uzman personel kadrosuna sahiptir."
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
