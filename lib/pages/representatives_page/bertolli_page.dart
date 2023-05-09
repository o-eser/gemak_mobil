import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class BertoliPage extends StatelessWidget {
  BertoliPage({Key? key}) : super(key: key);
  String pic = "https://www.gemak.com.tr/uploads/pages/6819.jpg";
  String title = "Bertoli";
  List<List<String>> yazi = [
    [
      "",
      "Gıda, içecek, ilaç, kimya ve kozmetik sektörlerinde 50 yılı aşkın deneyime sahip Interpump Grup'un İtalyan markası Bertoli yüksek basınçlı homojenizatörler ve dalgıç pompalarda teknoloji lideri olarak anılmaktadır."
    ],
    [
      "",
      "Bertoli ile uzun yıllara dayanan işbirliğimiz sayesinde bugün Bertoli Türkiye Temsilcisi olarak her iki markanın gücünü ve profesyonelliğini müşterilerimize sunmaya devam ediyoruz."
    ],
    [
      "",
      "Tüm Bertoli Homojenizatörleri Gemak CIP (Yerinde Temizlik Üniteleri) ve sterilizasyon için uyumludur. Ayrıca ATEX-EX (Avrupa Birliği Patlayıcı ve Parlayıcı Ürünler Sertifikası), 3-A (Amerikan Gıda Standartları Sertifikası) ve EAC (Avrasya Uygunluk) sertifikalarına sahiptir. "
    ],
    ["","Firmamız, yüksek basınçlı homojenizatörler ve dalgıç pompaların kullanılacağı her türlü proses ve tesisin projelendirilmesinden kurulmasına, devreye alınmasından satış sonrası servis hizmetine kadar her türlü ihtiyaca cevap verebilecek yeterlilikte güvenilir bir çözüm ortağıdır."]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PageTitle(title: title),
            ),
            SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: PastModelCard(
                        pic: pic,
                        title: ""),
                  ),
                )),
            CustomTextView1(
              footerIn: true,
              titleIn: false,
              yazi: yazi,
              title: title,
              pic: "",
            ),
          ],
        ));
  }
}
