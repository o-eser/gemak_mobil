import 'package:flutter/material.dart';

class KesfedinWidget extends StatelessWidget {
  int index;
  List<String> picLink = [
    "https://www.gemak.com.tr/uploads/pages/ar-ge.png",
    "https://www.gemak.com.tr/uploads/pages/blog.png",
    "https://www.gemak.com.tr/uploads/pages/bilgi-merkezi.png",
  ];
  List<String> title = ["ARGE", "BLOG & MAKALELER", "BİLGİ MERKEZİ"];

  KesfedinWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          child: Image.network(picLink[index]),
        ),
        const Divider(
          color: Colors.black,
          endIndent: 325,
          indent: 20,
          height: 10,
        ),
        Container(alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 10,top: 10,left: 20,right: 10),
          child: Text(title[index],
              style: const TextStyle(
                color: Color(0xFF054F7D),
                fontSize: 20,
              )),
        )
      ],
    );
  }
}
