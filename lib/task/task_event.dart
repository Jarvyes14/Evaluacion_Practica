import 'task_model.dart';

abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class RemoveTask extends TaskEvent {
  final String id;
  RemoveTask(this.id);
}

class ToggleTask extends TaskEvent {
  final String id;
  ToggleTask(this.id);
}