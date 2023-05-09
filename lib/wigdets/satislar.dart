
import 'package:flutter/material.dart';
import 'package:gemak/utulity/models.dart';

import '../utulity/openurl.dart';

class SatisWidget extends StatelessWidget {
  List<SatisModel> satislar = [];
  int index;

  SatisWidget(this.satislar, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: Image.network(satislar[index].pic),
          ),
          TextButton(
              child: Container(color: Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Text(satislar[index].buttonTitle,style: const TextStyle(color: Colors.white),)),
              onPressed: (){
            if (satislar[index].buttonLink != "") {
              openURL(satislar[index].buttonLink);
            }
          }),
          const Divider(
            color: Colors.black,
            endIndent: 50,
            indent: 50,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(satislar[index].description,
                style: const TextStyle(
                  color: Color(0xFF054F7D),
                  fontSize: 15,
                )),
          ),
          const Divider(
            color: Colors.black,
            height: 10,
          )
        ],
      ),
    );
  }
}