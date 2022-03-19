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

/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String title;
  final bool? isDone;
  final TemporalDateTime? createdAt;
  final TemporalDateTime? updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Todo._internal(
      {required this.id,
      required this.title,
      this.isDone,
      this.createdAt,
      this.updatedAt});

  factory Todo({String? id, required String title, bool? isDone}) {
    return Todo._internal(
        id: id == null ? UUID.getUUID() : id, title: title, isDone: isDone);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        title == other.title &&
        isDone == other.isDone;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$title" + ", ");
    buffer.write(
        "isDone=" + (isDone != null ? isDone.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (createdAt != null ? createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (updatedAt != null ? updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Todo copyWith({String? id, String? title, bool? isDone}) {
    return Todo._internal(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        isDone = json['isDone'],
        createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField ISDONE = QueryField(fieldName: "isDone");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.TITLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.ISDONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();

  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
