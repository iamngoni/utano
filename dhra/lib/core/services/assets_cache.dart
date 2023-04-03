//
//  assets_cache
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

List<String> imageAssets = [
  'assets/images/bg-1.jpg',
  'assets/images/bg-2.jpg',
  'assets/images/bg-3.jpeg',
  'assets/images/logo.png',
  'assets/images/logo-full.png',
  'assets/images/logo-red.png',
  'assets/images/logo-red-black.png',
  'assets/images/moh.png',
];

void cacheAssets(BuildContext context) {
  for (final assetPath in imageAssets) {
    precacheImage(AssetImage(assetPath), context);
  }
}
