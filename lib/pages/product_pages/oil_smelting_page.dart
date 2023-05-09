import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class OilSmeltingPage extends StatelessWidget {
  OilSmeltingPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/yag-eritme-tanki.png";
  String title = "Yağ Eritme Tankı";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "Kullanım Şekli : Yağ blokları, sıcak su sirkülasyonunun olduğu ızgaralar üzerine sürülerek yağın eritilmesi ve depolanması sağlanır."
    ],
    ["","Yapı : Yağ bloklarının erimesi için paslanmaz çelik profil ve saçlardan imal edilmiş gövde, pnömatik açılıp kapanabilen kapaklar, ısı kontrollü sökülebilir ızgara, eriyen yağın depolandığı, ısı kontrolünün ve ısı izolasyonunun sağlandığı, karıştırıcısı bulunan hazne ve buhardan sıcak su üretiminin yapıldığı, 2 grup sıcak su hazırlama ünitesi, elektrik kuvvet, kumanda ve PCL yazılım sistemini ve bunların kendi aralarında iç borulamasını kapsamaktadır. CIP temizliğine imkan veren hijyenik tasarıma sahiptir."],
    ];
  List<List<String>> yazi1 = [
    ["", "Ürün Girişi : Yağ blokları"],
    ["","Hacim : 200 lt. - 6.000 lt."],
    ["","Kapasite : 100 kg/h - 8.000 kg/h arasında üretilmektedir."],
    ["","Aksesuarlar"],
    ["", "•  Karıştırıcı"],
    ["", "•  Alt, üst seviye sensörleri"],
    ["", "•  Sıcaklık transmiteri"],
    ["", "•  360° dönen CIP başlıkları"],
    ["", "•  Sisteme entegreli, vakum kırıcılı, pnömatik açılan ön ve arka kapaklar."],
    ["", "•  Yağ eritme ünitesi üzerine monte edilmiş, borulu tip eşanjörü, sirkülasyon pompaları, genleşme tüpü, hava atma, su ikmali, buhar kontrol kumanda ve borulamasının bulunan 2 grup sıcak su hazırlama ünitesi."],
    ["", "•  Su, buhar ve kondens ekipmanları."],
    ["", "•  Yağ bloklarının aktarımını sağlamak İçin tekerlekli, rulo konveyör ünite, paslanmaz çelik profiller üzerine montajlı bir şekilde üretilmiştir. Paslanmaz Çelik Rulo Konveyör: Yağ blok aktarımını kolaylaştırmak için tekerleklere sahip paslanmaz çelik rulo konveyör"]
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
                      """Yağ Eritme Tankı"""),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
