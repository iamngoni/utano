//
//  payment_method
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:json_annotation/json_annotation.dart';

enum PaymentMethod {
  @JsonValue('cash')
  cash('Cash'),
  @JsonValue('bond')
  bond('Bond'),
  @JsonValue('swipe')
  swipe('Swipe'),
  @JsonValue('ecocash')
  ecocash('EcoCash'),
  @JsonValue('onemoney')
  onemoney('OneMoney');

  const PaymentMethod(this.name);
  final String name;

  @override
  String toString() => name;
}
