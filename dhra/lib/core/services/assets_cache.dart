import 'package:flutter/material.dart';

List<String> imageAssets = [
  'assets/images/bg_1.png',
  'assets/images/bg_2.png',
];

void cacheAssets(BuildContext context) {
  for (final assetPath in imageAssets) {
    precacheImage(AssetImage(assetPath), context);
  }
}
