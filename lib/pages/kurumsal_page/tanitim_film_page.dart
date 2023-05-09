import 'package:flutter/material.dart';
import 'package:gemak/wigdets/footer.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../wigdets/buildCustomWidget.dart';

class TanitimFilmi extends StatefulWidget {
  TanitimFilmi(this.url, {Key? key}) : super(key: key);
  String url;

  @override
  _TanitimFilmiState createState() => _TanitimFilmiState();
}

class _TanitimFilmiState extends State<TanitimFilmi> {
  late VideoPlayerController _controller;
  late final chewieController;
  bool _isTapped = false;

  void _changeTapped() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Card(
              child: _controller.value.isInitialized
                  ? Center(
                      child: Container(
                        color: Colors.deepOrange,
                        child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: Chewie(
                              controller: chewieController,
                            )),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          Expanded(child: Container()),
          const Footer()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController.dispose();
  }
}
