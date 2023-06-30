import 'package:flutter/material.dart';

import 'footer.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: const Color(0xff054f7d),
    toolbarHeight: 90,
    title: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            child: Image.asset(
              "images/logo.png",
              height: 60,
            ),
          ),
          CircularButton(
            text: "Hemen Teslim",
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

Divider buildDivider() {
  return const Divider(
    height: 10,
    thickness: 4,
    color: Colors.black,
    endIndent: 15,
    indent: 15,
  );
}

class PageTitle extends StatelessWidget {
  String title;

  PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme.of(context).colorScheme.background,
      padding: PagePadding().titlePadding,
      child: SizedBox(
          width: double.maxFinite,
          child: Text(
            title,
            style: TextStyle(
                fontSize: Theme.of(context).primaryTextTheme.headline5!.fontSize),
          )),
    );
  }
}

class PagePadding {
  double padd;
  late EdgeInsets widgetPadding;

  PagePadding({this.padd = 10}) {
    widgetPadding = EdgeInsets.only(bottom: padd, top: padd, right: 25, left: 25);
  }

  EdgeInsets titlePadding = const EdgeInsets.all(10);
  EdgeInsets shortPadding = const EdgeInsets.all(5);
}

class CustomTextView extends StatelessWidget {
  List<List<String>> yazi;
  String title;
  String pic;
  bool footerIn;

  CustomTextView(
      {Key? key,
      required this.yazi,
      required this.title,
      required this.pic,
      this.footerIn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: yazi.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 0
                  ? PageTitle(
                      title: title,
                    )
                  : const Stack(),
              if (index == 0 && pic != "") Image.network(pic) else const Stack(),
              Container(
                  padding: PagePadding().widgetPadding,
                  alignment: Alignment.centerLeft,
                  child: yazi[index][0] == ""
                      ? const Stack()
                      : Text(
                          yazi[index][0],
                          style: TextStyle(
                              fontWeight: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyLarge!
                                  .fontWeight,
                              fontSize:
                                  Theme.of(context).primaryTextTheme.bodyLarge!.fontSize),
                        )),
              Container(
                  padding: PagePadding().widgetPadding,
                  child: Text(
                    textAlign: TextAlign.justify,
                    yazi[index][1],
                    style: TextStyle(
                        fontSize: Theme.of(context).primaryTextTheme.bodyLarge!.fontSize),
                  )),
              index == yazi.length - 1 && footerIn
                  ? const Column(
                      children: [
                        CustomDivider(),
                        Footer(),
                      ],
                    )
                  : const Stack(),
            ],
          );
        });
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 5,
    );
  }
}

class CustomTextView1 extends StatelessWidget {
  List<List<String>> yazi;
  String title;
  String pic;
  bool footerIn;
  bool titleIn;
  double textPadding;

  CustomTextView1(
      {Key? key,
      required this.yazi,
      required this.title,
      required this.pic,
      this.footerIn = true,
      this.titleIn = true,
      this.textPadding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          index == 0 && titleIn
              ? PageTitle(
                  title: title,
                )
              : const Stack(),
          if (index == 0 && pic != "") Image.network(pic) else const Stack(),
          Container(
              padding: PagePadding().widgetPadding,
              alignment: Alignment.centerLeft,
              child: yazi[index][0] == ""
                  ? const Stack()
                  : Text(
                      yazi[index][0],
                      style: TextStyle(
                          fontWeight:
                              Theme.of(context).primaryTextTheme.bodyLarge!.fontWeight,
                          fontSize:
                              Theme.of(context).primaryTextTheme.bodyLarge!.fontSize),
                    )),
          Container(
              alignment: Alignment.centerLeft,
              padding: PagePadding(padd: textPadding).widgetPadding,
              child: Text(
                textAlign: TextAlign.justify,
                yazi[index][1],
                style: TextStyle(
                    fontSize: Theme.of(context).primaryTextTheme.bodyLarge!.fontSize),
              )),
          index == yazi.length - 1 && footerIn
              ? const Column(
                  children: [
                    CustomDivider(),
                    Footer(),
                  ],
                )
              : const Stack(),
        ],
      );
    }, childCount: yazi.length));
  }
}

class PastModelCard extends StatelessWidget {
  const PastModelCard({
    super.key,
    required this.pic,
    required this.title,
  });

  final String pic;
  final String title;

  @override
  Widget build(BuildContext context) {
    String _pic = pic;
    String _title = title;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          child: Image.network(_pic),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(_title,
              style: const TextStyle(
                color: Color(0xFF054F7D),
                fontSize: 24,
              )),
        ),
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CircularButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffff6000),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffff6000).withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(3, 0),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const CircleBorder(),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
