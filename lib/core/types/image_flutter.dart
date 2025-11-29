import 'dart:io';

import 'package:electrum/core/types/image.dart';
import 'package:flutter/material.dart';

extension ElectrumImageProviderExtension on ElectrumImage {
  ImageProvider get provider {
    return switch (this) {
      ElectrumImageAsset(assetPath: final assetPath) => AssetImage(assetPath),
      ElectrumImageNetwork(url: final url) => NetworkImage(url),
      ElectrumImageFile(filePath: final filePath) => FileImage(File(filePath)),
      ElectrumImageBytes(bytes: final bytes) => MemoryImage(bytes),
    };
  }
}

