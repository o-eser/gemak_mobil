import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class SshPages extends StatelessWidget {
  SshPages({Key? key}) : super(key: key);
  String pic = "";
  String title = "Satış Sonrası Hizmetler";
  List<List<String>> yazi = [
    [
      "DÜZENLİ SERVİS, SÜREKLİ KAZANÇ!",
      "Sloganımız, Türkiye’deki tüm şehirlere 24 saat, yurtdışındaki tüm şehirlere de 36 saat içinde servis hizmeti vermektir.  Siz tesisinizle ne kadar gurur duyuyorsanız, biz de size sunduğumuz üretim ve servis hizmetlerimizle aynı derecede gurur duyuyoruz. Amacımız, GEMAK ekipmanlarını satın alındığı andaki üstün performansını, gerekli bakım ve hizmetleri sağlayarak korumaktır."
    ],
    [
      "",
      "Ekipmanınız, her biri diğer parçalarla uyumlu ve kusursuz bir biçimde tasarlanıp geliştirilen Gemak Orijinal Yedek Parçalarıyla çalışmaya başlar. Ekipmanlarınızın sorunsuz, daha çok enerji tasarrufuyla çalışabilmesi için düzenli servis gerekir. Orijinal yedek parçalardan herhangi birinin, ilgili kriterleri karşılamayan bir parçayla değiştirilmesi, ekipmanın güvenliğini ve performansını önemli ölçüde etkileyebilir. "
    ],
    [
      "",
      "Orijinal Yedek Parçaların kullanılması, teknisyenlerin bu parçaları Gemak’ın belirlediği kalite ve güvenlik standartlarına göre en kısa sürede değiştirmesini sağlar. Bu da ekipmanınızın performansını ve değerini en üst düzeyde tutar."
    ],
    [
      "",
      "Müşterilerimize her zaman periyodik bakım öneriyor ve bu hizmeti memnuniyet ile sunuyoruz. Bu hizmet paketini satın alan müşterilerimiz, çalışma saatleri ve işledikleri ürünlere göre bir bakım planına sahip oluyorlar. Ne zaman ve ne kadar süre ile tesislerinin duracağını biliyor, kendi planlarını gönül rahatlığı ile oluşturabiliyorlar. Hepsinin de ötesinde servis hizmetinde kullanılan orijinal yedek parçalarda özel bir indirime de sahip oluyorlar."
    ],
    [
      "",
      "Ekipmanınızın bakımıyla ilgili tüm sorularınızı yanıtlamaktan ve bakımı için randevu vermekten memnuniyet duyacaktır. Randevu ve arıza bildirimleriniz için internet sitemizden, telefonla veya e-posta yoluyla bize ulaşabilirsiniz."
    ],
    [
      "Teknik Üstünlük",
      "Gemak marka ekipmanınızı bizden daha iyi kimse tanıyamaz. Makinelerinizin bakımları daima özel tasarlanmış tamir takımları kullanılarak, uzman mühendisler ve teknisyenlerce yapılır."
    ],
    [
      "Uzman Servis Kadrosu",
      "Firmamızın servis bölümü, konusunda uzman servis mühendislerimiz, teknikerlerimiz ve ustalarımızdan oluşmaktadır. Her türlü soru ve sorununuz için, haftanın 7 günü 24 saat destek veren ekibimiz, sizlere her zaman destek vermeye hazırdır."
    ],
    [
      "Kolaylık",
      "Gemak ekipmanınızı yakından tanıyoruz. Bu nedenle size, tek bir kaynaktan doğru tamir ve bakım hizmetlerini, yedek parçaları ve servis garanti paketlerini uygun fiyatlarla sunuyoruz."
    ],
    [
      "Esneklik",
      "Ne kadar kişisel olursa olsun, her bir müşterimizin isteğini yerine getirmeye büyük önem veriyoruz. Üstelik bu yaklaşımımızı hizmetlerimizle de sınırlandırmıyoruz. Gemak ekipmanınızı isteğinize göre tam olarak kişiselleştirebilmeniz için zengin aksesuar ve otomasyon seçenekleri de sunuyoruz."
    ],
    [
      "Yakınlık",
      "Gemak Servisi ile her zaman ve her yerde yanındayız. Uzaktan bağlanma imkanı ve yerinde hızlı servis hizmeti ile yardıma ihtiyacınız olduğunda, hemen köşe başındayız."
    ],
    [
      "Makina Yaşına / Kullanımına Bağlı Bakım Gereksinimi",
      "Maintenance Requirement Depending On The Age / Utilization Of The Machine Ekipmanınız, yaşı ilerledikçe daha fazla bakım gerektirebilir. Son derece uygun fiyatlarla sunulan yedek parçalar ile tamir ve bakım hizmetleri sayesinde, Gemak ekipmanınızın yaşı ne olursa olsun, bu maliyetleri kontrol altında tutmanıza, sizin ve ekipmanınızın ihtiyaçlarını karşılayan en iyi çözümü seçmenize yardımcı oluyoruz."
    ],
    [
      "Eğitim",
      "Firmamızın devreye almış olduğu tüm ekipman ve sistemlerden, müşterimizin en yüksek faydayı sağlayabilmesi için, firmamız tarafından kapsamlı ürün ve sistem eğitimleri verilmektedir. Makine ve ekipman başında gerçekleştirilen, uygulamalı eğitimlerimiz sırasında, müşterimize ve operatör çalışanlarına çalışma prensipleri hakkında, detaylı ve kolay anlaşılır dokümanlar vermekteyiz."
    ],
    [
      "Yedek Parça Tedariği",
      """• Üretimini ve satışını yaptığımız her ürüne ait yedek parça stoğu (30.000 değişik çeşit yedek parça stoğu)
• Stoktan hemen teslim hizmeti
• Elektronik ortamda yedek parça katalog numarası takibi
• Elektronik ortamda müşteri ve makina bazında (seri/lot) yedek parça ve servis takibi
• Gerekli olduğu durumlarda yedek parça tamiri
• Garantili parça tedariği"""
    ]
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
