
List todolist = [];
List completedlist = [];

void addtodo(String title,String subtitle) {
  Map todo = {
    'title': title, 'subtitle': subtitle
  };

  todolist.add(todo);
  print (todolist);
}

void deletetodo(int index){
  todolist.removeAt(index);
}
void edittodo(String title,String subtitle,int index) {
  Map todo = {
    'title': title,
    'subtitle': subtitle
  };

  todolist[index] = todo;
}
void completetodo(Map todo,int index) {

  completedlist.add(todo);
  todolist.removeAt(index);



}

void deletecompletedtodo(int index){
  completedlist.removeAt(index);
}


