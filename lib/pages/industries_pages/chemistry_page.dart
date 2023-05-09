import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class ChemistryPage extends StatelessWidget {
  ChemistryPage({Key? key}) : super(key: key);
  String title = "Kimya";
  List<List<String>> yazi = [
    [
      "",
      "Gemak, sıvı kimyasal işleme tesisleri(kozmetik, kişisel bakım, deterjan) için tasarım, imalat, mühendislik ve kurulum konularında uzmandır."
    ],
    ["","Sistemlerin tümü ATEX ve PED standartlara uygun tasarlanmıştır. Sistemlerimiz GMP’ye uygun prosesinizin her adımını denetlemenizi sağlayan ünite veya fabrika bazlı otomasyon sistemleri ile donatılmıştır. Tecrübeli mühendislerimiz tarafından tasarlanan ve en üst kalite ve işçilik ile üretilen ürünlerimiz fire ve enerji tüketimini asgari seviyeye indirir."],
    ["","Basınç ve korozyon, dikkate alınması gereken birçok parametreden sadece birkaçıdır. Gemak sistemleri ile işleminizin her aşamasını, birim ve tesis bazlı otomasyon sistemlerimizle kontrol edebilirsiniz. Yılların tecrübesi ve kalifiye uzmanlarımızla ihtiyaçlarınız için özelleştirilmiş çözümler sağlıyoruz. Mühendislerimiz bu tür uygulamalar için ürün kaybı ve enerji harcamalarının en aza indirilmesini sağlar. Teknik bilgi, kaliteli malzeme kullanımı ve işçiliğimiz bizi rakipsiz kılıyor."],

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              textPadding: 1,
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
