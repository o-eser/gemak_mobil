import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class AutomationSofwarePage extends StatelessWidget {
  AutomationSofwarePage({Key? key}) : super(key: key);
  String pic = "";
  String title = "Otomasyon - Yazılım";
  List<List<String>> yazi = [
    [
      "",
      "Otomasyon ve akıllı yönetim sistemleri, işletmenin yüksek karlılık ile çalışabilmesinde, makinaların performansı veya hammaddenin kalitesi kadar önemli role sahip. Proses hatlarını ve üretimi her aşamada ve tek noktadan kontrol edip, verimliliği arttırmanın, kalitede istikrarı sağlamanın yolu otomasyon çözümlerini kullanmaktan geçiyor."
    ],
    [
      "",
      "Sürdürülebilir bir büyüme için tüm dünyada kabul gören strateji; daha az insan gücü, daha düşük maliyetler ve daha yaratıcı ürünler. Bu da şirketleri, en önemli kaynağı olan insan gücünü, üretimden çok rekabet avantajı yaratacağı Ar-Ge faaliyetlerinde kullanmaya itiyor. Gemak, geleceğin üretim vizyonuyla birlikte, ünite ve tesis bazlı otomasyon için optimum kontrol sistemleri sağlamaktadır."
    ],
    [
      "",
      "Gemak, kendi bünyesinde istihdam ettiği otomasyon ekibi ve sektöründe lider uzman çözüm ortakları ile otomasyon projeleri hazırlıyor, tesisleri daha kolay yönetilebilir hale getirmek için hizmet veriyor ve müşterilerini Endüstri 4.0 yolculuğunda desteklemek için inovatif çözümler sunuyor:"
    ],
    [
      "",
      """
• Reçete uygulamaları,
• Proses kontrolü,
• Veri toplama ve izleme,
• Makine ayarlarının kontrolü,
• Internet of Things (IoT) çözümleri,
• Tam otomatik insansız karanlık fabrika konsepti."""
    ],
    [
      "",
      "Anahtar teslim proses otomasyonundaki engin tecrübesiyle Gemak, toplam tesis bazlı ve tek ünite tabanlı otomasyon ve kontrol sistemleri için özel çözümler sunmaktadır. Otomasyon sistemlerimizle, ürününüzü mümkün olduğunca hızlı ve kaliteli bir şekilde üretirken; daha düşük maliyetlerle daha yüksek verimlilik seviyelerine ulaşmasını sağlamaktayız. Akıllı veri yönetimi ve bildirimleri sayesinde stratejik kararlar vererek ürün kalitenizi artırmanızı, önleyici bakım yapabilmenizi, üretiminizi optimize etmenizi ve enerji verimliliğini garanti ediyoruz."
    ],
    [
      "",
      "Müşterilerimizin üretim süreçlerini otomatikleştiren sektör lideri otomasyon çözümlerimiz ile Endüstri 4.0 altyapısına uygun bir sisteme sahip olmalarını sağlıyoruz. Gerçek zamanlı olarak operatörden bağımsız sahadaki makine ve PLC’lerden toplanan veriler, operasyonel bilgiye dönüştürülerek kaydedilir, otomatik raporlama sayesinde anlık raporlanır. Bu bilgiler MES / ERP sistemlerine iletilebilir. Kurduğumuz sistemlerle Endüstri 4.0'ı tamamen karşılayan, yani karşılıklı çalışabilen, sanallaştırma özelliği olan, özerk yönetilebilen, gerçek-zamanlı yeteneğine sahip, hizmet oryantasyonu yapabilen yeni nesil fabrikalar kuruyoruz."
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
