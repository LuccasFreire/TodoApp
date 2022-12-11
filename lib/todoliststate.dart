import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/todo.dart';

class _TodoListState extends State<TodoList> {
  List<Todo> tasklist = [];
  // final List<Todolist> _todos = <Todo>[];

  //final TextEditingController _textFieldController = TextEditingController();
  TextEditingController textController = TextEditingController();
  String name = "";

  @override

  Widget build(BuildContext context) {
    // app layout
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [Padding(padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: textController,
                        maxLines: null,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Insert the task",
                            prefixIcon: Icon(Icons.library_add)
                        ),
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50))
                            ,onPressed: () {
                            setState(() {
                              var displayText = textController.text;
                              tasklist.add(Todo(taskname: displayText,checked: false));
                              for(int i = 0; i < tasklist.length;i++){
                                for(int j = 0; j <(tasklist.length -1 );j++){
                                  if(tasklist[j].checked == true && tasklist[j + 1].checked == false){
                                    Todo  auxiliar = tasklist[j];
                                    tasklist[j] = tasklist[j+1];
                                    tasklist[j + 1] = auxiliar;
                                  }
                                }
                              }
                            });
                          }, child: Text("Submit task"),),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      width: 400,
                      child: ListView.builder(

                        itemCount: tasklist.length,
                        itemBuilder: (BuildContext context, int index){
                          final item = tasklist[index];
                          return Card(
                            child: Container(
                              child: Column(
                                children: [
                                  CheckboxListTile(
                                    title: Text(item.taskname!),
                                    key: Key(item.taskname),
                                    value: item.checked,
                                    onChanged: (value){
                                      setState(() {
                                        item.checked = value!;
                                        for(int i = 0; i < tasklist.length;i++){
                                          for(int j = 0; j <(tasklist.length -1 );j++){
                                            if(tasklist[j].checked == true && tasklist[j + 1].checked == false){
                                              Todo  auxiliar = tasklist[j];
                                              tasklist[j] = tasklist[j+1];
                                              tasklist[j + 1] = auxiliar;
                                            }
                                          }
                                        }

                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          );
                        },
                      ),
                    )

                  ],
                ),)],

              )
            )


          ],

        )

      )
    );
  }
}
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}
