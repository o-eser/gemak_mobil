import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class HumanResourcesPage extends StatelessWidget {
  late int pageroute;

  HumanResourcesPage({Key? key, required this.pageroute}) : super(key: key);
  List<List<String>> pageDetail = [
    ["""İNSAN KAYNAKLARI POLİTİKAMIZ""", ""],
    ["ÇALIŞAN PROFİLİ", "https://www.gemak.com.tr/uploads/editor/buyuk_353c215d.jpg"],
    ["İŞE ALIM SÜRECİ", ""],
  ];
  static List<List<String>> yazi = [
    [
      "",
      """Gıda, kimya ve ilaç sanayilerine yönelik ekipman üretimi, otomasyon ve anahtar teslim tesis kurulmasında önce olan GEMAK'ta, tüm faaliyetlerimizde öncelikli değerin "İnsan" olduğu anlayışı ile yön veriyoruz."""
    ],
    [
      "",
      "Çalışanlarımızın kendilerini rahatlıkla ifade edebilecekleri ortamları oluşturarak yaratıcılık, iş ve ürün geliştirme odaklı çalışma tarzını teşvik ediyoruz."
    ],
    [
      "",
      "İnsan Kaynakları misyonumuz, uzun vadeli planlamalara imkan veren, adil, kurum içinde dengeli ve gelişim odaklı sistemler kurmaktır. Bu sistemde yenilikçi ve dinamik organizasyonumuz ile daha da güçlü olmayı hedefliyoruz."
    ],
    [
      "",
      """
    •  Şirketimizin kültür değerlerine uygun, yetenekli insan kaynağını GEMAK'a kazandırma, çalışanların gelişimine yatırım yaparak motivasyon ve bağlılıklarını artırmak, sürdürülebilir yüksek performansı teşvik ederek kurumsal amaç ve hedeflerimize ulaşmamızı sağlayan sistemler geliştirmek,
    •  Tüm sahalarda sağlıklı ve güvenli bir çalışma ortamı sağlamak; önleyici faaliyetler ile iş kazalarını en aza indirmek,
    •  Çalışanlarımızın refah seviyesini artırmak,
    •  Çalışan memnuniyeti ve aidiyet duygusu açısından fark yaratmak,
    •  İşletmenin amacı ve hedefleri ile işletme çalışanlarının ihtiyaç ve beklentilerini uyumlu hale getirme yolunda, işletme yönetiminin karar mekanizması içinde yer alıp, işletme kararlarında katılımın sağlandığı bir İnsan Kaynakları stratejisini bünyesine kazandırmaktır."""
    ]
  ];
  static List<List<String>> yazi1 = [
    [
      "",
      """
      Açık pozisyonlarımız www.kariyer.net üzerinden yayınlanmaktadır. İnsan Kaynakları departmanı tarafından başvurusu olumlu değerlendirilen adaylar, ilgili bölüm yöneticilerinin de katıldığı, teknik bilgi, birikim, kişisel özellikler ve kurum kültürüne uyum gibi konuların ana çerçevesini oluşturduğu görüşmelere davet edilir. Bu sürecin sonunda işe alım prosedürüne uygun olarak geri bildirim yapılır.
      Başvurularınız gizli tutulmakta ve şirket içindeki ilgili birimler haricinde paylaşılmamaktadır."""
    ]
  ];
  List yaziList = [
    yazi,
    [
      ["", ""]
    ],
    yazi1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              yazi: yaziList[pageroute],
              title: pageDetail[pageroute][0],
              pic: pageDetail[pageroute][1],
            ),
          ],
        ));
  }
}
