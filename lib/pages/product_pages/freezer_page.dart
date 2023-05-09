import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class FreezerPage extends StatelessWidget {
  FreezerPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/freezer.png";
  String title = "Freezer";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    ["", "ÖZELLİKLER"],
    ["", "Üretimde yüksek esneklik."],
    ["", "Sağlamlık, güç ve uzun ömürlülük sağlamak için yüksek kaliteli malzemeler."],
    [
      "",
      "Hızlı bakım için, normal aşınma ve yıpranmaya maruz kalan parçalara kolay erişim sağlanabilmesi için tasarlanmıştır."
    ],
    [
      "",
      "Boru ve tüp su kondansatörü açılabilir ve temizlenebilir (mekanik ve kimyasal olarak)."
    ],
    ["", "Hermetik bir kompresörden daha güvenilir ve daha verimli."],
    ["", "Ucuz ve kolay bakım"],
    ["", "Donma haznesine verilen karışım ve hava miktarının kolay ve hassas ölçümü"],
    [
      "",
      "Meyve çekirdeği içeren karışımları, küçük tohum veya liflerde bile çalışabilme imkanı"
    ],
    ["", "Pompa gövdesi ve pistonlar arasında doğrudan temas bulunmamakta"],
    [
      "",
      "Tüm modeller C.I.P (yerinde temizlik) ünitesi ile bağlantıya hazır şekilde üretilmiştir"
    ],
    ["", "Yüksek performanslı soğutma sistemi"],
    ["", "-9C ‘ye kadar sert yapılı dondurma üretimi"],
    ["", "Pompa gövdesi ve pistonlar arasında doğrudan temas bulunmamakta"],
    [
      "",
      "Tüm modeller yağ ayırıcı, karbon filtre, sterilizasyon kartuşu ve yoğuşma-boşaltma filtresi ile donatıldığından, doğrudan tesisin basınçlı hava devresine bağlanacak şekilde hazırlanmıştır"
    ],
    [
      "",
      "Maksimum enerji tasarrufu ve en iyi üretim/kapasite/enerji tüketimi oranını elde etmek için tasarlamıştır."
    ],
    [
      "",
      "Tüm dondurucular, yürürlülükteki hijyenik ve kirlilik karşıtı kuralları olan E.E.C standartlarına uyar."
    ],
    ["", "Elektrik ve su kaynaklarına bağlandıktan sonra üretime hazırdır."],
    ["", "Makineye dahil bir adet standart yedek parça seti."],
  ];
  List<List<String>> yazi1 = [
    ["", "Kapasite: 300 lt/h - 400 lt/h - 600 lt/h - 800 lt/h - 1200 lt/h - 1600 lt/h "],
    ["", "Kullanım alanları:"],
    ["", "•  Endüstriyel Tip Dondurma"],
    ["", "•  Kahramanmaraş Tipi Dondurma"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              textPadding: 2,
              footerIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
            SliverToBoxAdapter(
                child: Center(
              child: PastModelCard(pic: pic, title: title),
            )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
