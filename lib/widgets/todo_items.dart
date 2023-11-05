import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class todoitems extends StatelessWidget {
  final ToDo todo;
  final ontodochanged;
  final ondeleteitem;
  const todoitems({super.key,required this.todo,required this.ontodochanged,required this.ondeleteitem});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(onTap: (){
  ontodochanged(todo);
    },

    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20) ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    tileColor: Colors.white,
    leading: Icon(todo.isDone? Icons.check_box:Icons.check_box_outline_blank ,color: tdBlue, ),
    title: Text(todo.todoText!,style: TextStyle(fontSize: 16,color: tdBlack,
    
    decoration:todo.isDone? TextDecoration.lineThrough:null), ),
    trailing: Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 0),
      height: 35,width: 35,decoration: BoxDecoration(color: tdRed,borderRadius: BorderRadius.circular(10)),
    child:IconButton(
      color: Colors.white,
      iconSize: 15,
      onPressed: (){ ondeleteitem(todo.id);}, icon:Icon(Icons.delete) ,),
    ),)) ;
  }
}