import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class RdPage extends StatelessWidget {
  RdPage({Key? key}) : super(key: key);
  String pic = "";
  String title = "AR-GE";
  List<List<String>> yazi = [
    [
      "",
      "Türkiye'nin 368. AR-GE Merkezi olan Gemak, yaptığı çalışmalarla yüksek katma değeri olan, inovasyon ve Ar-Ge projeleri tasarlayarak kalıcı ve katma değerli ürünler elde etmeyi hedeflemektedir."
    ],
    [
      "",
      "GEMAK’ın vizyonu, ileri teknolojili, yüksek verimli, kaliteli ürün ve servisler sağlamak ve paslanmaz çeliğin kullanıldığı her alanda kaliteli ürünler sunmaktır. Hedefimiz, müşterilerimizin en güvenilir çözüm ortağı olarak alanımızda dünyada en çok tercih edilen şirket haline gelmektir."
    ],
    [
      "",
      "AR-GE merkezimizde yenilikçi fikirler üretirken, ayrıca fikirden uygulamaya doğru ilerleyen süreç ve bu süreci besleyen koşullar üzerine de interdisipliner ekibi ile çalışmalar yapmaktadır. 30 yılı aşkın olan bilgi ve deneyimimizle dinamik, yenilikçi fikirler üreten, yetkin personelleri harmanlayarak global pazarda teknolojiye yön veren bir konuma ulaşmayı amaçlamaktayız."
    ],
    [
      "",
      "Personelimizin eğitimine ve gelişimine büyük önem vermekte ve sektörü ile ilgili katılım sağlayabileceği etkinliklere personelimizi yönlendirerek, konuya hakimiyetlerinin arttırılması için destek sağlamaktayız. GEMAK, yerli tasarım ve üretim anlayışı ile Türkiye’nin gıda sektöründeki “fabrika kuran fabrikası” olmaya devam edecektir."
    ],
    [
      "",
      "Ar-Ge merkezinde, sürekli olarak yeni iş modelleri üretilmekte, araştırma – geliştirme projelerine yatırım yapılmakta ve çalışanların gelişimi desteklenmektedir. İnovasyon kapasitesini güçlendirmek, çağın zorluklarının üstesinden gelmeyi ve karlı bir kurumsal büyüme elde etmeyi sağlamaktadır."
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
