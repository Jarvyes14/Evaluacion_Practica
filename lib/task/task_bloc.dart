import 'task_event.dart';
import 'task_state.dart';
import 'task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> _tasks = [];

  TaskBloc() : super(TaskInitial()) {
    on<AddTask>((event, emit) {
      _tasks.add(event.task);
      emit(TaskLoaded(List.from(_tasks)));
    });

    on<RemoveTask>((event, emit) {
      _tasks.removeWhere((task) => task.id == event.id);
      emit(TaskLoaded(List.from(_tasks)));
    });

    on<ToggleTask>((event, emit) {
      _tasks = _tasks.map((task) {
        if (task.id == event.id) {
          return task.copyWith(completed: !task.completed);
        }
        return task;
      }).toList();
      emit(TaskLoaded(List.from(_tasks)));
    });
  }
}