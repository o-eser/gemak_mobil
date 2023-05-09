import 'package:flutter/material.dart';
import 'package:gemak/pages/kurumsal_page/hakkimizda.dart';
import 'package:gemak/wigdets/footer.dart';

import '../../wigdets/buildCustomWidget.dart';

class TarihcePage extends StatelessWidget {
  TarihcePage({Key? key}) : super(key: key);
  String pic="https://www.gemak.com.tr/uploads/editor/buyuk_179c215d.jpg";
  String pic2="https://www.gemak.com.tr/uploads/pages/gemak-gida-hakkimizda.png";
  String title= "TARİHÇE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(child: Column(
        children: [
          PageTitle(title: title),
          Padding(padding: PagePadding().widgetPadding,
            child: Image.network(pic,fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: PagePadding().widgetPadding,
            child: Image.network(pic2),
          ),
          const Footer()
        ],
      ),
      ),
    );
  }
}
