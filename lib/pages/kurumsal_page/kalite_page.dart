import 'package:flutter/material.dart';
import 'package:gemak/pages/kurumsal_page/hakkimizda.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';

class KalitePage extends StatelessWidget {
  KalitePage({Key? key}) : super(key: key);
  String pic="";
  String title="KALİTE POLİTİKAMIZ";
  List<List<String>> yazi=[["","Müşterilerimize karşı saygımızı ve varlığımızı sürdürmek için en kaliteli ürün ve hizmeti vermek amacı ile kaliteyi bir yaşam biçimi olarak kabul etmek temel prensibimizdir."],
  ["","Kaliteyi besleyen unsurların katılımcı bir çalışma ortamı, nitelikli ve eğitimli personel, sağlıklı çalışma koşulları, çevreye duyarlılık, zamana ve değişen şartlara uyumlu olmak olduğu inancındayız."],
  ["","Bu nedenle;                                                                                    "],["","Tüm çalışanlarımızı sürekli eğiterek kalite ve çevre bilincini arttırmak, güvenli çalışma ortamı sağlamak, yenilikleri ve çağdaş teknolojiyi uygulamak,"],
  ["","Müşterilerimize yüksek kaliteli ürünleri, en kısa zaman,  en yüksek kalite, performans, ürün güvenilirliği ve değer garantisi vererek sürekli sunmak,"],
  ["","Ürünler ile ilgili ulusal ve uluslararası standartlar ile kanunlara uymak,"],
    ["","Kurmuş olduğumuz kalite yönetim sistemini uygulamak ve etkinliğini sürekli iyileştirmek şirket politikamızdır."],
  ["","Şirket Kalite Politikamız, faaliyet alanımızdaki ürün ve hizmetlerle ilgili kalite taahhütlerini, kalite yönetim sisteminin sürekli uygulanacağı ve bu sistemin sürekli iyileştirileceğini gösteren içerikte Yönetim Kurulu Başkanı tarafından belirlenir. Kalite Politikamız, kuruluş amacına uygun ve yazılı olarak müşteri beklentilerini karşılayacak özellikte oluşturulur."],
  ["","Kalite Politikamız, kalite hedeflerimizin oluşturulmasında ve kalite yönetim sistemimizin gözden geçirilmesinde çerçeve oluşturur."],
  ["","Kalite Politikasının, her kademesinde anlaşılması ve uygulanması için duyurulur."],["","Duyurma işlemi, şirketin görünür yerlerine asılması ile birlikte eğitim çalışmaları ile de gerçekleştirilir."],
  ["","Kalite Politikası şirket yönetimimiz tarafından gözden geçirilerek, gerekmesi halinde revize edilir."]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomTextView(yazi: yazi, title: title, pic: pic));
  }
}
