import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class SeperatorPage extends StatelessWidget {
  SeperatorPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/seperator.png";
  String title = "Seperator";
  String title1 = "Servis ve Destek";
  List<List<String>> yazi = [
    [
      "",
      "Süt ve peynir altı suyu temizleyicileri, meyve suyu seperatörü, bakteri uzaklaştırma seperatörü, krema seperatörü, krema ve tereyağı yoğunlaştırıcıları"
    ],
    [
      "ÖZELLİKLERİ",
      """
      •  Otomatik CIP entegrasyonu için tasarlanmış kendi kendini temizleme
      •  Krema seperatörlerinde dahili manuel geri basınç kontrolü ve süt yağı standardizasyonu için manuel vana
      •  Paslanmaz çelik üretim
      •  Düşük enerji tüketimi
      •  Optimum çalışma koşulları
      •  Katıların doğru tahliyesine olanak sağlayan, zaman kontrollü ayar
      """
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
            SliverToBoxAdapter(
                child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const PastModelCard(
                    pic: "https://www.gemak.com.tr/uploads/temsilcilikler/3872.png",
                    title: ""),
              ),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            SliverToBoxAdapter(child: PageTitle(title: "Seperator Modelleri"),),
            const SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(
                  pic:
                      "https://www.gemak.com.tr/uploads//urunler/temizleme-seperatoru.png",
                  title: "Temizleme Seperatörü"),
            )),
            const SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(
                  pic:
                      "https://www.gemak.com.tr/uploads//urunler/krema-seperatoru.png",
                  title: "Krema Seperatörü"),
            )),
            const SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(
                  pic: "https://www.gemak.com.tr/uploads//urunler/baktafuga-seperator.png",
                  title: "Baktafuga Seperatörü"),
            )),const SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(
                  pic: "https://www.gemak.com.tr/uploads//urunler/meyve-suyu-seperatoru.png",
                  title: "Meyve Suyu Seperatörü"),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
