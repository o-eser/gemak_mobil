import 'package:flutter/material.dart';
import 'package:gemak/pages/kurumsal_page/hakkimizda.dart';

import '../../wigdets/buildCustomWidget.dart';

class IsgPage extends StatelessWidget {
  IsgPage({Key? key}) : super(key: key);
  String title = "İŞ SAĞLIĞI ve GÜVENLİĞİ POLİTİKAMIZ";
  String pic = "";
  List<List<String>> yazi = [
    [
      "",
      "Çevrenin korunabilmesi için; Atıklarımızı kaynağında ayrı ayrı toplayarak tehlikeli ve tehlikesiz atıklarımızı karıştırmıyor geri dönüşümü mümkün olan atıkları bu sayede doğamıza kazandırmış oluyoruz.  Oluşan atıklarımızı da tesisimizde yer alan tehlikeli ve tehlikesiz atık geçici depolama alanlarımızda depoluyoruz. Tehlikeli atıklarımızı Çevre ve Şehircilik Bakanlığı tarafından yetkilendirilmiş firmalara gönderiyor ve bu şekilde atıklarımızın geri kazanımını/bertarafını sağlamış oluyoruz.  Tehlikesiz atıklarımızı ise Çevre ve Şehircilik Bakanlığı tarafından yetkilendirilmiş firmalara gönderiyor ve atıklarımızın geri dönüşümünü sağlamış oluyoruz."
    ],
    [
      "Atık Sınıflandırılması",
      "Atıklarımızın kaynağında ayrı toplandığı konteynerlerde ve depolandığı geçici depolama alanlarında Atık Yönetimi Yönetmeliği’nce uygun kodlarla ve atığın kaynağına, bileşimine ve özelliklerine göre sınıflandırarak kaynakta toplanmasını ve depolanmasını sağlıyoruz. "
    ],
    [
      "",
      "Atıklarınızı ilgili toplama kutularına attığınız için siz ziyaretçilerimize teşekkür ederiz. Bu sayede geri dönüşümü mümkün olan atıklarımızın doğaya kazandırılmasına katkıda bulunmuş oluyorsunuz."
    ],
    [
      "",
      "Proses sonucu oluşan geri dönüştürülemeyen atıklarımızı ağzı kapalı sızdırmaz konteynerlerde/varillerde biriktiriyoruz. Zemini beton, üstü kapalı, kilitli, Atık Yönetim Yönetmeliğinde belirtilen kodların yer aldığı tehlikeli atık geçici depolama alanlarımızda 180 günü aşmayacak şekilde depoluyoruz. Depolanan atıklarımız Çevre ve Şehircilik Bakanlığının yetkilendirdiği firmalara gönderilerek geri kazanımı/bertarafı sağlanmış oluyor."
    ],
    ["", "•  Çevre ile ilgili tüm yerel ve ulusal kanun ve yönetmeliklere uymak."],
    [
      "",
      "•  Elektrik, yakıt ve su sarfiyatlarının tüketimlerini minimize ederek kaynaklarımızı koruyacak tedbirler almak ve her yıl hedefler koyarak sürdürülebilir yaşam sağlamak."
    ],
    [
      "",
      "•  Faaliyetlerimiz sonucu oluşan katı, sıvı ve gaz atıklarımızın azaltılması için önlemler almak, tekrar kullanım veya geri kazanım imkânları uygulamaya çalışmak. Atık oluşumunun kaynağında önlenmesi için çalışmak."
    ],
    [
      "",
      "•  Faaliyetlerimizin çevre ve insan sağlığı üzerindeki olası önemli etkilerini kontrol altında tutmak ve en aza indirmek için uygun teknolojiler kullanmak."
    ],
    [
      "",
      "•  Çevre konusunda başarıya ulaşmak için tüm çalışanlarımızı bilinçlendirmek ve bireysel sorumluluk kazandırmak için eğitimlere tabi tutmak."
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: buildAppBar(),
        body: CustomTextView(yazi: yazi, title: title, pic: pic));
  }
}
