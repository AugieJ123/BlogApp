import 'package:blog_app/views/create_blog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter", style: TextStyle(fontSize: 22),),
            Text("Blog", style: TextStyle(fontSize: 22, color: Colors.blue),),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
