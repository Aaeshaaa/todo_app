import 'package:flutter/material.dart';
import 'package:todo/controller/todo_controller.dart';

// import 'add_screen.dart';
// import 'edit_screen.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreen();
}

class _CompletedScreen extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    print('gggg');
    print(completedlist);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9395D3),
        title: Text(
          "Completed Tasks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.check_box,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        height: 600,
        child: ListView.builder(
            itemCount: completedlist.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    leading:  Text(completedlist[index]['title']),
                    // subtitle: Text(completedlist[index]['subtitle']),
                    trailing:  GestureDetector(
                      onTap: () {
                        deletecompletedtodo(index);
                        setState(() {

                        });
                      },
                        child: Icon(Icons.delete,color: Colors.red,)),
                  )
                ),
              );
            }),
      ),

    );
  }
}
