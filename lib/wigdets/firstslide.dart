import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gemak/utulity/models.dart';
import 'package:gemak/utulity/openurl.dart';

class FirstSlide extends StatefulWidget {
  List<PicSlideModel> slides;

   FirstSlide({Key? key, required this.slides}) : super(key: key);

  @override
  _FirstSlideState createState() => _FirstSlideState();
}

class _FirstSlideState extends State<FirstSlide> {
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
    return Container(color: Colors.black,
      height: 150,
      width: double.infinity,
      child: PageView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: widget.slides.length, (BuildContext contex, int index) {
          return SizedBox(
            height: 150,
            child: InkWell(
              onTap: () async {
                if (widget.slides[index].picLink != "") {
                  openURL(widget.slides[index].picLink);
                }
              },
              child: Stack(
                  children: [
                SizedBox(
                  height: 150,
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
                                  loadingProgress.expectedTotalBytes!.toInt()
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 150,
                  bottom: 50,
                  child: widget.slides[index].picTitle == ""
                      ? Container()
                      : Container(
                          decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            widget.slides[index].picTitle,
                            style: const TextStyle(
                              color: Color(0xff004a87),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                ),
              ]),
            ),
          );
        }),
        controller: _controller,
      ),
    );
  }
}
