import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gemak/utulity/models.dart';
import 'package:gemak/utulity/openurl.dart';
import 'package:gemak/wigdets/pageviewindicator.dart';

class SecondSlide extends StatefulWidget {
  List<SecondSlideModel> slides;

  SecondSlide({Key? key, required this.slides}) : super(key: key);

  @override
  _SecondSlideState createState() => _SecondSlideState();
}

class _SecondSlideState extends State<SecondSlide> {
  int _currentPage = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < widget.slides.length - 1) {
        _controller.nextPage(
            duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
        _currentPage++;
      } else {
        _controller.animateToPage(0,
            duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.slides.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      if (widget.slides[index].picLink != "") {
                        openURL(widget.slides[index].picLink);
                      }
                    },
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        widget.slides[index].pic,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                          .toInt()
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Indicator(_controller,widget.slides.length,widget.slides),
      ],
    );
  }
}
