import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class HomojenizatorPage extends StatelessWidget {
  HomojenizatorPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/homojenizator.jpg";
  String title = "Homojenizatör";
  String title1 = "Servis ve Destek";
  List<List<String>> yazi = [
    [
      "",
      "Firmamız, dünyada homojenizatör ve yüksek basınç piston pompalarının kullanılacağı her türlü ihtiyaca cevap veren güvenilir bir çözüm ortağıdır."
    ],
    [
      "",
      "35 yılı aşkın birikimiyle, müşteriyi başlangıç ve bitiş noktası olarak kabul eden kalite sistemimizle  ve her an geliştirtirdiğimiz makina ve servislerimizle, tüm müşterilerimize en iyi şekilde hizmet vermek bizim felsefemizdir."
    ],
    [
      "",
      "Bertoli kalite sistemi, bu felsefe ile, UNI EN 9001:2008 ve UNI 14001:9004 standartlarını garanti etmektedir."
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
              pic: "",
            ),
            SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(
                  pic: pic,
                  title:
                      "Gıda ve kimya sektöründe ürünlerin yüksek basınçlı olarak transferini sağlar."),
            )),
            SliverToBoxAdapter(
                child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const PastModelCard(
                    pic: "https://www.gemak.com.tr/uploads/temsilcilikler/6819.jpg",
                    title: ""),
              ),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: PageTitle(title: "Homojenizatör Modelleri"),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: PastModelCard(
                  pic: "https://www.gemak.com.tr/uploads//urunler/rafaello-serisi.png",
                  title: "Rafaello Serisi",
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: PastModelCard(
                  pic: "https://www.gemak.com.tr/uploads//urunler/leonardo-serisi.png",
                  title: "Leonardo Serisi",
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: PastModelCard(
                  pic: "https://www.gemak.com.tr/uploads//urunler/atomo-3-0.png",
                  title: "Atomo 3.0",
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
