import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';


class ExchangerTestPage extends StatelessWidget {
  ExchangerTestPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/esanjor-test-hizmeti.jpg";
  String title = "Eşanjör Test Hizmeti";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      """Gemak Eşanjör Test Hizmeti ile eşanjörlerinizi sökmeden, üretiminizi saatlerce aksatmadan kaçakları ve kaçak riski taşıyan kılcal çatlakları 15 dakika kadar kısa bir sürede tespit ediyoruz. Eşanjörünüzün durumunu "Risksiz, Az Riskli ve Çok Riskli" şekilde kategorize ederek size rapor sunuyoruz.""",
      "Eşanjörlerinizdeki kaçak riski, korozyon, gözle görülmeyecek kılcal çatlakları ve kör noktaları tespit ediyoruz. Sadece ekipmanınızdaki ve prosesinizdeki veriminizi arttırmakla kalmıyor; başta gıda olmak üzere bulaş/kontaminasyon, mikrobiyolojik bozulma ve ürün zaiyatı gibi risklere karşı işletmenizi korumanız için size yol gösteriyoruz. Kısaca Eşanjör Test Hizmetimiz ile eşanjörlerinizi ve prosesinizi daha uzun süre ve verimli kullanabilmeniz için olası riskleri bilerek önlem almanıza yardımcı oluyoruz."
    ],
    [
      "Gemak Eşanjör Test Hizmetini Neden Tercih Etmelisiniz?",
      "•  Profesyoneldir; Sızıntı yapan ya da yapma ihtimali olan plakalı veya borulu eşanjörlerinizin mümkün olan en hızlı şekilde yüksek performansla tekrar çalışmasını sağlar."
    ],
    ["", "•  Tespit Uzmanıdır; Gözle görülemeyecek kadar küçük kılcal sızıntı odaklarını, korozyonu ve mikroskobik çatlakları eşanjörün sökülmesine gerek kalmadan tespit eder."],
    ["", "•  Hızlıdır; Eşanjörünüzün bükülüğüne ve üniteye bağlı olarak 15 dakika gibi kısa bir sürede gerekli analizleri yapar."],
    ["", "•  Güvenilirdir; Test esnasında kullanılan hidrojen ve azot gaz karışımı sayesinde sıvıların nüfus edemediği noktalara bile kolaylıkla erişebilir. Kullanılan gazların tamamı gıda endüstrisinde kullanılmaya uygundur."],
    ["", "•  Hijyeniktir; Zararlı kimyasalların veya boyaların eşanjörünüze bulaşmasını engeller. Test sonrası detaylı CIP temizliğine gerek kalmaz."],
    ["", "•  Hassastır; İşlem esnasında eşanjörünüzün plakalarını ve contalarını zorlamaz, aşındırma yapmaz."],
    ["", "•  Ekonomiktir; Eşanjörün sökülmesine gerek duyulmadığı için zamandan ve paradan tasarruf etmenizi sağlar. Günler süren servis ve bakım-onarım işlemlerini en kısa sürede bitirmenize yardımcı olur, üretim hatlarındaki duraklama zamanını azaltır."],
    ["", "•  Proaktiftir; Olası çatlakları ve sızıntı riskini öngörebildiğinden olası eşanjör arızalarına erkenden önlem almanız için zaman kazandırır."],
    ["", "•  Kullanıcı Dostudur; Her boyut ve alandaki eşanjörlerde kolaylıkla kullanılabilir."],
    ["", "•  Çözümleri Kalıcıdır; Ürün ve sıvı karışım problemi yaşamadan olası çatlak ve sızıntı odaklarını tespit edebildiğinden eşanjörünüzü daha uzun süre, maksimum verimle kullanmanıza olanak tanır."],
    ["", "•  Çevre Dostudur; Helyum gibi doğada bulunması ve kullanması zor olan gazlar yerine doğada bulunan hidrojen ve nitrojen gibi çevreye zarar vermeyen gazlar kullanılır."],
    ["","Eşanjörlerinizin ve proseslererinizin durumunu öğrenmek için hemen Gemak Servis Ekibi ile iletişime geçebilirsiniz. Gemak Servis Ekibi alanında uzman kadrosu ile müşterimizin tüm ekipman ve sistemlerden en yüksek verimi alması için özveriyle çalışmaktadır. Devreye alma, eğitim, kontrol, arıza tespiti ve onarım gibi konularda yüksek bilgi birikimleri ile hem ekipman başında uygulamalı hem de ihtiyaç durumunda uzaktan bağlantı ile müşterilerimize hizmet vermektedir. "],
    ["","Başta plakalı eşanjörler olmak üzere, borulu eşanjörler ve UHT sistemler olmak üzere tüm proses ekipmanlarınızdaki kaça veya kaçak riski taşıyan kılcal çatlaklar için Gemak Servis Ekibimiz ile gemak@gemak.com.tr mail adresimizden veya +90 0312 641 32 52 numaralı telefondan iletişime geçebilirsiniz."],

  ];
  List<List<String>> yazi1 = [
    [
      "",
      "Gemak Eşanjör Test Hizmeti; plakalı eşanjörler, borulu eşanjörler ve UHT sistemler olmak üzere tüm proses ekipmanlarınızla çalışmaya uygundur. "
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(textPadding: 2,
              footerIn: false,
              yazi: yazi,
              title: title,
              pic: pic,
            ),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
