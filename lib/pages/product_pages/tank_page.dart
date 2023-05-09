import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class TankPage extends StatelessWidget {
  TankPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/tank.jpg";
  List<List<String>> productList = [
    ["https://www.gemak.com.tr/uploads//urunler/silo-tanki.png", "Silo Tankı"],
    ["https://www.gemak.com.tr/uploads//urunler/depolama-tanki.png", "Depolama Tankı"],
    ["https://www.gemak.com.tr/uploads//urunler/proses-tanki.png", "Proses Tankı"],
    [
      "https://www.gemak.com.tr/uploads//urunler/ultraclean-aseptik-tank.png",
      "Ultraclean / Aseptik Tank"
    ],
    ["https://www.gemak.com.tr/uploads//urunler/mobil-tank.png", "Mobil Tank"]
  ];
  String title = "Tank";
  String title1 = "Servis ve Destek";
  List<List<String>> yazi = [
    ["", "Silo, Depolama, Proses Tankları"],
    [
      "",
      "AISI 304 - 316 kalite malzemeden üretilmektedir. Opsiyon olarak tavandan, yandan karıştırıcı ilave edilebilir.  Ayaklı tiplerde ayaklar, ayar civatası ile ayarlanabilir."
    ],
    [
      "",
      "2B kalite sertifikalı sacdan TIG veya otomatik plazma kaynaklı olarak hijyen kurallarına uygun olarak üretilmektedir.  Menhol kapaklı ya da üstten açılır olarak imal edilebilir."
    ],
    [
      "",
      "%100 penetran testi ile kaynak yerleri test edilmektedir.  Opsiyon olarak mekanik veya dijital termometre, basınç transmiteri, Ph probları, seviye sensörleri vb. enstrümanlar ilave edilebilir."
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
              child: PageTitle(title: "Tank Modelleri"),
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
