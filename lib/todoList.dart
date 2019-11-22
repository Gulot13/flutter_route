import 'package:flutter/material.dart';
class TodoList extends StatefulWidget{
  @override
  createState() => new TodoListState();
}

class Task {

	int _id;
	String _description;

	Task(this._description);

	Task.withId(this._id, this._description);

	int get id => _id;

	String get description => _description;

	set description(String newDescription) {
		if (newDescription.length <= 255) {
			this._description = newDescription;
		}
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['description'] = _description;
		return map;
	}

	// Extract a Note object from a Map object
	Task.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._description = map['description'];
	}
}

class TodoListState extends State<TodoList>{
  List<String> _todoItems = [];

  void _addTodoItem(String task){
    if(task.length > 0){
      setState(() {
       _todoItems.add(task);
      }); // peut aussi s'écrire setState(() => _todoItems.add(task));
    }
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index){
        if (index < _todoItems.length){
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int i){
    return new ListTile(
      title: new Text(todoText),
      onTap: () => _promptRemoveTodoItem(i),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo list'),
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'add task',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Ajoutes une nouvelle tache'),
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                hintText: 'Entrez une tache a faire...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            ),
          );
        }
      )
    );
  }

  // Pour remove les taches
   void _removeTodoItem(int index){
     setState(() {
      _todoItems.removeAt(index);
     });
   }

   void _promptRemoveTodoItem(int index){
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return new AlertDialog(
           title: new Text('Tu a terminé "${_todoItems[index]}"'),
           actions: <Widget>[
             new FlatButton(
               child: new Text('ANNULER'),
               onPressed: () => Navigator.of(context).pop()
             ),
             new FlatButton(
               child: new Text('TERMINER'),
               onPressed: () {
                 _removeTodoItem(index);
                 Navigator.of(context).pop();
               },
             )
           ],
         );
       }
     );
   }
}