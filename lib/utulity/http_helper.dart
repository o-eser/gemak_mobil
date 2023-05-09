import 'package:flutter/foundation.dart';
import 'package:gemak/utulity/models.dart';
import 'package:http/http.dart' as http;

abstract class Helper {
  List<PicSlideModel> firstSlides = [];
  List<SecondSlideModel> secondSlides = [];
  List<NewsModel> newsList = [];
  List<SatisModel> satisList = [];
  String vidUrl="";

  Future req();Future req1();

  Future<bool> getPicData();Future<bool> getVideoUrl();

  String? firstSlidesHtml;
  String? secondSlidesHtml;
  String? newsData;
  String? satislarData;
  String? httpData;String? httpVideoData;
  String httpDataPre = "";String httpVideoDataPre = "";
  String url = "https://www.gemak.com.tr/";
  String videoUrl = "https://player.vimeo.com/video/276818433";
}

class HttpHelper extends Helper {
  @override
  Future req() async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        httpData = response.body
            .replaceAll("\n", "")
            .replaceAll("\t", "")
            .replaceAll("  ", "");
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
  }
  @override
  Future req1() async {
    http.Response response = await http.get(Uri.parse(videoUrl));
    try {
      if (response.statusCode == 200) {
        httpVideoData = response.body
            .replaceAll("\n", "")
            .replaceAll("\t", "")
            .replaceAll("  ", "");
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
  }

  @override
  Future<bool> getPicData() async {
    await req();
    if (httpDataPre != httpData) {
      httpDataPre = httpData!;
      firstSlides = [];
      secondSlides = [];

      // First slides finder
      RegExp firstSlidesFind =
          RegExp("""<div class="carousel-inner">(.*?)</div></div><a class=""");
      Match slideMatch = firstSlidesFind.firstMatch(httpDataPre) as Match;
      firstSlidesHtml = slideMatch.group(1);
      RegExp firstSlideFind = RegExp(
          '''<div class="carousel-item"><a href="(.*?)"><img class="bd-placeholder-img img-fluid" src="(.*?)" alt="(.*?)"></a>(.*?)</div>''');
      Iterable<Match> firstSlidesMatch =
          firstSlideFind.allMatches(firstSlidesHtml!);
      for (Match slide in firstSlidesMatch) {
        String spicLink;
        String spic = "https://www.gemak.com.tr${slide.group(2)}";
        String spicTitle = slide.group(3) ?? "Not found";
        if (slide.group(1) != " # ") {
          spicLink = slide.group(1)!;
        } else {
          spicLink = "";
        }
        firstSlides.add(PicSlideModel(spic, spicTitle, spicLink));
      }

      // Second slides finder
      RegExp secondSlidesFind = RegExp(
          """<section class="about">(.*?)></section><section class="news "><""");
      Match secondSlidesMatch =
          secondSlidesFind.firstMatch(httpDataPre) as Match;
      secondSlidesHtml = secondSlidesMatch.group(1);
      Iterable<Match> secondSlide = RegExp(
              """<li data-thumb="(.*?)"><a href="(.*?)"><img src="(.*?)" style="width: 100%" alt="(.*?)" /><p>(.*?)</p></a></li>""")
          .allMatches(secondSlidesHtml!);
      for (Match slide2 in secondSlide) {
        String pic = "https://www.gemak.com.tr${slide2.group(3)}",
            sPic = "https://www.gemak.com.tr${slide2.group(1)}",
            title = slide2.group(4)!,
            picLink = "https://www.gemak.com.tr${slide2.group(2)}",
            description = slide2.group(5)!;
        secondSlides
            .add(SecondSlideModel(pic, sPic, title, picLink, description));
      }

      // News data fınder
      RegExp newsFinder = RegExp("""<section class="news ">(.*?)</section>""");
      Match newsMatch = newsFinder.firstMatch(httpDataPre) as Match;
      newsData = newsMatch.group(1);
      Match firstNews = RegExp(
              """<div class="col-md-12" style=""><div class="row"><div class="col-md-6 first-img"><a href="(.*?)" title="(.*?)"><img src="(.*?)" alt="(.*?)" class="img-fluid"></a></div><div class="col-md-6 first-news"><p class="news-date"> (.*?) </p><a href="(.*?)" title="(.*?)"><h3> (.*?) </h3></a><p> (.*?) </p></div></div></div>""")
          .firstMatch(newsData!) as Match;
      String nPic = "https://www.gemak.com.tr${firstNews.group(3)}";
      String nTitle = firstNews.group(2)!;
      String nDesc =
          "Genel  Müdür  Yardımcılarımız  Sn.Hande  ÖZTÜRK  (CFO)  VE  Sn.Çağlar  ÖZTÜRK  (CSO)  TürkonfedBiz  isimli  derginin  23.  sayısına  konuk  oldular.Haberin  devamını  aşağıdan  okuyabilirsiniz....";
      String nDate = firstNews.group(5)!;
      newsList.add(NewsModel(nPic, nTitle, nDesc, nDate));
      Iterable<Match> news = RegExp(
              """<div class="col-md-4 mt-5"><div class="other-news hvr-float-shadow"><a href="(.*?)" title="(.*?)"><img src="(.*?)" alt="(.*?)" class="img-fluid"><p class="news-date"> (.*?) </p><h5> (.*?) </h5></a></div></div>""")
          .allMatches(newsData!);
      for (Match news in news) {
        nPic = "https://www.gemak.com.tr${news.group(3)}";
        nTitle = news.group(2)!;
        nDate = news.group(5)!;
        newsList.add(NewsModel(nPic, nTitle, "", nDate));
      }
      // Gemak ile üretin
      RegExp satislarFinder = RegExp(
          """<section class="front-paralax text-center">(.*?)</section>""");
      satislarData = satislarFinder.firstMatch(httpDataPre)?.group(1);
      satisList.add(SatisModel(
          "",
          "https://www.gemak.com.tr/protected/themes/default/img/gemak_web_edit_1.png",
          "Online Pompa Satış",
          "",
          "Hazırlık Aşamasındadır"));
      Iterable<Match> satis = RegExp(
              """<div class="col-md-4"><a href="(.*?)" target="_blank"><img src="(.*?)" class="img-fluid" alt="Gemak ile üretin"></a><h5>(.*?)</h5><p><a href="(.*?)" target="_blank">(.*?)</a></p></div>""")
          .allMatches(satislarData!);
      for (Match satis in satis) {
        String link = satis.group(1)!;
        String pic = "https://www.gemak.com.tr${satis.group(2)}";
        String buttonTitle = satis.group(3)!;
        String buttonLink = satis.group(4)!;
        String description = satis.group(5)!;
        satisList
            .add(SatisModel(link, pic, buttonTitle, buttonLink, description));
      }



    }
    return true;
  }
  @override
  Future<bool> getVideoUrl()async {

    await req1();
    if (httpVideoDataPre != httpVideoData) {
      httpVideoDataPre = httpVideoData!;
      RegExp rareVideoUrl=RegExp("""<script>window.playerConfig(.*?)</script>""");
      Match rareVideoUrlMatch=rareVideoUrl.firstMatch(httpVideoDataPre) as Match;
      String rareVideoData=rareVideoUrlMatch.group(1)!;
      RegExp videoUrl=RegExp(""""profile":"175","width":1920,"height":1080,"mime":"video/mp4","fps":25,"url":"(.*?)","cdn":"akamai_interconnect","quality":"1080p","id":""");
      Match videoUrlMatch=videoUrl.firstMatch(rareVideoData) as Match;
      String videoUrlData=videoUrlMatch.group(1)!;
      vidUrl=videoUrlData;
    }
    return true;
  }
}
