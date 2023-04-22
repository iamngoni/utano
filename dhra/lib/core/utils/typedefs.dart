//
//  typedefs
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import '../models/data/gender.dart';

typedef RSize = double Function(double);

typedef OnUpdateGender = void Function(Gender? gender);

typedef OnUpdateUseAge = void Function(bool useAge);

typedef OnUpdateDateOfBirth = void Function(DateTime? dateOfBirth);
