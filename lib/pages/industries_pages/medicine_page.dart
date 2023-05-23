import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class MedicinePage extends StatelessWidget {
  MedicinePage({Key? key}) : super(key: key);
  String title = "İlaç";
  List<List<String>> yazi = [
    [
      "",
      "Gemak’ın teknolojileri arasında hijyenik akışkanlar, ürün transferi ve dozajlaması, likit ürünlerin ısıl işlemleri ve depolanması, mobil olarak taşınması, fermantasyon, mekanik ayırma, yüksek basınçlı homojenizasyon, tesis otomasyon sistemleri (SCADA ve MES) ve CFR bulunmaktadır. Üretim ve montaj GMP ve ASME BPE güncel yılına ait standartlara göre yapılmaktadır. Ürün portföyümüzde ayrıca otomasyon, veri toplama, kontrol, yönetme ve SIP ve CIP çözümleri dahil olmak üzere bir dizi karıştırma ve formülasyona bağlı reçete sistemi bulunmaktadır."
    ],
    ["","Tasarım aşamasından, hijyenik standartlara uygun anahtar teslim tesis ve proses hatlarının yapımı ve otomasyonuna kadar tüm gereklilikleri yerine getiren GEMAK, kendini müşteri odaklı çözümler geliştirmeye adamıştır. İlaç ve kimya endüstrileri için eksiksiz bir proses hattı üreticisi olan GEMAK, tüm gereksinimlerinizi karşılayan tam kapsamlı bir çözüm sağlayıcıdır. Konularında uzman mühendislerimiz, yenilikçi ve verimli süreçler için planlama, geliştirme, kurulum, kalifikasyon ve bakıma kadar proje ekibinizle işbirliği yaparak uygulamalarınız için çözümler üretir. "],

  ];
  List<List<String>> yazi1 = [
    ["Çözümlerimiz:", """
    •  Ürün transferi ve dozlama,
    •  Isı transferi,
    •  Depolama ve transfer sistemleri,
    •  Fermentasyon,
    •  Mekanik ayırma,
    •  Homojenizasyon,
    •  Otomasyon,
    •  Yerinde temizlik (CIP) sistemleri,"""],
  ];
  List<List<String>> yazi2 = [
    [
      "Başlıca Hizmetlerimiz:",
      """
      •  Gemak, hammaddelerin sürekli işlenmesi için ekipman tasarlayıp, üretip devreye almaktadır.
      •  Kişiye özel çözümler sunma yetkinliğimiz, ilaç endüstrisindeki müşterilerimizin karmaşık ve çok özel proses tasarım gereksinimlerini karşılamamızı sağlamaktadır.
      •  İlaç endüstrisi için kesin gereklilikleri ve imalat kalitesi kurallarını yerine getirme konusunda deneyim ve yeteneklere sahiptir."""
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
              titleIn: false,
              yazi: yazi2,
              title: "",
              pic: "",
            ),
          ],
        ));
  }
}
