//
//  error
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

class Error implements Exception {
  Error(this.message, {this.title = 'Something went wrong'});
  final String message;
  final String title;
}
