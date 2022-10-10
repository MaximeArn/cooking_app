import 'dart:async';
import 'dart:io';

import 'package:cooking/themes.dart';
import 'package:cooking/views/add_post/diaporama/generate_diaporama.dart';
import 'package:cooking/widgets/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:reorderables/reorderables.dart';

class DiaporamaPage extends StatefulWidget {
  const DiaporamaPage({Key? key}) : super(key: key);

  @override
  _DiaporamaPageState createState() => _DiaporamaPageState();
}

class _DiaporamaPageState extends State<DiaporamaPage> {
  final Map<String, int> _photosMap = <String, int>{};
  final List<String> _photosOrder = <String>[];
  bool _isTooLong = false;

  @override
  void initState() {
    super.initState();
    _displayImagesPicker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackArrow(),
                _imagesWrap(),
                if (_isTooLong)
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Text("La durée totale ne peut pas excéder 1 minute",
                        style: TextStyle(color: Colors.red[800])),
                  ),
                _confirmBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//////////////////////////////// WIDGETS ////////////////////////////////

  Widget _imagesWrap() => Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: ReorderableWrap(
          footer: (4 - _photosOrder.length > 0) ? _addImagesWidget() : null,
          onReorder: (oldIndex, newIndex) {
            final String moved = _photosOrder.removeAt(oldIndex);
            _photosOrder.insert(newIndex, moved);
            setState(() {});
          },
          children: [
            ..._photosOrder.map((String path) => _getImageWidgets(path))
          ],
        ),
      );

  Widget _addImagesWidget() => InkWell(
        onTap: _displayImagesPicker,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white12),
            child: Icon(Icons.add, size: 64),
          ),
        ),
      );

  Widget _getImageWidgets(String path) {
    TextEditingController c =
        TextEditingController(text: "${_photosMap[path]}");
    c.addListener(
      () => _onDurationForPhotoChanged(
        path,
        int.parse(c.text),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image.file(File(path), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IntrinsicWidth(
                    child: TextField(
                      controller: c,
                      maxLines: 1,
                      maxLength: 2,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          counterText: '',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: cookingGold)),
                          border: InputBorder.none),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("s")
                ],
              )
            ],
          ),
          Positioned(
              top: -12,
              right: -12,
              child: IconButton(
                  color: Colors.grey[100],
                  onPressed: () {
                    _photosMap.remove(path);
                    _photosOrder.remove(path);
                    setState(() {});
                  },
                  icon: Icon(Icons.close)))
        ],
      ),
    );
  }

  Widget _confirmBtn() => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed:
                  _photosOrder.isNotEmpty ? () => _onConfirmPressed() : null,
              child: Text("Valider"),
            ),
          ),
        ),
      );

//////////////////////////////// LISTENERS ////////////////////////////////

  _onDurationForPhotoChanged(String photoPath, int duration) {
    if (duration > 0) {
      _photosMap[photoPath] = duration;
      _isTooLong = _photosMap.values.toList().reduce((a, b) => a + b) > 60;
    }
  }

  _onConfirmPressed() {
    setState(() {});
    if (!_isTooLong) {
      Navigator.of(context).push(
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => GenerateDiaporama(
            map: _photosMap,
            listOrder: _photosOrder,
          ),
        ),
      );
    }
  }

//////////////////////////////// FUNCTIONS ////////////////////////////////

  Future _displayImagesPicker() async {
    List<Media>? res = await ImagesPicker.pick(
      count: 4 - _photosOrder.length,
      pickType: PickType.image,
    );
    if (res != null) {
      for (Media media in res) {
        if (!_photosMap.containsKey(media.path)) {
          _photosOrder.add(media.path);
          _photosMap.putIfAbsent(media.path, () => 5);
        }
      }
      setState(() {});
    }
  }
}
