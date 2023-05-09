import 'package:flutter/material.dart';

import '../utulity/models.dart';

class Indicator extends StatefulWidget {
  PageController controller;
  int item;
  List<SecondSlideModel> slides;

  Indicator(this.controller, this.item, this.slides, {Key? key})
      : super(key: key);

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleChange);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.width / 9,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _creatIndicatorElement(index);
        },
        itemCount: widget.item,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _creatIndicatorElement(index) {
    double w = MediaQuery.of(context).size.width / 9;
    double h = MediaQuery.of(context).size.width / 9;
    Color color = Colors.white;
    if (widget.controller.page == index) {
      color = Colors.blueAccent.shade100;
    }
    return SizedBox(
      height: w,
      width: h,
      child: InkWell(
        onTap: () {
          widget.controller.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        },
        child: Center(
          child: Container(
            width: w,
            height: h,
            color: color,
            child: Image.network(widget.slides[index].sPic),
          ),
        ),
      ),
    );
  }

  _handleChange() {
    setState(() {});
  }
}
