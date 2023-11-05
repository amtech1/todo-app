class ToDo {
  String? id;
  String todoText; // `todoText` is no longer nullable
  bool isDone;

  // Named parameters are now required for `id` and `todoText`.
  ToDo({required this.id, required this.todoText, this.isDone = false});
  static List <ToDo> todoList(){
    return[
      
      ToDo(id: '2', todoText: 'raita laike ao',isDone: true),
      ToDo(id: '3', todoText: 'raita bechkre ao',isDone: true),
      ToDo(id: '4', todoText: 'raita phenk ao',)
      ];
  }
}
