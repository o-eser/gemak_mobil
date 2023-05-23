import 'package:flutter/material.dart';
import 'package:gemak/wigdets/buildCustomWidget.dart';
import 'package:gemak/wigdets/footer.dart';

import '../kurumsal_page/hakkimizda.dart';

class OthersPage extends StatelessWidget {
  late int pageroute;
  OthersPage({Key? key,required this.pageroute}) : super(key: key);
  List<List<String>> pageDetail = [["https://www.gemak.com.tr/uploads/pages/andritz.jpg","Andritz"],
    ["https://www.gemak.com.tr/uploads/pages/logo-au2mate.png","Automate"],
    ["https://www.gemak.com.tr/uploads/pages/7331.jpg","Cmt Atomizers"],
    ["https://www.gemak.com.tr/uploads/pages/8968.png","Grundfos"]
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            CustomTextView1(
                yazi: [["", ""]],
              title: pageDetail[pageroute][1],
              pic: pageDetail[pageroute][0],
            ),
          ],
        ));
  }
}
