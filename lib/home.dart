import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override



  var output = "";
  List<dynamic> list=[1,2,3];


  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
        return Container(
          height: 50,
          color: Colors.red,
          margin: EdgeInsets.only(top:15),
          child: ListTile(
          title: Text("${list[index]}"),
          trailing:  Container(
            width: 50,
            child: Row(
              children: [
                GestureDetector(onTap:(){
                  showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("EDIT ITEM"),
            content: TextField(
              onChanged: (value){
                output = value;
              }
            ),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  list.replaceRange(index, index+1, {output});
                });
                Navigator.of(context).pop();
              }, child: Text("EDIT"))
            ],
          );
      });
                       setState(() {
                         list.remove(index);
                       });
                      }
, child: Icon(Icons.edit, color: Colors.blue,)),
                GestureDetector(onTap:(){
                       setState(() {

                         list.remove(index);
                       });
                      }
, child: Icon(Icons.delete, color: Colors.blue,)),
              ],
            ),
          ),
              ),
  
        );
      }),
      floatingActionButton:FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("ADD ITEM"),
            content: TextField(
              onChanged: (value){
                output = value;
              }
            ),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  list.add(output);
                });
                Navigator.of(context).pop();
              }, child: Text("ADD"))
            ],
          );
      });
  },child: Text("ADD"),
    ));
  }
}