// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_collection_literals

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff2B2d2D),
          scaffoldBackgroundColor: Color(0xff2B2D2D)),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List todo = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text('NOTES APP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 4)),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.red[500],
            size: 40,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext Context) {
                  return AlertDialog(
                    backgroundColor: Color(0xffF48C8C),
                    title: Text("Add Todo's"),
                    content: TextField(
                      decoration: InputDecoration(hintText: "ToDo's"),
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            todo.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ADD',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  );
                });
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(todo[index]),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        title: Text(
                          todo[index],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_forever_rounded,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              todo.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
