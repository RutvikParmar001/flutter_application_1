import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test_Page1 extends StatefulWidget {
  const Test_Page1({Key? key}) : super(key: key);

  @override
  State<Test_Page1> createState() => _Test_Page1State();
}

class _Test_Page1State extends State<Test_Page1> {
  // late String imag url;
  File? _iamge;
  final iamgePicker = ImagePicker();

  //? Image Picker
  Future imagepicker() async {
    //Picking the file

    final pick = await iamgePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _iamge = File(pick.path);
      } else {
        //*snakbar with error
        showSnakBar("No file selected", Duration(milliseconds: 400));
      }
    });
  }

  //* create snakbar for showing error

  showSnakBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Future uplodeImage()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ClipRect(
            child: SizedBox(
                height: 400,
                width: 500,
                child: Column(
                  children: [
                    Text("Uplode Image"),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red),
                          // color: Colors.red,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: _iamge == null
                                      ? const Center(
                                          child: Text("no Image seleced"),
                                        )
                                      : Image.file(_iamge!)),
                              ElevatedButton(
                                  onPressed: () {
                                    imagepicker();
                                  },
                                  child: Text("Select Image")),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Uplode Image"))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
    // body: Column(children: <Widget>[()],),
  }
}
