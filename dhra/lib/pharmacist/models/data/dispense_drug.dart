//
//  dispense_drug
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'drug.dart';

class DispenseDrug {
  const DispenseDrug(this.drug, this.quantity);
  final Drug drug;
  final int quantity;

  DispenseDrug copyWith(int quantity) {
    return DispenseDrug(drug, quantity);
  }
}
