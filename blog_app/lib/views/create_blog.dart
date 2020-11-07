import 'dart:io';

import 'package:blog_app/services/crud.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;
  File _selectedImage;
  final picker = ImagePicker();

  CrudMethods crudMethods = new CrudMethods();

  Future<void> getImage() async {
    final image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(image != null){
        _selectedImage = File(image.path);
      } else {
        print('No image selected');
      }

    });
  }

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
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.file_upload),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: _selectedImage != null
                  ? Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Image.file(_selectedImage),
              )
                  : Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.add_a_photo, color: Colors.black45,),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    onChanged: (val){
                      authorName = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (val){
                      title = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (val){
                      desc = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

