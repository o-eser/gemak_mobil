import 'package:flutter/material.dart';

import '../../wigdets/buildCustomWidget.dart';
import '../../wigdets/gallery_widget.dart';

class SecondExhibitionPage extends StatelessWidget {
  late List<String> photoList;

  SecondExhibitionPage({Key? key, required this.photoList}) : super(key: key);
  String title =
      """2. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: GalleryWidget(photoList: photoList));
  }
}

class ThirdExhibitionPage extends StatelessWidget {
  late List<String> photoList;

  ThirdExhibitionPage({Key? key, required this.photoList}) : super(key: key);
  String title =
      """3. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: GalleryWidget(photoList: photoList));
  }
}
class FourthExhibitionPage extends StatelessWidget {
  late List<String> photoList;

  FourthExhibitionPage({Key? key, required this.photoList}) : super(key: key);
  String title =
      """4. Geleneksel "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı" Resim Sergisi""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: GalleryWidget(photoList: photoList));
  }
}
