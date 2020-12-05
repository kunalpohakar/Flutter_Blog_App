import 'dart:io';
import 'package:blog_app/services/crud.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorname, title, description;

  File _image;
  CrudMethods crudMethods = CrudMethods();

// This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Blog",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print("Upload Image ");
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.upload_sharp)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              padding: EdgeInsets.only(left: 16, right: 16),
              color: Colors.transparent,
              splashColor: Colors.greenAccent,
              animationDuration: Duration(seconds: 2),
              onPressed: () {
                _pickImageFromGallery();
              },
              child: _image != null
                  ? Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.cyanAccent,
                      ),
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    onChanged: (value) {
                      authorname = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (value) {
                      description = value;
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
