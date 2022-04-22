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
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the StoreOwnerModel type in your schema. */
@immutable
class StoreOwnerModel extends Model {
  static const classType = const _StoreOwnerModelModelType();
  final String id;
  final OnlineStoreModel? _onlineStoreModel;
  final PhysicalStoreModel? _physicalStoreModel;
  final String? _bankAccountToken;
  final TemporalDateTime? _lastPurchasesView;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _storeOwnerModelOnlineStoreModelId;
  final String? _storeOwnerModelPhysicalStoreModelId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  OnlineStoreModel? get onlineStoreModel {
    return _onlineStoreModel;
  }
  
  PhysicalStoreModel? get physicalStoreModel {
    return _physicalStoreModel;
  }
  
  String? get bankAccountToken {
    return _bankAccountToken;
  }
  
  TemporalDateTime? get lastPurchasesView {
    return _lastPurchasesView;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get storeOwnerModelOnlineStoreModelId {
    return _storeOwnerModelOnlineStoreModelId;
  }
  
  String? get storeOwnerModelPhysicalStoreModelId {
    return _storeOwnerModelPhysicalStoreModelId;
  }
  
  const StoreOwnerModel._internal({required this.id, onlineStoreModel, physicalStoreModel, bankAccountToken, lastPurchasesView, createdAt, updatedAt, storeOwnerModelOnlineStoreModelId, storeOwnerModelPhysicalStoreModelId}): _onlineStoreModel = onlineStoreModel, _physicalStoreModel = physicalStoreModel, _bankAccountToken = bankAccountToken, _lastPurchasesView = lastPurchasesView, _createdAt = createdAt, _updatedAt = updatedAt, _storeOwnerModelOnlineStoreModelId = storeOwnerModelOnlineStoreModelId, _storeOwnerModelPhysicalStoreModelId = storeOwnerModelPhysicalStoreModelId;
  
  factory StoreOwnerModel({String? id, OnlineStoreModel? onlineStoreModel, PhysicalStoreModel? physicalStoreModel, String? bankAccountToken, TemporalDateTime? lastPurchasesView, String? storeOwnerModelOnlineStoreModelId, String? storeOwnerModelPhysicalStoreModelId}) {
    return StoreOwnerModel._internal(
      id: id == null ? UUID.getUUID() : id,
      onlineStoreModel: onlineStoreModel,
      physicalStoreModel: physicalStoreModel,
      bankAccountToken: bankAccountToken,
      lastPurchasesView: lastPurchasesView,
      storeOwnerModelOnlineStoreModelId: storeOwnerModelOnlineStoreModelId,
      storeOwnerModelPhysicalStoreModelId: storeOwnerModelPhysicalStoreModelId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreOwnerModel &&
      id == other.id &&
      _onlineStoreModel == other._onlineStoreModel &&
      _physicalStoreModel == other._physicalStoreModel &&
      _bankAccountToken == other._bankAccountToken &&
      _lastPurchasesView == other._lastPurchasesView &&
      _storeOwnerModelOnlineStoreModelId == other._storeOwnerModelOnlineStoreModelId &&
      _storeOwnerModelPhysicalStoreModelId == other._storeOwnerModelPhysicalStoreModelId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StoreOwnerModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("bankAccountToken=" + "$_bankAccountToken" + ", ");
    buffer.write("lastPurchasesView=" + (_lastPurchasesView != null ? _lastPurchasesView!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("storeOwnerModelOnlineStoreModelId=" + "$_storeOwnerModelOnlineStoreModelId" + ", ");
    buffer.write("storeOwnerModelPhysicalStoreModelId=" + "$_storeOwnerModelPhysicalStoreModelId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StoreOwnerModel copyWith({String? id, OnlineStoreModel? onlineStoreModel, PhysicalStoreModel? physicalStoreModel, String? bankAccountToken, TemporalDateTime? lastPurchasesView, String? storeOwnerModelOnlineStoreModelId, String? storeOwnerModelPhysicalStoreModelId}) {
    return StoreOwnerModel._internal(
      id: id ?? this.id,
      onlineStoreModel: onlineStoreModel ?? this.onlineStoreModel,
      physicalStoreModel: physicalStoreModel ?? this.physicalStoreModel,
      bankAccountToken: bankAccountToken ?? this.bankAccountToken,
      lastPurchasesView: lastPurchasesView ?? this.lastPurchasesView,
      storeOwnerModelOnlineStoreModelId: storeOwnerModelOnlineStoreModelId ?? this.storeOwnerModelOnlineStoreModelId,
      storeOwnerModelPhysicalStoreModelId: storeOwnerModelPhysicalStoreModelId ?? this.storeOwnerModelPhysicalStoreModelId);
  }
  
  StoreOwnerModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _onlineStoreModel = json['onlineStoreModel']?['serializedData'] != null
        ? OnlineStoreModel.fromJson(new Map<String, dynamic>.from(json['onlineStoreModel']['serializedData']))
        : null,
      _physicalStoreModel = json['physicalStoreModel']?['serializedData'] != null
        ? PhysicalStoreModel.fromJson(new Map<String, dynamic>.from(json['physicalStoreModel']['serializedData']))
        : null,
      _bankAccountToken = json['bankAccountToken'],
      _lastPurchasesView = json['lastPurchasesView'] != null ? TemporalDateTime.fromString(json['lastPurchasesView']) : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _storeOwnerModelOnlineStoreModelId = json['storeOwnerModelOnlineStoreModelId'],
      _storeOwnerModelPhysicalStoreModelId = json['storeOwnerModelPhysicalStoreModelId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'onlineStoreModel': _onlineStoreModel?.toJson(), 'physicalStoreModel': _physicalStoreModel?.toJson(), 'bankAccountToken': _bankAccountToken, 'lastPurchasesView': _lastPurchasesView?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'storeOwnerModelOnlineStoreModelId': _storeOwnerModelOnlineStoreModelId, 'storeOwnerModelPhysicalStoreModelId': _storeOwnerModelPhysicalStoreModelId
  };

  static final QueryField ID = QueryField(fieldName: "storeOwnerModel.id");
  static final QueryField ONLINESTOREMODEL = QueryField(
    fieldName: "onlineStoreModel",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (OnlineStoreModel).toString()));
  static final QueryField PHYSICALSTOREMODEL = QueryField(
    fieldName: "physicalStoreModel",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (PhysicalStoreModel).toString()));
  static final QueryField BANKACCOUNTTOKEN = QueryField(fieldName: "bankAccountToken");
  static final QueryField LASTPURCHASESVIEW = QueryField(fieldName: "lastPurchasesView");
  static final QueryField STOREOWNERMODELONLINESTOREMODELID = QueryField(fieldName: "storeOwnerModelOnlineStoreModelId");
  static final QueryField STOREOWNERMODELPHYSICALSTOREMODELID = QueryField(fieldName: "storeOwnerModelPhysicalStoreModelId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StoreOwnerModel";
    modelSchemaDefinition.pluralName = "StoreOwnerModels";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: StoreOwnerModel.ONLINESTOREMODEL,
      isRequired: false,
      ofModelName: (OnlineStoreModel).toString(),
      associatedKey: OnlineStoreModel.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: StoreOwnerModel.PHYSICALSTOREMODEL,
      isRequired: false,
      ofModelName: (PhysicalStoreModel).toString(),
      associatedKey: PhysicalStoreModel.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreOwnerModel.BANKACCOUNTTOKEN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreOwnerModel.LASTPURCHASESVIEW,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreOwnerModel.STOREOWNERMODELONLINESTOREMODELID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreOwnerModel.STOREOWNERMODELPHYSICALSTOREMODELID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _StoreOwnerModelModelType extends ModelType<StoreOwnerModel> {
  const _StoreOwnerModelModelType();
  
  @override
  StoreOwnerModel fromJson(Map<String, dynamic> jsonData) {
    return StoreOwnerModel.fromJson(jsonData);
  }
}