import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class HeatExchangerPage extends StatelessWidget {
  HeatExchangerPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/isi-degistiriciler.png";
  String title = "Isı Değiştiriciler (Eşanjörler)";
  String title1 = "Servis ve Destek";
  List<List<String>> yazi = [
    [
      "",
      "Plakalı, Borulu, Sıyırıcılı tip ısı değiştiriciler (eşanjörler) genel olarak yüksek verim gerektiren ısıtma, soğutma, ısı geri kazanım görevlerinde kullanılmaktadır. "
    ],
  ];
  List<List<String>> yazi1 = [
    [
      "",
      "Siz tesisinizle ne kadar gurur duyuyorsanız, biz de size sunduğumuz üretim ve servis hizmetlerimizle aynı derecede gurur duyuyoruz. Amacımız, GEMAK ekipmanlarını satın alındığı andaki üstün performansını, gerekli bakım ve hizmetleri sağlayarak korumaktır."
    ],
    [
      "",
      "Ekipmanınız, her biri diğer parçalarla uyumlu ve kusursuz bir biçimde tasarlanıp geliştirilen Gemak Orijinal Yedek Parçalarıyla çalışmaya başlar. Ekipmanlarınızın sorunsuz, daha çok enerji tasarrufuyla çalışabilmesi için düzenli servis gerekir. Müşterilerimize her zaman periyodik bakım öneriyor ve bu hizmeti memnuniyet ile sunuyoruz."
    ],
    [
      "",
      "Ekipmanınızın bakımıyla ilgili tüm sorularınızı yanıtlamaktan ve bakımı için randevu vermekten memnuniyet duyacaktır. Randevu ve arıza bildirimleriniz için internet sitemizden, telefonla veya e-posta yoluyla bize ulaşabilirsiniz."
    ],
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
              pic: pic,
            ),
            const SliverToBoxAdapter(child: CustomDivider(),),
            SliverToBoxAdapter(child: PageTitle(title: "Isı Değiştirici (Eşanjör) Modelleri",),),
            const SliverToBoxAdapter(
                child: Center(
                  child: PastModelCard(
                      pic: "https://www.gemak.com.tr/uploads//urunler/contali-plakali-isi-degistiriciler.png",
                      title:
                      "Contalı Plakalı Eşanjör"),
                )),const SliverToBoxAdapter(
                child: Center(
                  child: PastModelCard(
                      pic: "https://www.gemak.com.tr/uploads//urunler/lehimli-plakali-isi-degistirici.png",
                      title:
                      "Lehimli Plakalı Eşanjör"),
                )),const SliverToBoxAdapter(
                child: Center(
                  child: PastModelCard(
                      pic: "https://www.gemak.com.tr/uploads//urunler/siyiricili-esanjor.png",
                      title:
                      "Sıyırıcılı Eşanjör"),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
