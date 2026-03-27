import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

   List<Task> tasks = [
    Task(title: "Zjesc pizze", deadline: "jutro", done: false, priority: "średni"),
    Task(title: "Pobiegać", deadline: "dzisiaj", done: true, priority: "wysoki"),
    Task(title: "Kupić nowe buty", deadline: "w tym tygodniu", done: false, priority: "średni"),
    Task(title: "Dom", deadline: "2035", done: false, priority: "niski")
  ];




  @override
  Widget build(BuildContext context) {
    int doneCount = tasks.where((t) => t.done).length;

    return MaterialApp(

        home:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Masz dziś ${tasks.length} zadania (Wykonane: $doneCount)"),
            SizedBox(height: 16),
            Text("Dzisiejsze zadania"),
            Expanded(child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index){
               final task = tasks[index];
               return TaskCard( title: task.title,
                                subtitle: "${task.deadline} | Priorytet: ${task.priority}",
                                icon: task.done ? Icons.check_circle : Icons.radio_button_unchecked);
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
  final String priority;

  Task({required this.title, required this.deadline, required this.done, required this.priority});
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
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
            icon, color: icon == Icons.check_circle ? Colors.green : Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
