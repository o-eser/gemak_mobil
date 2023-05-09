import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class SterilPage extends StatelessWidget {
  SterilPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads//urunler/sterilizator.png";
  String title = "Sterilizatör";
  String title1 = "Teknik Özellikler";
  List<List<String>> yazi = [
    [
      "",
      "Süt ve meyve suyu üretimi yapan firmalar bu üretimlerinde aromaların istenilen değerlerde olması için ve ürün kıvamını tam anlamı ile tutturabilmek için bir takım Ar-Ge çalışmaları yapmak zorundadırlar. Bu Ar-Ge çalışmalarını çoğu firma seri üretimde kullanmış oldukları makineler ile yapmakta olup seri imalat sırasında kullandıkları hammadde miktarını sisteme beslemek zorunda kalmaktadırlar. Dolayısı ile ürünün yapısı aroması tutmadığı takdirde deneme çalışmaları boşa gitmekte ve hammadde bakımından işletme zarara uğramaktadır. Süt ve meyve suyu sektöründe üretim yapan firmaların bu sıkıntılarını Gemak Pilot Tipi Borulu Sterilizatör ile çözüyoruz."
    ],
    ["","Gıda üretimi yapan firmalar ürünlerinin seri imalat aşamasından önce üretilecek ürünün reçetesini belirleyerek uygun aromayı ve uygun ürün kıvamını yakalamak için bir takım deneme çalışmaları gerçekleştirmektedirler. Bu çalışmalar neticesinde oluşan karışımı reçetelendirerek daha sonraki imalatlarının standart olması açısından kaydetmesi gerekmektedir. Bu aşamada üretici firmalar laboratuvar ortamında ya da mevcut makinelerinde bu karışımları oluşturmakta ve seri üretimlerini gerçekleştirmektedirler."],
    ["","Firmamızın yapmış olduğu fizibilite çalışmalarından yola çıkarak ülkemizde süt ve meyve suyu üretimi yapan firmaların Ar-Ge çalışmaları için kullanmaları gereken pilot tipi makineleri tedarik etme noktasında ülke içerisinde bu tip makinelerin üretimini yapan firmaların olmaması nedeni ile sıkıntı yaşadığı ve yurt dışından alınması gereken bu makinelerin fiyatlarının neredeyse yurt içinden alınan seri imalata yönelik makineler ile aynı olduğu görülmüştür. Bu durumda firmalar bu makineleri firmalarının bünyelerine katmak yerine daha büyük hacimlerde imalat yapabilen seri imalata yönelik makineler ile Ar-Ge çalışmalarını gerçekleştirmektedirler. Seri imalatta çalışan makinelerin üretim hacimlerinin çok büyük olması ve deneme bile yapılacaksa makinenin tank kapasitesi ne kadar ise aynı oranda ürün beslemeleri gerekmektedir. Ar-Ge çalışması yapılan ürünlerin tek seferlik denemeler ile aroma ve kıvamlarının tutturulmasının zorluğu bakımından birkaç deneme neticesinde firmalar doğru reçeteyi uygulayabilmektedirler. Bu nedenle her başarısız deneme çalışması tonlarca ürünün atık hale gelmesine neden olmakta ve firmaların hem zaman olarak hem de maddi olarak kayıplara uğramasına yol açmaktadırlar."]
  ];
  List<List<String>> yazi1 = [
    ["", "Kapasite: 150 lt/saat"]
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
                      """Pilot Tipi Borulu Sterilizatör"""),
                )),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CustomTextView1(yazi: yazi1, title: title1, pic: "")
          ],
        ));
  }
}
