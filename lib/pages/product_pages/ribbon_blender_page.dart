import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class RibbonBlenderPage extends StatelessWidget {
  RibbonBlenderPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/blender.png";
  String title = "Ribbon Blender";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "Özel tasarım karıştırıcısı ile hassas ürünlerin yapısını bozmadan homojen olarak karışımını sağlar. AISI 304 - 316 kalite paslanmaz çelik sac ve profilden imal edilmiştir. TIG kaynağı metodu ile birleştirilmiştir."
    ],
    ];
  List<List<String>> yazi1 = [
    ["", "Kapasite: 300 lt - 3.000 lt"],
    ["", "Katı / katı, katı / sıvı, sıvı / sıvı ürünlerin homojen karıştırılması için kullanılır. Özel tasarım karıştırıcısı ile hassas ürünlerin yapısını bozmadan homojen olarak karışımını sağlar. AISI 304 - 316 kalite paslanmaz çelik sac ve profilden imal edilmiştir. TIG kaynağı metoduyla birleştirilmiştir."],
    ["", "KULLANIM ALANLARI :"],["", "•  Gıda Sanayi"],
    ["", "•  İlaç Sanayi"],
    ["", "•  Sivil Patlayıcı"],
    ["", "•  Labne Hatları"],
    ["", "•  Meyveli Yoğurt"],
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
                      """Sıvı ürünlerin homojen karıştırılması için kullanılır."""),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
