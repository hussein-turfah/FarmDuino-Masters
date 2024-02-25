import 'package:flutter/foundation.dart' show immutable;

typedef ClosedLoadingScreen = bool Function();
typedef UpdatedLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final ClosedLoadingScreen close;
  final UpdatedLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
