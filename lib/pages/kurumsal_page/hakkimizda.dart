import 'dart:math';

import 'package:flutter/material.dart';

import '../../wigdets/buildCustomWidget.dart';
import '../../wigdets/footer.dart';

class HakkimizdaPage extends StatelessWidget {
  HakkimizdaPage({Key? key}) : super(key: key);
  String title = "HAKKIMIZDA";
  String pic = "https://www.gemak.com.tr/uploads/editor/buyuk_424c215d.jpg";
  List<List<String>> yazi = [
    [
      "",
      "Temelleri 1969 yılında atılan GEMAK, özellikle süt ve süt ürünleri tesislerine yönelik ekipman üretimi, otomasyon ve anahtar teslim tesis kurulmasında öncü kuruluştur."
    ],
    [
      "",
      "GEMAK süt ve meyve suyu tesislerinin yanı sıra, yağ, çikolata, bisküvi, şurup, karamel, salça, ketçap, mayonez ve fermente ürünler gibi diğer gıda prosesleriyle, kimya  ve ilaç sanayine yönelik çözümleriyle de müşterilerine modern, hijyenik, otomatik ve son teknoloji sistemler sunmaktadır."
    ],
    [
      "",
      "Ankara 2. Organize Sanayi Bölgesi’nde toplam 23.000 m2’lik alan üzerine kurulu modern tesislerimizde, 30 yılı aşkın tecrübesiyle, Ar-Ge, Proje, Üretim, Montaj, Satış ve Servis bölümleri ile gıda, kimya, ilaç gibi geniş bir yelpazede faaliyet gösteren üreticilere, projeye özel ürünler geliştirerek tesisin projelendirme, üretim ve kurulumunu yapıyor, dünyaya ihraç ediyoruz. Türkiye ve 30'u aşkın ülkede tesis kuran GEMAK, genişletilmiş garanti süresi, satış sonrası servis ve yedek parça desteği ile tam kapsamlı hizmet vermektedir."
    ],
    [
      "",
      "İngiltere ve Fransa başta olmak üzere KKTC, Ukrayna, Bulgaristan, Romanya, Yunanistan, Birleşik Arap Emirlikleri, Mısır, Libya, Cezayir, Nijerya, Kazakistan, Türkmenistan, Azerbaycan, Özbekistan, İran, Irak, Suriye, Ürdün, Yemen, Malezya ve Suudi Arabistan’da faaliyet gösteren uluslararası şirketler, yeni projeleri için tekrar tekrar GEMAK kalitesini tercih etmektedir."
    ],
    [
      "",
      "Bugün gelinen noktada GEMAK ulusal ve uluslararası platformda göstermiş olduğu başarı, geniş ve kaliteli ürün gamı, yatırımları, 2017 yılında kurmuş olduğu Ar-Ge merkezi  ve sürdürülebilir kalite anlayışı ile pek çok başarılı projeye imza atmış, müşterilerine yenilikçi teknolojiler ve çözümler üretmeye devam etmektedir."
    ],
    [
      "Vizyonumuz",
      "Daha sağlıklı, daha verimli ve çevreyle dost üretim teknolojileriyle yeni nesil fabrikaları kuran bir dünya markası olmak."
    ],
    [
      "Misyonumuz",
      "Müşterilerimize yüksek kaliteli özel çözümler üretebilmek için faaliyetlerimize yenilikçi bakış açısı ve ileri teknolojinin tüm imkanlarından yararlanarak yön vermek."
    ],
    [
      "Toplam Kalite",
      "Birinci sınıf malzeme ve işçilik ile üretiyoruz. Tasarımını yaptığımız tüm tesislerde, her biri alanında pazar lideri markaların hammadde ve ekipmanlarını kullanıyoruz. Yüksek kalite standartlarında, ileri teknolojiye sahip ürünleri, kendi tesislerimizde üretiyoruz."
    ],
    [
      "Global Tecrübe",
      "Dünyanın dört bir yanında anahtar teslim tesis ve proses hatlarının kurulumunu yapıyoruz ve pek çok yeni pazarda yapmaya devam ediyoruz. Müşterilerimizin çoğunluğu proje aşamasından itibaren uzun yıllardır hizmet verdiğimiz tesislerden oluşuyor."
    ],
    [
      "Kapasiteye Özel Çözümler",
      "Gıda sektöründe faaliyet gösteren en büyük uluslararası şirketlerden, yerel aile işletmelerine kadar farklı ihtiyaçlar için komple çözümler üretiyoruz. Müşterilerimizin talep ve düşüncelerini dikkatle dinliyor ve ekipmandan yerleşim planına kadar tüm ürünleri, kapasite ve otomasyon tercihine göre şekillendiriyoruz"
    ],
    [
      "Ürüne Özel Projelendirme",
      "Süt ve süt ürünleri, meyve suyu, dondurma ve hazır gıda gruplarında farklı ürünler için özel çözüm, makine ve proses hatları kuruyoruz. Her projeyi, ilgili ürün grubu konusunda birikim sahibi mühendislerden oluşan bir ekip ile yönetiyoruz."
    ],
    [
      "Projeden Montaja Uzman Kadro",
      "Yeni tesis kurulumu, proses hattı, kapasite artırımı ve otomasyon ile ilgili tüm projeleri hazırlıyor ve danışmanlık hizmeti veriyoruz. Montaj-devreye alma sürecinin hızlı ve problemsiz tamamlanması için, uluslararası pazarlarda kendini kanıtlamış uzman proje yöneticileri ve yüksek işçilik kalitesi ile çalışıyoruz. Cazip imkanlar ile periyodik bakım ve yedek parça hizmetleri sunuyoruz. Bu hizmetlerin tümünü çok sayıda başarılı projenin altına imza atmış, alanında uzman mühendis ve teknisyenlerden oluşan ekibimiz ile veriyoruz."
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomTextView(
        title: title,
        pic: pic,
        yazi: yazi,
      ),
    );
  }
}

