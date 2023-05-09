import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class PumpPage extends StatelessWidget {
  PumpPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/pompa.png";
  List<List<String>> productList = [
    ["https://www.gemak.com.tr/uploads//urunler/santrifuj-ve-kendinden-emisli-pompa.png", "Santrifüj ve Kendinden Emişli Pompa"],
    ["https://www.gemak.com.tr/uploads//urunler/lobe-pompa.png", "Lobe Pompa"],
  ];
  String title = "Pompa";
  String title1 = "Servis ve Destek";
  List<List<String>> yazi = [
    ["", "Süt, meyve suyu, alkollü ve alkolsüz içecekler, kimya ve ilaç sektörlerinde hijyenik sıvı transferi için"],
    [
      "",
      "Paslanmaz çelik malzemeden imal edilmiştir. Hijyenik bir dizayna sahiptir. Kolaylıkla montajı ve demontajı sağlandığından temizlik uygulamaları için uygundur. Süt, su ve meyve suyu gibi ürünlerin transferinde ideal bir çözüm sunar."
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
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            SliverToBoxAdapter(
              child: PageTitle(title: "Pompa Modelleri"),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return PastModelCard(
                      pic: productList[index][0], title: productList[index][1]);
                }, childCount: productList.length)),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
