import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../wigdets/gallery_widget.dart';

class CompanyGallery extends StatelessWidget {
  late List<String> photoList;

  CompanyGallery({Key? key, required this.photoList}) : super(key: key);
  String title = "GALERİ";

  @override
  Widget build(BuildContext context) {
    print("pic list **** ${photoList.length}");
    return Scaffold(
        appBar: buildAppBar(),
        body: GalleryWidget(photoList: photoList));
  }
}


