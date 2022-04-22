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


/** This is an auto generated class representing the PurchaseHistoryModel type in your schema. */
@immutable
class PurchaseHistoryModel extends Model {
  static const classType = const _PurchaseHistoryModelModelType();
  final String id;
  final TemporalDateTime? _date;
  final String? _transactionID;
  final String? _products;
  final String? _userID;
  final String? _storeID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime get date {
    try {
      return _date!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get transactionID {
    try {
      return _transactionID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get products {
    return _products;
  }
  
  String? get userID {
    return _userID;
  }
  
  String? get storeID {
    return _storeID;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PurchaseHistoryModel._internal({required this.id, required date, required transactionID, products, userID, storeID, createdAt, updatedAt}): _date = date, _transactionID = transactionID, _products = products, _userID = userID, _storeID = storeID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PurchaseHistoryModel({String? id, required TemporalDateTime date, required String transactionID, String? products, String? userID, String? storeID}) {
    return PurchaseHistoryModel._internal(
      id: id == null ? UUID.getUUID() : id,
      date: date,
      transactionID: transactionID,
      products: products,
      userID: userID,
      storeID: storeID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PurchaseHistoryModel &&
      id == other.id &&
      _date == other._date &&
      _transactionID == other._transactionID &&
      _products == other._products &&
      _userID == other._userID &&
      _storeID == other._storeID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PurchaseHistoryModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("transactionID=" + "$_transactionID" + ", ");
    buffer.write("products=" + "$_products" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("storeID=" + "$_storeID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PurchaseHistoryModel copyWith({String? id, TemporalDateTime? date, String? transactionID, String? products, String? userID, String? storeID}) {
    return PurchaseHistoryModel._internal(
      id: id ?? this.id,
      date: date ?? this.date,
      transactionID: transactionID ?? this.transactionID,
      products: products ?? this.products,
      userID: userID ?? this.userID,
      storeID: storeID ?? this.storeID);
  }
  
  PurchaseHistoryModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'] != null ? TemporalDateTime.fromString(json['date']) : null,
      _transactionID = json['transactionID'],
      _products = json['products'],
      _userID = json['userID'],
      _storeID = json['storeID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date?.format(), 'transactionID': _transactionID, 'products': _products, 'userID': _userID, 'storeID': _storeID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "purchaseHistoryModel.id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TRANSACTIONID = QueryField(fieldName: "transactionID");
  static final QueryField PRODUCTS = QueryField(fieldName: "products");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField STOREID = QueryField(fieldName: "storeID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PurchaseHistoryModel";
    modelSchemaDefinition.pluralName = "PurchaseHistoryModels";
    
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
      key: PurchaseHistoryModel.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseHistoryModel.TRANSACTIONID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseHistoryModel.PRODUCTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseHistoryModel.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PurchaseHistoryModel.STOREID,
      isRequired: false,
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

class _PurchaseHistoryModelModelType extends ModelType<PurchaseHistoryModel> {
  const _PurchaseHistoryModelModelType();
  
  @override
  PurchaseHistoryModel fromJson(Map<String, dynamic> jsonData) {
    return PurchaseHistoryModel.fromJson(jsonData);
  }
}