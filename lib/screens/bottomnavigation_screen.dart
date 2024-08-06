import 'package:flutter/material.dart';
import 'package:todo/screens/completed_screen.dart';
import 'package:todo/screens/home_screen.dart';

class BottomnavigationScreen extends StatefulWidget {
  const BottomnavigationScreen({super.key});

  @override
  State<BottomnavigationScreen> createState() => _BottomnavigationScreenState();
}

class _BottomnavigationScreenState extends State<BottomnavigationScreen> {
  List pages = [HomeScreen(), CompletedScreen()];

  void pagechanged(int pageindex) {
    currentpage =pageindex;
    setState(() {

    });
  }

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          pagechanged(value);

        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
