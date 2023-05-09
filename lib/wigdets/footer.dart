import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(padding: const EdgeInsets.only(top: 35,left: 20,right: 20,bottom: 10),
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 25, bottom: 5),
          child: const Text("GEMAK GIDA ENDÜSTRİ MAKİNALARI ve TİC. A.Ş.",
              style: TextStyle(
                color: Color(0xFF004A87),
                fontSize: 18,
              )),
        ),
        const Divider(
          height: 10,
          thickness: 4,
          color: Colors.black,
          endIndent: 15,
          indent: 15,
        ),
        Container(padding: const EdgeInsets.all(10),
          child: const Text("Alcı OSB Mahallesi 2032 Cad. No: 1 / 1 SİNCAN / ANKARA",
              style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 14)),
        ),
        Container(padding: const EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("T:",
                  style: TextStyle(color: Color(0xFF004A87), fontSize: 14)),
              Container(padding: const EdgeInsets.only(right: 10),
                child: const Text("+90(312)641-3252",
                    style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 14)),
              ),
              const Text("M:",
                  style: TextStyle(color: Color(0xFF004A87), fontSize: 14)),
              const Text("+90(530)667-0073",
                  style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 14))
            ],
          ),
        ),
        Container(padding: const EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("F:",
                  style: TextStyle(color: Color(0xFF004A87), fontSize: 14)),
              Text("+90(312)394-7795",
                  style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 14)),
            ],
          ),
        ),
        Container(padding: const EdgeInsets.only(top: 5,bottom: 25),
          alignment: Alignment.center,
          child: const Text("www.gemak.tr - gemak@gemak.com.tr"),
        )
      ],
    );
  }
}
