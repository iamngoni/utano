// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Drug _$$_DrugFromJson(Map<String, dynamic> json) => _$_Drug(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$_DrugToJson(_$_Drug instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'is_active': instance.isActive,
    };
