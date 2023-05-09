import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class ValveCluster extends StatelessWidget {
  ValveCluster({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/vana-tarlasi.png";
  String title = "Vana Tarlası";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "GEMAK vana tarlaları, en yüksek standartlarda, rekabetçi fiyatlarla ve en kısa teslim süreleriyle ALFA LAVAL vanaları kullanılarak üretilmektedir."
    ],
    [
      "",
      "Montaj ve devreye alma ekibimiz, hijyenik proses tesislerinde izlenecek uygulamaları anlamak için özel olarak eğitilmiştir ve tesisin nispeten ince boruları için yüksek vasıflı kaynakçılar içermektedir."
    ],
    ["","Prosesinize özel çözümler üretilerek ihtiyaca uygun şekilde vana tarlası tasarlanabilmektedir."],["","GEMAK vana tarlaları önceden monte edilmiş ve önceden test edilmiş, ayrıca tamamen kablolanmış ve gerekli kontrol paneli önceden bağlanmış olarak teslim edilmektedir."],
    ["","Bu, karmaşık kurulumları bile mümkün olduğu kadar çabuk çevrimiçi hale getirebileceğiniz, zamandan tasarruf sağladığınız ve yerinde sorun giderme ve aksama süreleriyle ilişkili gelir kaybını önleyebileceğiniz anlamına gelir."],
    ["","Vana tarlaları, çoklu vana kumandası üst seçenekleri, pozisyon göstergeleri, yakınlık anahtarları, mikro şalterler ve harici olarak monte edilmiş seçenekler sunar ve dahili arayüz ve bağlantı seçeneklerine ve solenoid valflere sahip olabilir. Tüm işleme tesisleri müşterilerimize en ergonomik çözümü seçme imkanı vererek, yapımlarından önce 3D olarak tasarlanmıştır."]
  ];
  List<List<String>> yazi1 = [
    ["", "Vana tarlaları, müşterilerin ihtiyacı doğrultusunda tasarlanır. Üretimi ve saha montajı yapılarak otomasyona entegre edilerek devreye alınır."],
    ["", "Gıda tesislerinde tam fonksiyonelliği, üretimde esnekliği, ürün kaybının minimize edilmesini sağlar.  Sistem ihtiyaçları doğrultusunda Alfa Laval mixproof, SSV vanalar ve feedback üniteleri kullanılarak eşsiz çözümler sunulmakta ve sıvı ürünlerin transferinde yüksek hijyenik / aseptik standartlar sağlanmaktadır."],
    ["", "KULLANIM ALANLARI :"],
    ["", "•  Süt ve Süt Ürünleri"],
    ["", "•  Kimya"],
    ["", "•  Gıda Sanayi"],
    ["", "•  İlaç Sanayi"],
    ["", "•  Endüstriyel Tesisler"],
    ["", "•  Meyve Suyu"]
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
                      """Hijyenik proses tesisleri için ALFA-LAVAL SSV, DSV ve Mixproof vana bulunan şase monteli vana tarlaları"""),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
