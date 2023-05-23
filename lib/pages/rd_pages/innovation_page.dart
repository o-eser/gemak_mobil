import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class InnovationPage extends StatelessWidget {
  InnovationPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "İnovasyon";
  List<List<String>> yazi = [
    [
      "",
      "Yenilikçiliği kurumsal bir değer olarak benimseyen firmamızda Ar-Ge çalışmalarının yanı sıra, ürün ve üretim yöntemlerini geliştirme, verimliliği artırma, verimli çalışma ortamı yaratma, yeni ürün/yeni süreç ve bilgi üretilmesi amaçlı inovasyon programları yürütülmektedir. Yürüttüğümüz bu inovasyon programı ile son 1 yıl içerisinde üretilen yenilikçi fikirlerde %88 artış, projeye dönüşen yenilikçi fikirlerde %54 artış, dış paydaşlarla ortak yapılan ürün geliştirme projelerinde %60 artış, hibe destekli inovasyon projelerinin sayısında %50 artış sağlanmış; 15 inovasyon projesi başarıyla tamamlanmıştır."
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
