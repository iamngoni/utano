//
//  di
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:get_it/get_it.dart';

import '../configs/configs.dart';
import 'storage.dart';

GetIt di = GetIt.instance;

Future<void> setupServices() async {
  logger.info('Registering services...');
  final storageInstance = await StorageService.getInstance();

  di.registerSingleton<StorageService>(storageInstance);
  logger.info('Services registered.');
}
