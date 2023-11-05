import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart'; // Make sure the colors are defined in this file
import '../model/todo.dart';
import '../widgets/todo_items.dart'; // Make sure the colors are defined in this file

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final todosList=ToDo.todoList();
List<ToDo>_foundToDo=[];
final _todocontroller=TextEditingController();
@override
  void initState() {
_foundToDo=todosList;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor, // Assuming this is defined in the imported file
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                
            searchbox(),
           Expanded(child: ListView(
            children: [
              
              todo_heading(),
for (ToDo todo in _foundToDo.reversed)                       
                 todoitems(todo: todo,ontodochanged: _handletodochange,ondeleteitem: _deletetodoitem,),


            ],
           ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
Expanded(child: Container(margin: EdgeInsets.only(bottom: 20,right: 20, left: 20),
padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
decoration: BoxDecoration(
  color: Colors.white,
  boxShadow:const[ BoxShadow(color: Colors.grey,offset: Offset(0.0, 0.0),blurRadius: 10.0,spreadRadius: 0.0)],
  borderRadius: BorderRadius.circular(10)
),
child: TextField(
  controller: _todocontroller,
  decoration: InputDecoration(hintText: 'add a task',border: InputBorder.none),),
)),
Container(
  margin: EdgeInsets.only(bottom: 20,right: 20),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(primary: tdBlue,minimumSize:Size(50, 50),elevation: 10),
    onPressed: (){_addToDoitem(_todocontroller.text);}, child:Text('+',style: TextStyle(fontSize: 40),
    )),
)

            ],),
          )
        ],
      ),
    );
  }

  Container todo_heading() {
    return Container(
          margin: EdgeInsets.only(top: 50,bottom: 20),
          child: Text('To Dos',style: TextStyle(fontSize: 30,fontWeight:FontWeight.w500,),),
        );
  }
void _handletodochange(ToDo todo){
setState(() {
    todo.isDone=!todo.isDone;

});
}
void _deletetodoitem(String id ){
  setState(() {
    todosList.removeWhere((item) => item.id==id);

  });
}
void _addToDoitem(String toDo){
setState(() {
  todosList.add(ToDo(id:DateTime.now().millisecond.toString(),todoText:toDo));

});
_todocontroller.clear();
}
void _runfilter(String Enteredkeyword){
List<ToDo>results=[];
if(Enteredkeyword.isEmpty){

  results=todosList;
}else{
  results=todosList.where((item) => item.todoText!.toLowerCase().contains(Enteredkeyword.toLowerCase())).toList();
}
setState(() {
  _foundToDo=results;
});
}
Widget searchbox(){
     return Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                 
              ),
              child: TextField( 
                onChanged:(value)=> _runfilter(value),
decoration: InputDecoration(
    prefixIconConstraints: BoxConstraints(maxHeight: 20,),
    border: InputBorder.none,
    hintText: 'Search',
   hintStyle:TextStyle(color: tdGrey),
  contentPadding: EdgeInsets.all(0),
  prefixIcon:Icon(Icons.search,color: tdBlack,
  size: 20,)

),


              ), // Removed 'const' since BoxDecoration is not a const
            );
}

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor, // Assuming this is defined in the imported file
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.menu,
            color: tdBlack, // Assuming this is defined in the imported file
            size: 30,
          ),
        ],
      ),
    );
  }
}
