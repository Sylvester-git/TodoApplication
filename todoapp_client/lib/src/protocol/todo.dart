/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Todo implements _i1.SerializableModel {
  Todo._({
    this.id,
    required this.title,
    required this.description,
    required this.isCompltetd,
    required this.userID,
  });

  factory Todo({
    int? id,
    required String title,
    required String description,
    required bool isCompltetd,
    required int userID,
  }) = _TodoImpl;

  factory Todo.fromJson(Map<String, dynamic> jsonSerialization) {
    return Todo(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      isCompltetd: jsonSerialization['isCompltetd'] as bool,
      userID: jsonSerialization['userID'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  bool isCompltetd;

  int userID;

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompltetd,
    int? userID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'isCompltetd': isCompltetd,
      'userID': userID,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TodoImpl extends Todo {
  _TodoImpl({
    int? id,
    required String title,
    required String description,
    required bool isCompltetd,
    required int userID,
  }) : super._(
          id: id,
          title: title,
          description: description,
          isCompltetd: isCompltetd,
          userID: userID,
        );

  @override
  Todo copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    bool? isCompltetd,
    int? userID,
  }) {
    return Todo(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompltetd: isCompltetd ?? this.isCompltetd,
      userID: userID ?? this.userID,
    );
  }
}
