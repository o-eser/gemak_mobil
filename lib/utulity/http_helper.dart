import 'package:flutter/foundation.dart';
import 'package:gemak/utulity/models.dart';
import 'package:http/http.dart' as http;

abstract class Helper {
  Future<String> req(String url);

  Future<List<PicSlideModel>> getPicSlides(String html);

  Future<List<SecondSlideModel>> getSecondSlides(String html);

  Future<List<NewsModel>> getNewsList(String html);

  Future<List<NewsModel>> getNewsData(String html);

  Future<List<SatisModel>> getSatisList(String html);

  Future<List<String>> getPhotoList(String html);

  Future<String> getVideoUrl(String html);
}

class HttpHelper extends Helper {
  @override
  Future<String> req(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body.replaceAll("\n", "").replaceAll("\t", "").replaceAll("  ", "");
    } else {
      throw Exception("HTTP request failed with status code: ${response.statusCode}");
    }
  }


  @override
  Future<List<PicSlideModel>> getPicSlides(String html) async {
    RegExp firstSlideFind = RegExp(
        '''<div class="carousel-item"><a href="(.*?)"><img class="bd-placeholder-img img-fluid" src="(.*?)" alt="(.*?)"></a>(.*?)</div>''');
    Iterable<Match> firstSlidesMatch = firstSlideFind.allMatches(html);
    List<PicSlideModel> slides = [];
    for (Match slide in firstSlidesMatch) {
      String spicLink = slide.group(1) != " # " ? slide.group(1)! : "";
      String spic = "https://www.gemak.com.tr${slide.group(2)}";
      String spicTitle = slide.group(3) ?? "Not found";
      slides.add(PicSlideModel(spic, spicTitle, spicLink));
    }
    return slides;
  }

  @override
  Future<List<SecondSlideModel>> getSecondSlides(String html) async {
    Iterable<Match> secondSlide = RegExp(
            """<li data-thumb="(.*?)"><a href="(.*?)"><img src="(.*?)" style="width: 100%" alt="(.*?)" /><p>(.*?)</p></a></li>""")
        .allMatches(html);
    List<SecondSlideModel> slides = [];
    for (Match slide2 in secondSlide) {
      String pic = "https://www.gemak.com.tr${slide2.group(3)}";
      String sPic = "https://www.gemak.com.tr${slide2.group(1)}";
      String title = slide2.group(4)!;
      String picLink = "https://www.gemak.com.tr${slide2.group(2)}";
      String description = slide2.group(5)!;
      slides.add(SecondSlideModel(pic, sPic, title, picLink, description));
    }
    return slides;
  }

  @override
  Future<List<NewsModel>> getNewsList(String html) async {
    Match firstNews = RegExp(
            """<div class="col-md-12" style=""><div class="row"><div class="col-md-6 first-img"><a href="(.*?)" title="(.*?)"><img src="(.*?)" alt="(.*?)" class="img-fluid"></a></div><div class="col-md-6 first-news"><p class="news-date"> (.*?) </p><a href="(.*?)" title="(.*?)"><h3> (.*?) </h3></a><p> (.*?) </p></div></div></div>""")
        .firstMatch(html)!;
    String nPic = "https://www.gemak.com.tr${firstNews.group(3)}";
    String nTitle = firstNews.group(2)!;
    String nDesc =
        "Genel  Müdür  Yardımcılarımız  Sn.Hande  ÖZTÜRK  (CFO)  VE  Sn.Çağlar  ÖZTÜRK  (CSO)  TürkonfedBiz  isimli  derginin  23.  sayısına  konuk  oldular.Haberin  devamını  aşağıdan  okuyabilirsiniz....";
    String nDate = firstNews.group(5)!;
    List<NewsModel> newsList = [NewsModel(nPic, nTitle, nDesc, nDate)];
    Iterable<Match> news = RegExp(
            """<div class="col-md-4 mt-5"><div class="other-news hvr-float-shadow"><a href="(.*?)" title="(.*?)"><img src="(.*?)" alt="(.*?)" class="img-fluid"><p class="news-date"> (.*?) </p><h5> (.*?) </h5></a></div></div>""")
        .allMatches(html);
    for (Match news in news) {
      nPic = "https://www.gemak.com.tr${news.group(3)}";
      nTitle = news.group(2)!;
      nDate = news.group(5)!;
      newsList.add(NewsModel(nPic, nTitle, "", nDate));
    }
    return newsList;
  }

  @override
  Future<List<SatisModel>> getSatisList(String html) async {
    List<SatisModel> satisList = [];
    satisList.add(SatisModel(
        "",
        "https://www.gemak.com.tr/protected/themes/default/img/gemak_web_edit_1.png",
        "Online Pompa Satış",
        "",
        "Hazırlık Aşamasındadır"));
    Iterable<Match> satis = RegExp(
            """<div class="col-md-4"><a href="(.*?)" target="_blank"><img src="(.*?)" class="img-fluid" alt="Gemak ile üretin"></a><h5>(.*?)</h5><p><a href="(.*?)" target="_blank">(.*?)</a></p></div>""")
        .allMatches(html);
    for (Match satis in satis) {
      String link = satis.group(1)!;
      String pic = "https://www.gemak.com.tr${satis.group(2)}";
      String buttonTitle = satis.group(3)!;
      String buttonLink = satis.group(4)!;
      String description = satis.group(5)!;
      satisList.add(SatisModel(link, pic, buttonTitle, buttonLink, description));
    }
    return satisList;
  }

  @override
  Future<String> getVideoUrl(String html) async {
    RegExp rareVideoUrl = RegExp("""<script>window.playerConfig(.*?)</script>""");
    Match rareVideoUrlMatch = rareVideoUrl.firstMatch(html)!;
    String rareVideoData = rareVideoUrlMatch.group(1)!;
    RegExp videoUrl = RegExp(
        """"profile":"175","width":1920,"height":1080,"mime":"video/mp4","fps":25,"url":"(.*?)","cdn":"akamai_interconnect","quality":"1080p","id":""");
    Match videoUrlMatch = videoUrl.firstMatch(rareVideoData)!;
    String videoUrlData = videoUrlMatch.group(1)!;
    return videoUrlData;
  }

  @override
  Future<List<String>> getPhotoList(String html) async {
    RegExp rarePicUrl = RegExp(
        """<div class="page-gallery row" style="margin: 0 -15px">(.*?)</div></div>""");
    Match rarePicUrlMatch = rarePicUrl.firstMatch(html)!;
    String rarePicData = rarePicUrlMatch.group(1)!;
    Iterable<Match> picUrl = RegExp(
            """<div class="gallery-item col-md-4"> <a data-fancybox="gallery" data-width="1500" data-height="900" href="(.*?)" title="(.*?)" ><img class="d-block " src="(.*?)" alt="(.*?)"></a> </div>""")
        .allMatches(rarePicData);
    List<String> photoList = [];
    for (Match picUrl in picUrl) {
      String link = "https://www.gemak.com.tr${picUrl.group(1)}";
      photoList.add(link);
    }
    return photoList;
  }

  @override
  // https://www.gemak.com.tr/haberler sitenin html kodu yerine ana sayfanın html kodu geliyor
  Future<List<NewsModel>> getNewsData(String ahtml) async {
    ahtml="""
<!doctype html> 
<html>
   <head>
       
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css" href="none" />
<title> Haberler - Gemak Gıda Endüstri Makinaları ve Tic. A.Ş. </title>
      <meta name="description" content="Gemak Gıda Endüstri Makinaları ve Tic. A.Ş. Pastörizatör, Deodarizatör, Esanjör, Homojenizatör, Gıda Makinaları, Peynir Teknesi vb. Modern, Hijyenik, Otomatik ve Son Teknoloji Sistemler Sunmaktadır." />
      <meta name="keywords" content="CIP (Yıkama Sistemi),Krema Standardizatorü,Pastörizatör,Homojenizatör,Seperatör,süt homojenizatörü,peynir teknesi,Standardizasyon,Anahtar Teslim Fabrika Kurulumu,Dozajlama,Fabrika otomasyonu,meyve suyu pastörizatörü,süt konsantrasyonu" />
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <link href="/protected/themes/default/css/carousel.css" rel="stylesheet">
      <link href="/protected/themes/default/css/hover.css" rel="stylesheet">
      <link rel="stylesheet" href="/protected/themes/default/css/stellarnav.min.css">
      <link type="text/css" rel="stylesheet" href="/protected/themes/default/css/lightslider.css" />
      <link rel="stylesheet" href="/protected/themes/default/css/hover.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
      <link rel="stylesheet" href="/protected/themes/default/css/style.css">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap" rel="stylesheet">
      <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=60dc20a60081ca001247826f&product=sop' async='async'></script>
      <script async src="https://www.googletagmanager.com/gtag/js?id=UA-91628628-1"></script> <script> window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', ''); </script> 
   </head>
   <body>
      <header>
         <nav id="navbar" class="navbar navbar-expand-md navbar-light bg-light">
            <div class="container">
               <div class="row">
                  <div class="col-md-3"> <a class="navbar-brand animated slideInDown sticky-off" href="/"><img src="/protected/themes/default/img/logo.png" class="img-fluid" alt="Logo"></a> <a class="navbar-brand animated slideInDown sticky-on" href="/"><img src="/protected/themes/default/img/logo-2.png" class="img-fluid" alt="Logo"></a> </div>
                  <div class="col-md-9">
                     <div class="collapse navbar-collapse submenu  animated slideInDown">
                         
                        <ul class="list-inline menu">
                           <li class="list-inline-item"> <a href="/kurumsal" title="Kurumsal">Kurumsal</a> </li>
                           <li class="list-inline-item"> <a href="/haberler" title="Bizden Haberler">Bizden Haberler</a> </li>
                           <li class="list-inline-item"> <a href="/insan-kaynaklari" title="İnsan Kaynakları">İnsan Kaynakları</a> </li>
                           <li class="list-inline-item"> <a href="/iletisim" title="İletişim">Bize Ulaşın</a> </li>
                        </ul>
                        <ul class="list-inline search">
                           <div class="input-group">
                              <input type="text" class="form-control" placeholder="Arama..." aria-label="" aria-describedby="button-addon2"> 
                              <div class="input-group-append"> <button class="btn  btn-sm" type="button" id="button-addon2"><i class="fas fa-search"></i></button> </div>
                           </div>
                        </ul>
                        <ul class="list-inline lang">
                           <li class="list-inline-item"><a href="/language/2">ENG</a></li>
                           <li class="list-inline-item"><a href="#"><strong>TR</strong></a></li>
                        </ul>
                        <ul class="list-inline social" style="display: none;">
                           <li class="list-inline-item"><a href="#" alt="Gemak Sosyal Medya" target="_blank"><img alt="Gemak Sosyal Medya"  src="/protected/themes/default/img/f.png" class="img-fluid"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/company/gemakfoodindustry/" alt="Gemak Sosyal Medya"  target="_blank"><img alt="Gemak Sosyal Medya"  src="/protected/themes/default/img/link.png" class="img-fluid"></a></li>
                        </ul>
                         
                     </div>
                      <div id="main-nav" class="stellarnav"> <ul class="navbar-nav">  <li class="cls-anasayfa-2"> <a href="/" title="ANASAYFA">ANASAYFA</a> </li> <li class="cls-kurumsal has-sub"> <a href="#" title="KURUMSAL">KURUMSAL</a> <ul class="dropdown-menu row kurumsal" style="display: none;"> <li> <a href="/hakkimizda" title="HAKKIMIZDA">HAKKIMIZDA</a> </li> <li> <a href="/tarihce" title="TARİHÇE">TARİHÇE</a> </li> <li> <a href="/kalite-politikamiz" title="KALİTE POLİTİKAMIZ">KALİTE POLİTİKAMIZ</a> </li> <li> <a href="/is-sagligi-ve-guvenligi-politikamiz" title="ÇEVRE POLİTİKASI">ÇEVRE POLİTİKASI</a> </li> <li> <a href="/kurumsal-tanitim-filmi-1" title="KURUMSAL TANITIM FİLMİ">KURUMSAL TANITIM FİLMİ</a> </li> <li> <a href="/bilgi-merkezi" title="BİLGİ MERKEZİ">BİLGİ MERKEZİ</a> <ul> <li> <a href="/blog-makaleler" title="blog">BLOG</a> </li> <li> <a href="/katalog" title="blog">KATALOG</a> </li>            </ul> </li> </ul> <a class="dd-toggle" href="#"><span class="icon-plus"></span></a></li>   <li class="cls-urunler">  <a href="#" title="ÜRÜNLER">ÜRÜNLER</a>  </li>  <li class="cls-temsilciliklerimiz">  <a href="/temsilciliklerimiz" title="TEMSİLCİLİKLERİMİZ">TEMSİLCİLİKLERİMİZ</a>  <ul class="dropdown-menu row temsilciliklerimiz">  <li >  <a href="/alfa-laval" title="Alfa Laval">Alfa Laval</a>  </li>  <li >  <a href="/andritz" title="Frautech">Frautech</a>  </li>  <li >  <a href="/automade" title="Au2mate">Au2mate</a>  </li>  <li >  <a href="/bertoli" title="Bertoli">Bertoli</a>  </li>  <li >  <a href="/cmt-atomizers" title="Cmt Atomizers">Cmt Atomizers</a>  </li>  <li >  <a href="/grundfos" title="Grundfos">Grundfos</a>  </li>  <li >  <a href="/teknoice" title="Teknoice">Teknoice</a>  </li>  </ul> </li>  <li class="cls-endisturi-alanlari">  <a href="#" title="ENDÜSTRİLER">ENDÜSTRİLER</a>  <ul class="dropdown-menu row endisturi-alanlari">  <li >  <a href="/sut-ve-sut-urunleri" title="SÜT ve SÜT ÜRÜNLERİ">SÜT ve SÜT ÜRÜNLERİ</a>  </li>  <li >  <a href="/icecek" title="GIDA VE İÇECEK">GIDA VE İÇECEK</a>  </li>  <li >  <a href="/ilac" title="İLAÇ">İLAÇ</a>  </li>  <li >  <a href="/kimya" title="KİMYA">KİMYA</a>  </li>  <li >  <a href="/enerji" title="ENERJİ">ENERJİ</a>  </li>  </ul> </li>  <li class="cls-cozumler">  <a href="#" title="ÇÖZÜMLER">ÇÖZÜMLER</a>  <ul class="dropdown-menu row cozumler">  <li >  <a href="/satis-sonrasi-hizmetler" title="SATIŞ SONRASI HİZMETLER">SATIŞ SONRASI HİZMETLER</a>  </li>  <li >  <a href="/proje-danismanlik" title="PROJE DANIŞMANLIK">PROJE DANIŞMANLIK</a>  </li>  <li >  <a href="/otomasyon-yazilim" title="OTOMASYON - YAZILIM">OTOMASYON - YAZILIM</a>  </li>  <li >  <a href="/montaj-devreye-alma-1" title="MONTAJ & DEVREYE ALMA">MONTAJ & DEVREYE ALMA</a>  </li>  </ul> </li>  <li class="cls-ar-ge">  <a href="/ar-ge" title="AR-GE">AR-GE</a>  <ul class="dropdown-menu row ar-ge">  <li >  <a href="/urun-gelistirme" title="ÜRÜN GELİŞTİRME">ÜRÜN GELİŞTİRME</a>  </li>  <li >  <a href="/prototip-makine-uretimi" title="PROTOTİP MAKİNE ÜRETİMİ">PROTOTİP MAKİNE ÜRETİMİ</a>  </li>  <li >  <a href="/ar-ge-amacli-proses-hatlari" title="AR-GE AMAÇLI PROSES HATLARI">AR-GE AMAÇLI PROSES HATLARI</a>  </li>  <li >  <a href="/inovasyon" title="INOVASYON">INOVASYON</a>  </li>  </ul> </li>  <li class="cls-galeri-1">  <a href="/galeri-1" title="GALERİ">GALERİ</a>  <ul class="dropdown-menu row galeri-1">  <li >  <a href="/galeri" title="Şirket Galerisi">Şirket Galerisi</a>  </li>  <li >  <a href="/23nisan" title="2. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı"  Resim Sergisi">2. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı"  Resim Sergisi</a>  </li>  <li >  <a href="/3-geleneksel-23-nisan-ulusal-egemenlik-ve-cocuk-bayrami-resim-sergisi" title="3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı"  Resim Sergisi">3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı"  Resim Sergisi</a>  </li>  <li >  <a href="/4-geleneksel-23-nisan-ulusal-egemenlik-ve-cocuk-bayrami-resim-sergisi" title="4. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi ">4. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi </a>  </li>  </ul> </li>  <li class="cls-hemen-satis">  <a href="https://gidaproses.com/hemen-teslim-urunler/" title="HEMEN TESLİM">HEMEN TESLİM</a>  </li>  <li class="cls-online-satis">  <a href="#" title="ONLINE SATIŞ">ONLINE SATIŞ</a>  <ul class="dropdown-menu row online-satis">  <li >  <a href="https://esanjorsatis.com/" title="Online Eşanjör Satış">Online Eşanjör Satış</a>  </li>  <li >  <a href="/pompa-satis" title="Online Pompa Satış">Online Pompa Satış</a>  </li>  <li >  <a href="https://flowell.com.tr/" title="Online Atık Su Sistemleri Satışı">Online Atık Su Sistemleri Satışı</a>  </li>  </ul> </li>   <li class="cls-anasayfa-2"> <a href="/iletisim" title="İLETİŞİM">İLETİŞİM</a> </li>  <li class="cls-anasayfa-2  has-sub"> <a href="/language/2" title="EN">EN</a> </li> <li class="cls-anasayfa-2"> <a href="/language/1" title="TR">TR</a> </li> </ul> </ul> 
                  </div>
               </div>
            </div>
         </nav>
      </header> 
<section id="head">
   <div class="container">
      <div class="row">
         <div class="col-md-6 ">
            <h1 class="head-title">Haberler</h1>
         </div>
         <div class="col-md-6 text-right"> <ul class="breadcrumb v2">
<li class="active"><a href="/">Anasayfa</a></li> > <li class="active"><a href="/haberler">Haberler</a></li></ul> </div>
      </div>
   </div>
</section>
<section id="page" class="container">
   <div class="row"> <section id="page-content" class="haberler haberler-page">
  <div class="container">
    <div class="row">
       
        <div class="col-md-12 row haber-loop" style="display: none;">
          <div class="col-md-4 content-image">
            <a href="/haberler/genel-mudur-yardimcilarimiz-turkonfedbizin-konugu-oldu" title="Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu">
              <img src="/uploads/haberler/11416.jpg" alt="Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu" class="img-fluid">
            </a>
          </div>
          <div class="col-md-8 content-body">
            <div class="content-body-title">
              <a href="/haberler/genel-mudur-yardimcilarimiz-turkonfedbizin-konugu-oldu" title="Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu"><h3 class="content-title">Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu</h3></a>
                            <span class="ghostdate">28/06/2022</span>

            </div>
            <div class="content-body-text">
              Genel  Müdür  Yardımcılarımız  Sn.Hande  ÖZTÜRK  (CFO)  VE  Sn.Çağlar  ÖZTÜRK  (CSO)  TürkonfedBiz  isimli  derginin  23.  sayısına  konuk  oldular.Haberin  devamını  aşağıdan  okuyabilirsiniz.  Keyifli  okumalar  ileriz.            </div>
            <div class="content-read-more">
              <a href="/haberler/genel-mudur-yardimcilarimiz-turkonfedbizin-konugu-oldu" title="Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu">Devamını Oku</a>
            </div>
          </div>
        </div>

        <div class="newsboxes row text-line">
          <div class="col-md-4">
            <img class="img-fluid rounded" src="/uploads/haberler/11416.jpg" alt="Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu" >
          </div>
          <div class="col-md-8 ">
            <div class="row">
              <div class="col-md-10">
                <h5>Genel Müdür Yardımcılarımız TürkonfedBiz'in Konuğu Oldu</h5>
              </div>
            </div>
            <span class="date "><i class="far fa-calendar-alt"></i> 28/06/2022</span>
            <p class="mt-3 blog-title">
              Genel  Müdür  Yardımcılarımız  Sn.Hande  ÖZTÜRK  (CFO)  VE  Sn.Çağlar  ÖZTÜRK  (CSO)  TürkonfedBiz  isimli  derginin  23.  sayısına  konuk  oldular.Haberin  devamını  aşağıdan  okuyabilirsiniz.  Keyifli  okumalar  ileriz.              <br>
              <a style="font-size: 0.8rem; margin-top: 10px;" href="/haberler/genel-mudur-yardimcilarimiz-turkonfedbizin-konugu-oldu" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a>
            </p>
          </div>
        </div>



       
        <div class="col-md-12 row haber-loop" style="display: none;">
          <div class="col-md-4 content-image">
            <a href="/haberler/ingilterenin-en-seckin-dergilerinden-dairy-industries-internationaldayiz" title="İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!">
              <img src="/uploads/haberler/10215.jpg" alt="İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!" class="img-fluid">
            </a>
          </div>
          <div class="col-md-8 content-body">
            <div class="content-body-title">
              <a href="/haberler/ingilterenin-en-seckin-dergilerinden-dairy-industries-internationaldayiz" title="İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!"><h3 class="content-title">İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!</h3></a>
                            <span class="ghostdate">06/09/2021</span>

            </div>
            <div class="content-body-text">
              İngiltere'nin  en  seçkin  sektör  dergilerinden  Dairy  Industires  International,  Ağustos  2021  sayısında  Gemak'a  yer  verdi.Haberin  devamını  aşağıdan  okuyabilirsiniz.
            </div>
            <div class="content-read-more">
              <a href="/haberler/ingilterenin-en-seckin-dergilerinden-dairy-industries-internationaldayiz" title="İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!">Devamını Oku</a>
            </div>
          </div>
        </div>

        <div class="newsboxes row text-line">
          <div class="col-md-4">
            <img class="img-fluid rounded" src="/uploads/haberler/10215.jpg" alt="İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!" >
          </div>
          <div class="col-md-8 ">
            <div class="row">
              <div class="col-md-10">
                <h5>İngiltere'nin En Seçkin Dergilerinden Dairy Industries International'dayız!</h5>
              </div>
            </div>
            <span class="date "><i class="far fa-calendar-alt"></i> 06/09/2021</span>
            <p class="mt-3 blog-title">
              İngiltere'nin  en  seçkin  sektör  dergilerinden  Dairy  Industires  International,  Ağustos  2021  sayısında  Gemak'a  yer  verdi.Haberin  devamını  aşağıdan  okuyabilirsiniz.
              <br>
              <a style="font-size: 0.8rem; margin-top: 10px;" href="/haberler/ingilterenin-en-seckin-dergilerinden-dairy-industries-internationaldayiz" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a>
            </p>
          </div>
        </div>



       
        <div class="col-md-12 row haber-loop" style="display: none;">
          <div class="col-md-4 content-image">
            <a href="/haberler/gemak-7-kitada-46-ulkeye-ihracat-yapiyor" title="Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor">
              <img src="/uploads/haberler/9279.jpg" alt="Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor" class="img-fluid">
            </a>
          </div>
          <div class="col-md-8 content-body">
            <div class="content-body-title">
              <a href="/haberler/gemak-7-kitada-46-ulkeye-ihracat-yapiyor" title="Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor"><h3 class="content-title">Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor</h3></a>
                            <span class="ghostdate">29/06/2021</span>

            </div>
            <div class="content-body-text">
              DrinkTech  İçecek  ve  Teknolojileri  isimli  derginin  Haziran  2021  sayısına  konuk  olduk. Keyifli  okumalar  dileriz.            </div>
            <div class="content-read-more">
              <a href="/haberler/gemak-7-kitada-46-ulkeye-ihracat-yapiyor" title="Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor">Devamını Oku</a>
            </div>
          </div>
        </div>

        <div class="newsboxes row text-line">
          <div class="col-md-4">
            <img class="img-fluid rounded" src="/uploads/haberler/9279.jpg" alt="Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor" >
          </div>
          <div class="col-md-8 ">
            <div class="row">
              <div class="col-md-10">
                <h5>Gemak, 7 Kıtada 46 Ülkeye İhracat Yapıyor</h5>
              </div>
            </div>
            <span class="date "><i class="far fa-calendar-alt"></i> 29/06/2021</span>
            <p class="mt-3 blog-title">
              DrinkTech  İçecek  ve  Teknolojileri  isimli  derginin  Haziran  2021  sayısına  konuk  olduk. Keyifli  okumalar  dileriz.              <br>
              <a style="font-size: 0.8rem; margin-top: 10px;" href="/haberler/gemak-7-kitada-46-ulkeye-ihracat-yapiyor" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a>
            </p>
          </div>
        </div>



       
        <div class="col-md-12 row haber-loop" style="display: none;">
          <div class="col-md-4 content-image">
            <a href="/haberler/genel-mudur-yardimcimiz-sn-hande-ozturk-ile-kosgeb-dergiye-konuk-olduk" title="Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk.">
              <img src="/uploads/haberler/8236.jpg" alt="Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk." class="img-fluid">
            </a>
          </div>
          <div class="col-md-8 content-body">
            <div class="content-body-title">
              <a href="/haberler/genel-mudur-yardimcimiz-sn-hande-ozturk-ile-kosgeb-dergiye-konuk-olduk" title="Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk."><h3 class="content-title">Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk.</h3></a>
                            <span class="ghostdate">28/05/2021</span>

            </div>
            <div class="content-body-text">
              T.C  Sanayi  ve  Teknoloji  Bakanlığı'na  ait  olan  Kosgeb  Dergi'nin  Mayıs  2021  sayısına  konuk  olduk."Kosgeb'le  Daha  Güçlü"  projesi  kapsamında  50  yılı  aşkın  tecrübemizle  hizmet  verdiğimiz  sektörler,  ürettiğimiz  ürünler  ve  Kosgeb            </div>
            <div class="content-read-more">
              <a href="/haberler/genel-mudur-yardimcimiz-sn-hande-ozturk-ile-kosgeb-dergiye-konuk-olduk" title="Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk.">Devamını Oku</a>
            </div>
          </div>
        </div>

        <div class="newsboxes row text-line">
          <div class="col-md-4">
            <img class="img-fluid rounded" src="/uploads/haberler/8236.jpg" alt="Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk." >
          </div>
          <div class="col-md-8 ">
            <div class="row">
              <div class="col-md-10">
                <h5>Genel Müdür Yardımcımız Sn.Hande Öztürk ile Kosgeb Dergi'ye Konuk Olduk.</h5>
              </div>
            </div>
            <span class="date "><i class="far fa-calendar-alt"></i> 28/05/2021</span>
            <p class="mt-3 blog-title">
              T.C  Sanayi  ve  Teknoloji  Bakanlığı'na  ait  olan  Kosgeb  Dergi'nin  Mayıs  2021  sayısına  konuk  olduk."Kosgeb'le  Daha  Güçlü"  projesi  kapsamında  50  yılı  aşkın  tecrübemizle  hizmet  verdiğimiz  sektörler,  ürettiğimiz  ürünler  ve  Kosgeb              <br>
              <a style="font-size: 0.8rem; margin-top: 10px;" href="/haberler/genel-mudur-yardimcimiz-sn-hande-ozturk-ile-kosgeb-dergiye-konuk-olduk" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a>
            </p>
          </div>
        </div>



       
        <div class="col-md-12 row haber-loop" style="display: none;">
          <div class="col-md-4 content-image">
            <a href="/haberler/ingilterenin-ilk-suzme-tipi-vegan-yogurt-tesisi-gemaktan" title="İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!">
              <img src="/uploads/haberler/7403.jpg" alt="İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!" class="img-fluid">
            </a>
          </div>
          <div class="col-md-8 content-body">
            <div class="content-body-title">
              <a href="/haberler/ingilterenin-ilk-suzme-tipi-vegan-yogurt-tesisi-gemaktan" title="İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!"><h3 class="content-title">İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!</h3></a>
                            <span class="ghostdate">01/03/2021</span>

            </div>
            <div class="content-body-text">
              İngiltere'nin  İlk  Süzme  Tipi  Vegan  Yoğurt  Tesisi  Gemak'tan!            </div>
            <div class="content-read-more">
              <a href="/haberler/ingilterenin-ilk-suzme-tipi-vegan-yogurt-tesisi-gemaktan" title="İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!">Devamını Oku</a>
            </div>
          </div>
        </div>

        <div class="newsboxes row text-line">
          <div class="col-md-4">
            <img class="img-fluid rounded" src="/uploads/haberler/7403.jpg" alt="İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!" >
          </div>
          <div class="col-md-8 ">
            <div class="row">
              <div class="col-md-10">
                <h5>İngiltere'nin İlk Süzme Tipi Vegan Yoğurt Tesisi Gemak'tan!</h5>
              </div>
            </div>
            <span class="date "><i class="far fa-calendar-alt"></i> 01/03/2021</span>
            <p class="mt-3 blog-title">
              İngiltere'nin  İlk  Süzme  Tipi  Vegan  Yoğurt  Tesisi  Gemak'tan!              <br>
              <a style="font-size: 0.8rem; margin-top: 10px;" href="/haberler/ingilterenin-ilk-suzme-tipi-vegan-yogurt-tesisi-gemaktan" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a>
            </p>
          </div>
        </div>



          </div>
    <div class="contant-pagination">
      <ul class="pagination" id="yw0"><li class="hide hidden"><a href="/">&lt;&lt; İlk</a></li>
<li class="previous hidden"><a href="/">&lt; Önceki</a></li>
<li class="page selected"><a href="/">1</a></li>
<li class="page"><a href="/">2</a></li>
<li class="page"><a href="/">3</a></li>
<li class="next"><a href="/">Sonraki &gt;</a></li>
<li class="hide"><a href="/">Son &gt;&gt;</a></li></ul>    </div>
  </div>
</section> </div>
</section>
<!-- FOOTER --> 
<footer>
   <div class="top-footer">
      <div class="container">
          
         <div class="row">
            <div class="col-md-2">
               <ul class="list-unstyled">
                  <li class="mainlist">Hızlı Erişim</li>
                  <li><a href="/satis-sonrasi-hizmetler">Çözümler</a></li>
                  <li><a href="/sut-ve-sut-urunleri">Endüstri Alanları</a></li>
                  <li><a href="/ar-ge-1">AR-GE</a></li>
                  <li><a href="/insan-kaynaklari-politikamiz">İnsan Kaynakları</a></li>
                  <li><a href="/iletisim">İletişim</a></li>
               </ul>
            </div>
            <div class="col-md-2">
               <li class="mainlist list-unstyled">Ürünler</li>
               <ul class="list-unstyled">
                  <li><a href="/urunler/kategori/pastorizator">Pastörizatör</a></li>
                  <li><a href="/urunler/kategori/standardizator">Standardizatör</a></li>
                  <li><a href="/urunler/kategori/homojenizator">Homojenizatör</a></li>
                  <li><a href="/urunler/kategori/pompa">Pompa</a></li>
                  <li><a href="/urunler/kategori/sogutma-sistemleri">Soğutma Sistemleri</a></li>
               </ul>
            </div>
            <div class="col-md-2">
               <ul class="list-unstyled">
                  <li class="mainlist">Kurumsal</li>
                  <li><a href="/hakkimizda">Hakkımızda</a></li>
                  <li><a href="/tarihce">Tarihçe</a></li>
                  <li><a href="/yonetim">Yönetim Kurulu</a></li>
                  <li><a href="/egitim-icerikleri">Gemak Akademi</a></li>
                  <li><a href="/katalog">Bilgi Merkezi</a></li>
               </ul>
            </div>
            <div class="col-md-6">
               <ul class="list-unstyled">
                  <li class="mainlist">GEMAK GIDA ENDÜSTRİ MAKİNALARI ve TİC. A.Ş.</li>
                  <li>Alcı OSB Mahallesi 2032 Cad. No: 1 / 1 SİNCAN / ANKARA</li>
                  <li> <span class="bold">T: </span> +90 (312) 641-3252 <span class="bold"> • M:</span> +90 (530) 667-0073 <span class="bold"> • F:</span> +90 (312) 394-7795</li>
                  <li><span class="bold">www.gemak.com.tr • gemak@gemak.com.tr</span></li>
                  <hr>
                  <li class="bold"><a href="/iletisim" title="İletişim"><i class="fas fa-map-marker-alt"></i> Bize Ulaşın</a></li>
                  <hr>
                  <li class="bold">
                     <h3> <a href="#"><i class="fab fa-facebook-square"></i></a> 
                     	<a href="https://www.linkedin.com/company/gemakfoodindustry/"><i class="fab fa-linkedin"></i></i></a> 
                     	<a href="https://www.instagram.com/gemakfoodindustry/"><i class="fab fa-instagram"></i></i></a> 
                     </h3>
                  </li>
               </ul>
            </div>
         </div>
          
      </div>
   </div>
   <div class="copyright">
      <div class="container">
         <p>Copyright 2019 &copy; Gemak Gıda Endüstri Makinaları ve Tic. A.Ş. <span style="  float: right;"><a href="https://www.mikroarea.com.tr" target="_blank" title="Ankara Web Tasarım"><img alt="Ankara Web Tasarım" src="/protected/themes/default/img/mikroarea.png" width="24px"></a></span></p>
      </div>
   </div>
</footer>
<ul class="urunlermenu">
    
   <li><a href="/urunler/kategori/pastorizator-1" title="PASTÖRİZATÖR">PASTÖRİZATÖR</a>  </li>
    
   <li><a href="/urunler/kategori/yikama-sistemi-cip" title="YIKAMA SİSTEMİ (CIP)">YIKAMA SİSTEMİ (CIP)</a>  </li>
    
   <li><a href="/urunler/kategori/standardizator" title="STANDARDİZATÖR">STANDARDİZATÖR</a>  </li>
    
   <li><a href="/urunler/kategori/vana-tarlasi-1" title="VANA TARLASI">VANA TARLASI</a>  </li>
    
   <li><a href="/urunler/kategori/homojenizator-1" title="HOMOJENİZATÖR">HOMOJENİZATÖR</a>  </li>
    
   <li><a href="/urunler/kategori/vakumlu-pisirici-cooker" title="VAKUMLU PİŞİRİCİ (COOKER)">VAKUMLU PİŞİRİCİ (COOKER)</a>  </li>
    
   <li><a href="/urunler/kategori/tank" title="TANK">TANK</a>  </li>
    
   <li><a href="/urunler/kategori/ribbon-blender-1" title="RIBBON BLENDER">RIBBON BLENDER</a>  </li>
    
   <li><a href="/urunler/kategori/pompa" title="POMPA">POMPA</a>  </li>
    
   <li><a href="/urunler/kategori/sterilizator" title="STERİLİZATÖR">STERİLİZATÖR</a>  </li>
    
   <li><a href="/urunler/kategori/yag-eritme-tanki" title="YAĞ ERİTME TANKI">YAĞ ERİTME TANKI</a>  </li>
    
   <li><a href="/urunler/kategori/esanjor-test-hizmeti" title="EŞANJÖR TEST HİZMETİ">EŞANJÖR TEST HİZMETİ</a>  </li>
    
   <li><a href="/urunler/kategori/isi-degistiriciler-esanjor-2" title="ISI DEĞİŞTİRİCİLER (Eşanjör)">ISI DEĞİŞTİRİCİLER (Eşanjör)</a>  </li>
    
   <li><a href="/urunler/kategori/freezer-2" title="FREEZER">FREEZER</a>  </li>
    
   <li><a href="/urunler/kategori/seperator-3" title="SEPERATÖR">SEPERATÖR</a>  </li>
    
   <li><a href="/urunler/kategori/deoderizator" title="DEODERİZATÖR">DEODERİZATÖR</a>  </li>
    
</ul>!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-8MLT96PNQW"></script>
<script>
   window.dataLayer = window.dataLayer || [];
   function gtag(){dataLayer.push(arguments);}
   gtag('js', new Date());
   gtag('config', 'G-8MLT96PNQW');
</script>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
   new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
   j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
   'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
   })(window,document,'script','dataLayer','GTM-KLW85LV');
</script>
<!-- End Google Tag Manager -->
<script>


</script>""".replaceAll("\n", "").replaceAll("\t", "").replaceAll("  ", "") ;
    RegExp rareNewsHtml = RegExp(
        """<section id="page" class="container">(.*?)<div class="top-footer">""");
    Match rareNewsDataMatch = rareNewsHtml.firstMatch(ahtml)!;
    String rareNewsData = rareNewsDataMatch.group(1)!;
    Iterable<Match> newsData = RegExp(
            """<div class="newsboxes row text-line"><div class="col-md-4"><img class="img-fluid rounded" src="(.*?)" alt="(.*?)" ></div><div class="col-md-8 "><div class="row"><div class="col-md-10"><h5>(.*?)</h5></div></div><span class="date "><i class="far fa-calendar-alt"></i> (.*?)</span><p class="mt-3 blog-title">(.*?)<br><a style="font-size: 0.8rem; margin-top: 10px;" href="(.*?)" class="btn btn-primary waves-effect waves-light" role="button" title="slug"> Devamını Oku</a></p></div></div>""")
        .allMatches(rareNewsData);
    List<NewsModel> newsDataList = [];
    for (Match newsData in newsData) {
      String picLink = "https://www.gemak.com.tr${newsData.group(1)}";
      String title = newsData.group(2)!;
      String description = newsData.group(5)!;
      String date = newsData.group(4)!;
      newsDataList.add(NewsModel(picLink, title, description, date));
    }
    return newsDataList;
  }
}

