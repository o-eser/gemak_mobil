import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class InstallationPage extends StatelessWidget {
  InstallationPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "Montaj & Devreye Alma";
  List<List<String>> yazi = [
    [
      "",
      "Gemak eğitimli ve uzman ekibiyle hızlı ve eksiksiz proje ve ekipman montaj hizmeti verir."
    ],
    [
      "Uzmanlık alanlarımız:",
      """• Paslanmaz boru montajı,
• Makine ve teçhizat montajı,
• Tesisleri devreye alma,
• Test,
• Eğitim,
• Lojistik ve operasyonel destek,
• Buhar, hava, su, buzlu su boruları ve izolasyon,
• Elektrik kablo kanalı, braketler ve kablo montaj,
• Havalandırma ve hava soğutma ünitelerinin montajı."""
    ],
    [
      "",
      "Ekibimiz, sürecin tam olarak planlandığı gibi tamamlandığından emin olmak için her türlü ayrıntıyı dikkate alır. Borular, vanalar, rakorlar ve izolasyon işleri, yılların tecrübesine sahip teknisyenlerimiz tarafından yapılır. Kalite ve uygunluk mühendislerimiz tarafından süreç boyunca sürekli kontrol edilir. Müşterilerimizin personeline süreçle ilgili tüm teknik eğitimleri verir ve tesisleri yalnızca her şey sorunsuz çalıştığında teslim ederiz."
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
