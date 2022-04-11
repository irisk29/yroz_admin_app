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

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ShoppingBagModel type in your schema. */
@immutable
class ShoppingBagModel extends Model {
  static const classType = const _ShoppingBagModelModelType();
  final String id;
  final String? _usermodelID;
  final List<CartProductModel>? _CartProductModels;
  final String? _onlineStoreID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get usermodelID {
    try {
      return _usermodelID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<CartProductModel>? get CartProductModels {
    return _CartProductModels;
  }
  
  String? get onlineStoreID {
    return _onlineStoreID;
  }
  
  const ShoppingBagModel._internal({required this.id, required usermodelID, CartProductModels, onlineStoreID}): _usermodelID = usermodelID, _CartProductModels = CartProductModels, _onlineStoreID = onlineStoreID;
  
  factory ShoppingBagModel({String? id, required String usermodelID, List<CartProductModel>? CartProductModels, String? onlineStoreID}) {
    return ShoppingBagModel._internal(
      id: id == null ? UUID.getUUID() : id,
      usermodelID: usermodelID,
      CartProductModels: CartProductModels != null ? List<CartProductModel>.unmodifiable(CartProductModels) : CartProductModels,
      onlineStoreID: onlineStoreID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShoppingBagModel &&
      id == other.id &&
      _usermodelID == other._usermodelID &&
      DeepCollectionEquality().equals(_CartProductModels, other._CartProductModels) &&
      _onlineStoreID == other._onlineStoreID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ShoppingBagModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("usermodelID=" + "$_usermodelID" + ", ");
    buffer.write("onlineStoreID=" + "$_onlineStoreID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ShoppingBagModel copyWith({String? id, String? usermodelID, List<CartProductModel>? CartProductModels, String? onlineStoreID}) {
    return ShoppingBagModel(
      id: id ?? this.id,
      usermodelID: usermodelID ?? this.usermodelID,
      CartProductModels: CartProductModels ?? this.CartProductModels,
      onlineStoreID: onlineStoreID ?? this.onlineStoreID);
  }
  
  ShoppingBagModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _usermodelID = json['usermodelID'],
      _CartProductModels = json['CartProductModels'] is List
        ? (json['CartProductModels'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CartProductModel.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _onlineStoreID = json['onlineStoreID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'usermodelID': _usermodelID, 'CartProductModels': _CartProductModels?.map((CartProductModel? e) => e?.toJson()).toList(), 'onlineStoreID': _onlineStoreID
  };

  static final QueryField ID = QueryField(fieldName: "shoppingBagModel.id");
  static final QueryField USERMODELID = QueryField(fieldName: "usermodelID");
  static final QueryField CARTPRODUCTMODELS = QueryField(
    fieldName: "CartProductModels",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (CartProductModel).toString()));
  static final QueryField ONLINESTOREID = QueryField(fieldName: "onlineStoreID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShoppingBagModel";
    modelSchemaDefinition.pluralName = "ShoppingBagModels";
    
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
      key: ShoppingBagModel.USERMODELID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ShoppingBagModel.CARTPRODUCTMODELS,
      isRequired: false,
      ofModelName: (CartProductModel).toString(),
      associatedKey: CartProductModel.SHOPPINGBAGMODELID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingBagModel.ONLINESTOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ShoppingBagModelModelType extends ModelType<ShoppingBagModel> {
  const _ShoppingBagModelModelType();
  
  @override
  ShoppingBagModel fromJson(Map<String, dynamic> jsonData) {
    return ShoppingBagModel.fromJson(jsonData);
  }
}