class GemakData {
  List<PicSlideModel> firstSlides;
  List<SecondSlideModel> secondSlides;
  List<NewsModel> newsList;
  List<NewsModel> newsData;
  List<SatisModel> satisList;
  List<String> photoList;
  String videoUrl;
  List<String> exhibitionPhotoList;
  List<String> thirdExhibitionPhotoList;
  List<String> fourthExhibitionPhotoList;

  GemakData(
      {required this.firstSlides,
      required this.secondSlides,
      required this.newsList,
      required this.newsData,
      required this.satisList,
      required this.photoList,
      required this.videoUrl,
      required this.exhibitionPhotoList,
      required this.thirdExhibitionPhotoList,
      required this.fourthExhibitionPhotoList});
}

class GemakProvider extends ChangeNotifier {
  final Helper helper;

  GemakProvider({required this.helper});

  final GemakData _data = GemakData(
    firstSlides: [],
    secondSlides: [],
    newsList: [],
    satisList: [],
    photoList: [],
    exhibitionPhotoList: [],
    videoUrl: "",
    thirdExhibitionPhotoList: [],
    fourthExhibitionPhotoList: [],
    newsData: [],
  );

  GemakData get data => _data;

  Future<void> fetchData() async {
    try {
      String html = await helper.req("https://www.gemak.com.tr");
      String newsPageHtml = await helper.req("https://www.gemak.com.tr/haberler");
      String videoHtml = await helper.req("https://player.vimeo.com/video/276818433");
      String galleryHtml = await helper.req("https://www.gemak.com.tr/galeri");
      String exhibitionHtml = await helper.req("https://www.gemak.com.tr/23nisan");
      String thirdExhibitionHtml = await helper.req(
          "https://www.gemak.com.tr/3-geleneksel-23-nisan-ulusal-egemenlik-ve-cocuk-bayrami-resim-sergisi");
      String fourthExhibitionHtml = await helper.req(
          "https://www.gemak.com.tr/4-geleneksel-23-nisan-ulusal-egemenlik-ve-cocuk-bayrami-resim-sergisi");
      _data.firstSlides = await helper.getPicSlides(html);
      _data.secondSlides = await helper.getSecondSlides(html);
      _data.newsList = await helper.getNewsList(html);
      _data.satisList = await helper.getSatisList(html);
      _data.photoList = await helper.getPhotoList(galleryHtml);
      _data.exhibitionPhotoList = await helper.getPhotoList(exhibitionHtml);
      _data.videoUrl = await helper.getVideoUrl(videoHtml);
      _data.thirdExhibitionPhotoList = await helper.getPhotoList(thirdExhibitionHtml);
      _data.fourthExhibitionPhotoList = await helper.getPhotoList(fourthExhibitionHtml);
      _data.newsData = await helper.getNewsData(newsPageHtml);
      notifyListeners();
    } catch (error) {
      // Handle the error appropriately
      print("Error: $error");
    }
  }
}
