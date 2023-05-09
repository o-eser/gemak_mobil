import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class PastPage extends StatelessWidget {
  PastPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/pastorizator.png";
  List<String> piclist=["https://www.gemak.com.tr/uploads//urunler/plakali-pastorizator.png","https://www.gemak.com.tr/uploads//urunler/borulu-tip-pastorizator.png"];
  String title = "PASTÖRİZATÖR";String title1 = "Servis ve Destek";
  List<String> titlelist=["Plakalı Pastörizatör","Borulu Pastörizatör"];
  List<List<String>> yazi = [
    [
      "",
      "Yüksek teknoloji otomasyon sistemi ile süreç, zaman kazandıran, insan hatalarını ortadan kaldıran, tüm verileri kaydeden, verimli üretim ve kullanım kolaylığı için sistemin uzaktan kontrol edilmesini sağlayan her adımda kontrol edilebilir."
    ],
    [
      "",
      "GEMAK otomatik pastörizatörleri, otomatik pastörizasyon sıcaklığının kontrolü, akış çeşitlendirmesi ve izlenebilirlik ve kalite sistemleri için sürekli veri kaydına sahip bağımsız ünitelerdir. GEMAK pastörizörü, kaçak ve kirlenme kontrol sistemleri ile gıda güvenliğini garanti eder. Su, elektrik, buhar ve CIP sıvılarının minimum kullanımını sağlayan enerji tasarrufu konseptiyle tasarlanmıştır. Yüksek teknoloji otomasyon sistemi ile süreç, zaman kazandıran, insan hatalarını ortadan kaldıran, tüm verileri kaydeden, verimli üretim ve kullanım kolaylığı için sistemin uzaktan kontrol edilmesini sağlayan her adımda kontrol edilebilir. Tasarımımız, düşük işletme maliyeti için Alfa Laval plakalar ve contalar ile optimum yüksek ısı geri kazanımı sağlar. Pastörizatörler ayrıca özel ürünler için entegre dozajlama / karıştırma sistemleri ve satır içi CIP sistemleriyle de mevcuttur. Tüm pastörizatörler, yerinde hızlı montaj ve devreye alma sağlamak için önceden monte edilmiş ve fabrikada test edilmiştir."
    ],
  ];
  List<List<String>> yazi1=[["","Siz tesisinizle ne kadar gurur duyuyorsanız, biz de size sunduğumuz üretim ve servis hizmetlerimizle aynı derecede gurur duyuyoruz. Amacımız, GEMAK ekipmanlarını satın alındığı andaki üstün performansını, gerekli bakım ve hizmetleri sağlayarak korumaktır."],
  ["","Ekipmanınız, her biri diğer parçalarla uyumlu ve kusursuz bir biçimde tasarlanıp geliştirilen Gemak Orijinal Yedek Parçalarıyla çalışmaya başlar. Ekipmanlarınızın sorunsuz, daha çok enerji tasarrufuyla çalışabilmesi için düzenli servis gerekir.Müşterilerimize her zaman periyodik bakım öneriyor ve bu hizmeti memnuniyet ile sunuyoruz."],
  ["","Ekipmanınızın bakımıyla ilgili tüm sorularınızı yanıtlamaktan ve bakımı için randevu vermekten memnuniyet duyacaktır. Randevu ve arıza bildirimleriniz için internet sitemizden, telefonla veya e-posta yoluyla bize ulaşabilirsiniz."]];

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
              child: Center(
                child: PageTitle(title: "Pastörizatör Modelleri"),
              ),
            ),
            SliverToBoxAdapter(
              child: PastModelCard(pic: piclist[0], title: titlelist[0]),
            ),
            SliverToBoxAdapter(
              child: PastModelCard(pic: piclist[1], title: titlelist[1]),
            ),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }

}

