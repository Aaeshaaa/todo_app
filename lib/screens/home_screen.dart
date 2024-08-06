import 'package:flutter/material.dart';
import 'package:todo/controller/todo_controller.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('gggg');
    return  Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xff9395D3),
        title: Text(
          "TODO APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todolist.length,

        itemBuilder: (context,index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         todolist[index]['title'],
                        style: TextStyle(
                            color: Color(0xff9395D3),
                            fontWeight: FontWeight.bold),

                      ),
                      Text(
                        todolist[index]['subtitle'],

                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder:(context) => EditTodoScreen(
                            initialTitle: todolist[index]['title'],
                            initialSubtitle:   todolist[index]['subtitle'],
                            onEdit: (title, subtitle) {
                              edittodo(title, subtitle,index);
                              setState(() {

                              });
                            },

                          )));

                    },






                  child: Icon(Icons.mode_edit_outline)),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      deletetodo(index);
                      setState(() {

                      });
                    },
                      child: Icon(Icons.delete)),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                      onTap: () {
                        completetodo(todolist[index],index);
                        setState(() {
                          
                        });


                      },
                      child: Icon(Icons.check)),
                ],
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoScreen(
                onAdd: (title, subtitle) {
                  // _addTodo(task, subTask);
                },
              ),
            ),
          ).then((value) {
            setState(() {
              
            });
          },);
        },

        backgroundColor: Color(0xff9395D3),
        child: Icon(Icons.add,color: Colors.white),
        shape: CircleBorder(),

      ),
    );
  }
}
