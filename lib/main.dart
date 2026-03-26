import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

   List<Task> tasks = [
    Task(title: "Zjesc pizze", deadline: "jutro"),
    Task(title: "Pobiegać", deadline: "dzisiaj"),
    Task(title: "Kupić nowe buty", deadline: "w tym tygodniu"),
    Task(title: "Dom", deadline: "2035")
  ];




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',

        home:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Masz dziś ${tasks.length} zadania"),
            SizedBox(height: 16),
            Text("Dzisiejsze zadania"),
            Expanded(child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index){
               return TaskCard( title: tasks[index].title,
                                subtitle: tasks[index].deadline,
                                icon: tasks[index].icon);
            }))
          ],
        )
    );
  }
}
class Task {
  final String title;
  final String deadline;
  final bool done;
  IconData icon = Icons.one_x_mobiledata_rounded;
  Task({required this.title, required this.deadline, required this.done});
}
class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  
  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
