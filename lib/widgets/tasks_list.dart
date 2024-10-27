import 'package:bloc_todo/blocs/bloc_exports.dart';
import 'package:bloc_todo/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
    });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context, index){
                var task = tasksList[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value){
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    },
                    ),
                );
              }),
          );
  }
}