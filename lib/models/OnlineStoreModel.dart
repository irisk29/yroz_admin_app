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


/** This is an auto generated class representing the OnlineStoreModel type in your schema. */
@immutable
class OnlineStoreModel extends Model {
  static const classType = const _OnlineStoreModelModelType();
  final String id;
  final String? _name;
  final String? _phoneNumber;
  final String? _address;
  final String? _operationHours;
  final String? _categories;
  final List<StoreProductModel>? _storeProductModels;
  final String? _qrCode;
  final String? _imageUrl;

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
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phoneNumber {
    try {
      return _phoneNumber!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get operationHours {
    try {
      return _operationHours!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get categories {
    try {
      return _categories!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<StoreProductModel>? get storeProductModels {
    return _storeProductModels;
  }
  
  String? get qrCode {
    return _qrCode;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  const OnlineStoreModel._internal({required this.id, required name, required phoneNumber, required address, required operationHours, required categories, storeProductModels, qrCode, imageUrl}): _name = name, _phoneNumber = phoneNumber, _address = address, _operationHours = operationHours, _categories = categories, _storeProductModels = storeProductModels, _qrCode = qrCode, _imageUrl = imageUrl;
  
  factory OnlineStoreModel({String? id, required String name, required String phoneNumber, required String address, required String operationHours, required String categories, List<StoreProductModel>? storeProductModels, String? qrCode, String? imageUrl}) {
    return OnlineStoreModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      operationHours: operationHours,
      categories: categories,
      storeProductModels: storeProductModels != null ? List<StoreProductModel>.unmodifiable(storeProductModels) : storeProductModels,
      qrCode: qrCode,
      imageUrl: imageUrl);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OnlineStoreModel &&
      id == other.id &&
      _name == other._name &&
      _phoneNumber == other._phoneNumber &&
      _address == other._address &&
      _operationHours == other._operationHours &&
      _categories == other._categories &&
      DeepCollectionEquality().equals(_storeProductModels, other._storeProductModels) &&
      _qrCode == other._qrCode &&
      _imageUrl == other._imageUrl;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("OnlineStoreModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("operationHours=" + "$_operationHours" + ", ");
    buffer.write("categories=" + "$_categories" + ", ");
    buffer.write("qrCode=" + "$_qrCode" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OnlineStoreModel copyWith({String? id, String? name, String? phoneNumber, String? address, String? operationHours, String? categories, List<StoreProductModel>? storeProductModels, String? qrCode, String? imageUrl}) {
    return OnlineStoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      operationHours: operationHours ?? this.operationHours,
      categories: categories ?? this.categories,
      storeProductModels: storeProductModels ?? this.storeProductModels,
      qrCode: qrCode ?? this.qrCode,
      imageUrl: imageUrl ?? this.imageUrl);
  }
  
  OnlineStoreModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _phoneNumber = json['phoneNumber'],
      _address = json['address'],
      _operationHours = json['operationHours'],
      _categories = json['categories'],
      _storeProductModels = json['storeProductModels'] is List
        ? (json['storeProductModels'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StoreProductModel.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _qrCode = json['qrCode'],
      _imageUrl = json['imageUrl'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'phoneNumber': _phoneNumber, 'address': _address, 'operationHours': _operationHours, 'categories': _categories, 'storeProductModels': _storeProductModels?.map((StoreProductModel? e) => e?.toJson()).toList(), 'qrCode': _qrCode, 'imageUrl': _imageUrl
  };

  static final QueryField ID = QueryField(fieldName: "onlineStoreModel.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField OPERATIONHOURS = QueryField(fieldName: "operationHours");
  static final QueryField CATEGORIES = QueryField(fieldName: "categories");
  static final QueryField STOREPRODUCTMODELS = QueryField(
    fieldName: "storeProductModels",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (StoreProductModel).toString()));
  static final QueryField QRCODE = QueryField(fieldName: "qrCode");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OnlineStoreModel";
    modelSchemaDefinition.pluralName = "OnlineStoreModels";
    
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
      key: OnlineStoreModel.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.PHONENUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.ADDRESS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.OPERATIONHOURS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.CATEGORIES,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: OnlineStoreModel.STOREPRODUCTMODELS,
      isRequired: false,
      ofModelName: (StoreProductModel).toString(),
      associatedKey: StoreProductModel.ONLINESTOREMODELID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.QRCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OnlineStoreModel.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _OnlineStoreModelModelType extends ModelType<OnlineStoreModel> {
  const _OnlineStoreModelModelType();
  
  @override
  OnlineStoreModel fromJson(Map<String, dynamic> jsonData) {
    return OnlineStoreModel.fromJson(jsonData);
  }
}