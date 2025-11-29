import 'dart:typed_data';

import 'package:equatable/equatable.dart';

sealed class ElectrumImage extends Equatable {}

class ElectrumImageAsset extends ElectrumImage {
  final String assetPath;

  ElectrumImageAsset({required this.assetPath});
  @override
  List<Object?> get props => [assetPath];
}

class ElectrumImageNetwork extends ElectrumImage {
  final String url;
  ElectrumImageNetwork({required this.url});
  @override
  List<Object?> get props => [url];
}

class ElectrumImageFile extends ElectrumImage {
  final String filePath;
  ElectrumImageFile({required this.filePath});
  @override
  List<Object?> get props => [filePath];
}

class ElectrumImageBytes extends ElectrumImage {
  final Uint8List bytes;
  ElectrumImageBytes({required this.bytes});
  @override
  List<Object?> get props => [bytes];
}

