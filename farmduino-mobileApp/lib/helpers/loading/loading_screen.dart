import 'dart:async';
import 'package:farmduino/helpers/loading/loading_screen_controller.dart';
import 'package:flutter/material.dart';

class LoadingScreen {
  static final LoadingScreen _shared = LoadingScreen._instance();
  factory LoadingScreen() => _shared;
  LoadingScreen._instance();

  LoadingScreenController? controller;

  void show({
    required BuildContext context,
    required String text,
    required bool showCircularIndecator,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
        showCircularIndecator: showCircularIndecator,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
    required bool showCircularIndecator,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _text = StreamController<String>();
    _text.add(text);
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      (showCircularIndecator)
                          ? const CircularProgressIndicator()
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: _text.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return (Text(
                              snapshot.data as String,
                              textAlign: TextAlign.center,
                            ));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    state.insert(overlay);

    return LoadingScreenController(
      close: () {
        _text.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        _text.add(text);
        return true;
      },
    );
  }
}
