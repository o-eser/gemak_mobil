import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class ProjectConsultingPage extends StatelessWidget {
  ProjectConsultingPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "Proje Danışmanlık";
  List<List<String>> yazi = [
    [
      "",
      "Süt ürünlerinden, meyve suyu ve bal üretim tesislerine kadar farklı talep ve ihtiyaca uygun proje hazırlıyor, uyguluyor ve destek veriyoruz. Bugüne dek, teslim ettiğimiz projeler ve kurulumunu yaptığımız tüm tesisler için işe hep müşterilerimizi dinleyerek başladık. Arşivlerdeki hazır şablonları kullanıp, sadece üretim kapasitesi ve yerleşim planı ile proje üretmek yerine, tüm alternatifleri müşterilerimizle birlikte değerlendiriyor, işletme ve bakım maliyetleri, yüksek verimlilik, genişleme potansiyeli gibi pek çok kriteri gözönüne alıyoruz. Amacımız; ister yeni tesis kurulumu, ister yenileme ve kapasite arttırımı olsun, tüm proje ihtiyaçlarınız için tek adresten profesyonel bir danışmanlık hizmeti sağlamak. Türkiye ve dış pazarlarda faaliyet gösteren müşterilerimiz uzun yıllardır yeni projeleri için tekrar tekrar Gemak kalitesini tercih ediyor. Bu güvenden aldığımız güçle çıtayı sürekli yükseltiyor ve hep daha iyisini yapmak için çalışıyoruz."
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
