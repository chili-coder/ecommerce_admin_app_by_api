import 'dart:convert';
import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/categorymodel.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin_app_by_api/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class AddCeragory extends StatefulWidget {
  const AddCeragory({Key? key}) : super(key: key);

  @override
  State<AddCeragory> createState() => _AddCeragoryState();
}

class _AddCeragoryState extends State<AddCeragory> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  File? icon, image;
  final picker = ImagePicker();

  Future getIconformGallery() async {
    print('on the way of gallery');
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        icon = File(pickedImage.path);
        print('image found');
        print('$icon');
      } else {
        print('no image found');
      }
    });
  }

  Future getImageformGallery() async {
    print('on the way of gallery');
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        print('image found');
        print('$image');
      } else {
        print('no image found');
      }
    });
  }

  bool onProgress = false;

  Future addCategory() async {
    setState(() {
      onProgress = true;
    });
    final uri =
    Uri.parse("https://apihomechef.antopolis.xyz/api/admin/category/store");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(
      await CustomHttpRequest().getHeaderWithToken(),
    );
    request.fields['name'] = nameController.text.toString();
    if (image != null) {
      var photo = await http.MultipartFile.fromPath('image', image!.path);
      print('processing');
      request.files.add(photo);
    }
    if (icon != null) {
      var _icon = await http.MultipartFile.fromPath('icon', icon!.path);
      request.files.add(_icon);
    }
    var response = await request.send();


    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var data = jsonDecode(responseString);

    if (response.statusCode == 201) {

      setState(() {
        onProgress = false;
      });
      showInToast(data['message']);
      Navigator.pop(context);
    } else {

      showInToast(data["errors"]['image'][0]);
      setState(() {
        onProgress = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: onProgress == true,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Add New Cetagory"),
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                TextFormField(
                autofocus: false,
                controller: nameController,
                decoration: buildInputDecoration("Name", Icons.abc),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Choose category Icon"),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: icon == null
                        ? InkWell(
                      onTap: () {
                        getIconformGallery();
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.teal.withOpacity(0.3),
                              size: 40,
                            ),
                            Text(
                              "UPLOAD",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(icon!),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Choose category Image"),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: image == null
                        ? InkWell(
                      onTap: () {
                        getImageformGallery();
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.teal.withOpacity(0.3),
                              size: 40,
                            ),
                            Text(
                              "UPLOAD",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(image!),
                          )),
                    ),
                  ),
                  SizedBox(height: 40,),

                  RawMaterialButton(
                    onPressed: () {
                      addCategory();
                    },
                    elevation: 2.0,
                    fillColor: Colors.teal,
                    child: Icon(
                      Icons.cloud_upload_rounded,color: Colors.white,
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),



    );
  }
}
