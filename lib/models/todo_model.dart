// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String id;
  String task;
  String description;
  bool? isCompleted;
  bool? isCancelled;
  Todo({
    required this.id,
    required this.task,
    required this.description,
    this.isCompleted,
    this.isCancelled,
  });

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    bool? isCompleted,
    bool? isCancelled,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'description': description,
      'isCompleted': isCompleted,
      'isCancelled': isCancelled,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      task: map['task'] as String,
      description: map['description'] as String,
      isCompleted:
          map['isCompleted'] != null ? map['isCompleted'] as bool : null,
      isCancelled:
          map['isCancelled'] != null ? map['isCancelled'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        task,
        description,
        isCompleted,
        isCancelled,
      ];

  static List<Todo> todo = [
    Todo(
      id: '1',
      task: 'first task',
      description: 'first desc',
    ),
    Todo(
      id: '2',
      task: 'second task',
      description: 'second desc',
    ),
  ];
}
