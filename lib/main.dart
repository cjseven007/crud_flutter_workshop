import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> taskList = ["Wash Clothes", "Do homework", "Swimming"];

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lester"),
          backgroundColor: Colors.yellow[800],
        ),
        body: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 3)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(taskList[index]),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  taskList[index] = taskController.text;
                                });
                              },
                              child: Text("Edit")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  taskList.removeAt(index);
                                });
                              },
                              child: Text("Delete"))
                        ],
                      )),
                );
              },
              itemCount: taskList.length,
            ),
            TextField(
              controller: taskController,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    taskList.add(taskController.text);
                  });
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
