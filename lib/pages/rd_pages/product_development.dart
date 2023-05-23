import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class ProductDevelopment extends StatelessWidget {
  ProductDevelopment({Key? key}) : super(key: key);
  String pic = "";
  String title = "Ürün Geliştirme";
  List<List<String>> yazi = [
    [
      "",
      "GEMAK A.Ş. 5746 numaralı Ar-Ge ve Tasarım Merkezlerinin desteklenmesine ilişkin kanun kapsamında Ar-Ge Merkezi olarak 2017 yılında tescil edilmiştir. Yenilikçiliğe odaklanmış olan firmamız, Ar-Ge merkezi bünyesinde sektörün hedef pazar ihtiyacını karşılayacak şekilde veya geleneksel üretim yöntemlerini geliştirecek nitelikte, müşteriden gelen talepler doğrultusunda ve ülkemizde yerli üretimi olmayan teknolojileri içeren makine, ekipman ve komple proses hattı tasarlayarak, geliştirerek ve üreterek ülke ekonomisine büyük katkı sağlamaktadır. Geliştirilen ve üretilen katma değeri yüksek ürünler firmamızın ulusal ve uluslararası alanda rekabet gücünün artırılmasını sağlamaktadır. Rekabetin vazgeçilmez unsurlarından biri olan Ar-Ge ve İnovasyon kapsamında geliştirilen ürünlerimiz için patent/tescil/endüstriyel tasarım/faydalı model başvuruları yapılmaktadır."
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
