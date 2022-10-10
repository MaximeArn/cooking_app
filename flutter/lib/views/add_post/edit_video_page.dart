// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cooking/themes.dart';
import 'package:cooking/widgets/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:video_trimmer/video_trimmer.dart';

import 'preview_video.dart';

class EditVideoPage extends StatefulWidget {
  final File videoFile;

  const EditVideoPage({
    Key? key,
    required this.videoFile,
  }) : super(key: key);

  @override
  State<EditVideoPage> createState() => _EditVideoPageState();
}

class _EditVideoPageState extends State<EditVideoPage> {
  final Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Visibility(
                  visible: _progressVisibility,
                  child: LinearProgressIndicator(
                    backgroundColor: cookingGold,
                  ),
                ),
                Expanded(
                  child: VideoViewer(trimmer: _trimmer),
                ),
                Center(
                  child: TrimEditor(
                    trimmer: _trimmer,
                    viewerHeight: 50.0,
                    viewerWidth: MediaQuery.of(context).size.width,
                    maxVideoLength: Duration(seconds: 60),
                    onChangeStart: (value) {
                      _startValue = value;
                    },
                    onChangeEnd: (value) {
                      _endValue = value;
                    },
                    onChangePlaybackState: (value) {
                      setState(() {
                        _isPlaying = value;
                      });
                    },
                  ),
                ),
                TextButton(
                  child: _isPlaying
                      ? Icon(
                          Icons.pause,
                          size: 80.0,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.play_arrow,
                          size: 80.0,
                          color: Colors.white,
                        ),
                  onPressed: () async {
                    bool playbackState = await _trimmer.videPlaybackControl(
                      startValue: _startValue,
                      endValue: _endValue,
                    );
                    setState(() {
                      _isPlaying = playbackState;
                    });
                  },
                ),
                _confirmBtn(),
                const SizedBox(height: 16),
              ],
            ),
            BackArrow(),
          ],
        ),
      ),
    );
  }

//////////////////////////////// WIDGETS //////////////////////////////////

  Widget _confirmBtn() => ElevatedButton(
        onPressed: _progressVisibility ? null : _onConfirmPressed,
        child: Text("Confirmer"),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  void _onConfirmPressed() async {
    setState(() {
      _progressVisibility = true;
    });

    await _trimmer.saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      onSave: (outputPath) {
        setState(() {
          _progressVisibility = false;
        });
        debugPrint('OUTPUT PATH: $outputPath');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PreviewVideo(file: File(outputPath!)),
          ),
        );
      },
    );
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: widget.videoFile);
  }
}
