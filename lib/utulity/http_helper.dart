import 'package:flutter/foundation.dart';
import 'package:gemak/utulity/models.dart';
import 'package:http/http.dart' as http;

abstract class Helper {
  Future<String> req(String url);

  Future<List<PicSlideModel>> getPicSlides(String html);

  Future<List<SecondSlideModel>> getSecondSlides(String html);

  Future<List<NewsModel>> getNewsList(String html);

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
}

class GemakData {
  List<PicSlideModel> firstSlides;
  List<SecondSlideModel> secondSlides;
  List<NewsModel> newsList;
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
  );

  GemakData get data => _data;

  Future<void> fetchData() async {
    try {
      String html = await helper.req("https://www.gemak.com.tr");
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
      _data.thirdExhibitionPhotoList=await helper.getPhotoList(thirdExhibitionHtml);
      _data.fourthExhibitionPhotoList=await helper.getPhotoList(fourthExhibitionHtml);
      notifyListeners();
    } catch (error) {
      // Handle the error appropriately
      print("Error: $error");
    }
  }
}
