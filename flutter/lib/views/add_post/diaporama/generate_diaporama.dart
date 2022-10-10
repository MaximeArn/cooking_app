import 'dart:io';
import 'dart:typed_data';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:cooking/extensions.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../../widgets/back_arrow.dart';
import '../../../widgets/loader.dart';
import '../../feed/widgets/logo_cooking.dart';

class GenerateDiaporama extends StatefulWidget {
  final Map<String, int> map;
  final List<String> listOrder;

  const GenerateDiaporama({
    Key? key,
    required this.map,
    required this.listOrder,
  }) : super(key: key);

  @override
  _GenerateDiaporamaState createState() => _GenerateDiaporamaState();
}

class _GenerateDiaporamaState extends State<GenerateDiaporama> {
  bool _processing = true;
  late CachedVideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startProcess());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _processing
            ? Loader()
            : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _videoWidget(),
                  LogoCooking(),
                  Positioned(left: 16, top: 16, child: BackArrow()),
                  _publishBtn(),
                ],
              ),
      ),
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _videoWidget() => GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CachedVideoPlayer(_controller)),
      );

  Widget _publishBtn() => Positioned(
        left: 32,
        right: 32,
        bottom: 16,
        child: ElevatedButton(
          onPressed: _onPublishPressed,
          child: Text("Publier"),
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onVideoGenerated(File video) async {
    _controller = CachedVideoPlayerController.file(video);
    await _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    setState(() {
      _processing = false;
    });
  }

  void _onPublishPressed() async {
    // PostsProvider postsProvider =
    //     Provider.of<PostsProvider>(context, listen: false);
    // Response r = await postsProvider.createPost(
    //     video: widget.file, authorId: UsersProvider.currentUserId ?? "-1");
    // print(r.statusCode);
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////

  void _startProcess() async {
    final String temp = (await getTemporaryDirectory()).path;
    String date = DateTime.now().toString().replaceAll(' ', '_');
    final String input =
        await _createInputFile(widget.listOrder, temp: temp, date: date);
    final String output = "$temp/$date.mp4";
    final String audio = await _getAudioFilePath(date: date, temp: temp);
    final String command =
        '-f concat -safe 0 -i $input -i $audio -c:v libx264 -movflags +faststart -c:a copy -shortest "$output"';
    _generateVideo(command, output);
  }

  Future<String> _createInputFile(
    List<String> paths, {
    required String temp,
    required String date,
  }) async {
    String str = "";
    for (String p in paths) {
      // From official doc :
      // "(Due to a quirk, the last image has to be specified twice - the 2nd time without any duration directive)"
      if (p == paths.last) {
        str += "file '$p'\nduration ${(widget.map[p] ?? 5) / 2}\n";
        str += "file '${paths.last}'";
      } else {
        str += "file '$p'\nduration ${widget.map[p] ?? 5}\n";
      }
    }

    print(str.toYellowLog());
    File input = File("$temp/input_$date.txt");
    await input.writeAsString(str);
    return input.path;
  }

  Future<String> _getAudioFilePath(
      {required String temp, required String date}) async {
    final ByteData byteData = await rootBundle.load('assets/sample.mp3');
    final ByteBuffer buffer = byteData.buffer;
    File audio = File("$temp/$date.mp3");
    await audio.writeAsBytes(buffer.asUint8List());
    return audio.path;
  }

  Future<void> _generateVideo(String command, String output) async {
    print("Starting Ffmpeg with command '$command'".toGreenLog());
    await FFmpegKit.executeAsync(command, (session) async {
      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        File video = File(output);
        _onVideoGenerated(video);
      } else {
        print("Error creating video".toRedLog());
      }
    });
  }
}
