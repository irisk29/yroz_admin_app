/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CartProductModel type in your schema. */
@immutable
class CartProductModel extends Model {
  static const classType = const _CartProductModelModelType();
  final String id;
  final String? _name;
  final String? _categories;
  final double? _price;
  final String? _imageUrl;
  final String? _description;
  final double? _amount;
  final String? _storeProductID;
  final String? _shoppingbagmodelID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get categories {
    try {
      return _categories!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  String? get description {
    return _description;
  }
  
  double get amount {
    try {
      return _amount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get storeProductID {
    return _storeProductID;
  }
  
  String get shoppingbagmodelID {
    try {
      return _shoppingbagmodelID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CartProductModel._internal({required this.id, required name, required categories, required price, imageUrl, description, required amount, storeProductID, required shoppingbagmodelID, createdAt, updatedAt}): _name = name, _categories = categories, _price = price, _imageUrl = imageUrl, _description = description, _amount = amount, _storeProductID = storeProductID, _shoppingbagmodelID = shoppingbagmodelID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CartProductModel({String? id, required String name, required String categories, required double price, String? imageUrl, String? description, required double amount, String? storeProductID, required String shoppingbagmodelID}) {
    return CartProductModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      categories: categories,
      price: price,
      imageUrl: imageUrl,
      description: description,
      amount: amount,
      storeProductID: storeProductID,
      shoppingbagmodelID: shoppingbagmodelID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartProductModel &&
      id == other.id &&
      _name == other._name &&
      _categories == other._categories &&
      _price == other._price &&
      _imageUrl == other._imageUrl &&
      _description == other._description &&
      _amount == other._amount &&
      _storeProductID == other._storeProductID &&
      _shoppingbagmodelID == other._shoppingbagmodelID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CartProductModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("categories=" + "$_categories" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("storeProductID=" + "$_storeProductID" + ", ");
    buffer.write("shoppingbagmodelID=" + "$_shoppingbagmodelID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CartProductModel copyWith({String? id, String? name, String? categories, double? price, String? imageUrl, String? description, double? amount, String? storeProductID, String? shoppingbagmodelID}) {
    return CartProductModel._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      storeProductID: storeProductID ?? this.storeProductID,
      shoppingbagmodelID: shoppingbagmodelID ?? this.shoppingbagmodelID);
  }
  
  CartProductModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _categories = json['categories'],
      _price = (json['price'] as num?)?.toDouble(),
      _imageUrl = json['imageUrl'],
      _description = json['description'],
      _amount = (json['amount'] as num?)?.toDouble(),
      _storeProductID = json['storeProductID'],
      _shoppingbagmodelID = json['shoppingbagmodelID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'categories': _categories, 'price': _price, 'imageUrl': _imageUrl, 'description': _description, 'amount': _amount, 'storeProductID': _storeProductID, 'shoppingbagmodelID': _shoppingbagmodelID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "cartProductModel.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField CATEGORIES = QueryField(fieldName: "categories");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField STOREPRODUCTID = QueryField(fieldName: "storeProductID");
  static final QueryField SHOPPINGBAGMODELID = QueryField(fieldName: "shoppingbagmodelID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CartProductModel";
    modelSchemaDefinition.pluralName = "CartProductModels";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.CATEGORIES,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.AMOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.STOREPRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CartProductModel.SHOPPINGBAGMODELID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _CartProductModelModelType extends ModelType<CartProductModel> {
  const _CartProductModelModelType();
  
  @override
  CartProductModel fromJson(Map<String, dynamic> jsonData) {
    return CartProductModel.fromJson(jsonData);
  }
}