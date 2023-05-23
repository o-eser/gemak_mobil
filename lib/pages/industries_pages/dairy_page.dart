import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class DairyPage extends StatelessWidget {
  DairyPage({Key? key}) : super(key: key);
  String title = "Süt ve Süt Ürünleri";
  List<List<String>> yazi = [
    [
      "",
      "Gemak, çiftlikten çatala konsepti ile süt endüstrisi için anahtar teslim tesisler kurmaktadır. Süt tesislerinin dizayn, mühendislik, makina üretimi ve tedariği, devreye alma aşamalarını tamamlayarak müşterilerimizin ihtiyaçlarını karşılamaktır."
    ],
  ];
  List<List<String>> yazi1 = [
    ["Ürettiğimiz Ürünler:", """
    •  Süt taşıma tankları
    •  Süt alım hatları ve tankları,
    •  Yüksek Isı Kısa Süre (HTST) ve Ultra Yüksek Isı (UHT) süt pastörizasyon ve standardizasyon sistemleri,
    •  Sürülebilir, yarı sert ve sert peynir üretim hatları,
    •  Yoğurt, ayran, kefir üretim hatları,
    •  Kaymak, tereyağ, üretim hatları,
    •  Süt tozu, dondurma ve sütlü tatlı üretim hatları,
    •  Yerinde temizlik (CIP) sistemleri,
    •  Filtrasyon ve membran sistemleri.
    """],
  ];
  List<List<String>> yazi2 = [
    [
      "Tedarik Ettiğimiz Ürünler:",
      """
    •  Yüksek basınçlı piston pompaları ve Homojenizatörler,
    •  Emülgatör ve Inline Homojenizatörler,
    •  Santrifüjlü separatör ve dekantörler,
    •  Atomizer, nozzle ve süt tozu kulesi ekipmanları,
    •  Dolum makinaları,
    •  Dondurucu ve Dondurma Makinaları, şoklama tünelleri,
    •  Seramik ve Polimerik Membranlar,
    •  CIP Başlıkları ve Tank Ekipmanları,
    •  Komple Laboratuvar ve Ölçüm Cihazları,
    •  Vana ve Pompalar"""
    ],
  ];
  List<List<String>> yazi3 = [
    [
      "Sunduğumuz Hizmetler:",
      """
      •  Küçük, orta boy veya büyük ölçekli ayırımı yapmadan müşterilerimizin kapasite ve özel ihtiyaçlarına göre her türlü süt tesisi çözümleri sunuyoruz.
      •  Üstlendiğimiz her proje müşterilerimizin hayalleri, talepleri, bütçeleri ve büyüme planlarına uygun şekillendirilir.
      •  Üstlendiğimiz her proje müşterilerimizin hayalleri, talepleri, bütçeleri ve büyüme planlarına uygun şekillendirilir.
      •  Tüm uzmanlık hizmetlerimiz, ister anahtar teslimi isterse tak-çalıştır ünitesi olsun, her zaman aynı taahhüt ve kalite ile sağlanmaktadır.
      •  Periyodik bakım paketleri, yedek parçalar ve teknik destek içeren kapsamlı bir satış sonrası hizmet yelpazesiyle yatırımınızdan yüksek getiri almanızı sağlıyoruz.
      """
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              titleIn: false,
              yazi: yazi1,
              title: "",
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              footerIn: false,
              titleIn: false,
              yazi: yazi2,
              title: "",
              pic: "",
            ),
            CustomTextView1(
              textPadding: 1,
              titleIn: false,
              yazi: yazi3,
              title: "",
              pic: "",
            ),
          ],
        ));
  }
}
