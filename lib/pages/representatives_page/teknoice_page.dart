import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class TeknoIcePage extends StatelessWidget {
  TeknoIcePage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads/pages/9951.png";
  String title = "Teknoice";
  List<List<String>> yazi = [
    [
      "",
      "TEKNOİCE, yarı endüstriyel ve endüstriyel dondurma üretimi için tesisler kuran büyük İtalyan şirketlerden biridir. Dondurma sektöründe 35 yılı aşkın deneyime sahip olan Teknoice, gün geçtikçe kendini yenileyen teknolojik sistemleri ve ürün güvenilirliği sayesinde dünyanın birçok yerinde özellikle tercih edilen bir marka haline gelmiştir."
    ],
    [
      "",
      "Gemak ve Teknoice işbirliğinin gücü sayesinde, sütün tesisinize girişinden pastörize edilmesine, dondurma üretiminden dondurulma süreçlerine kadar tüm proseslerinizi projelendirip hayata geçirebiliriz. Maraş dondurması gibi klasik dondurma üretimi başta olmak üzere, yenilikçi özel kesim dondurma veya özel şekilli dondurma üretmeye imkan sağlayan ekstrüzyon hatlarımızla da prosesinizi sizin için özelleştirebiliriz. "
    ],
    [
      "",
      "İsterseniz sizin için anahtar teslim dondurma fabrikası kurabilir, makine ekipman desteği verebilir veya sadece servis desteği sağlayabiliriz."
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PageTitle(title: title),
            ),
            SliverToBoxAdapter(
                child: Center(
                  child: PastModelCard(pic: pic, title: ""),
                )),
            CustomTextView1(
              footerIn: true,
              titleIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
