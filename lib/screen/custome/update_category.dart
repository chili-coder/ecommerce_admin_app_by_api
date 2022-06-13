import 'dart:convert';
import 'dart:math';
import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/categorymodel.dart';
import 'package:ecommerce_admin_app_by_api/provider/catagoryprovider.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin_app_by_api/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class UpdateCategory extends StatefulWidget {
   UpdateCategory({Key? key,this.categoryModel}) : super(key: key);
  CategoryModel ? categoryModel;
  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController(text: widget.categoryModel!.name);
    super.initState();
  }

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

  Future editCategory() async {
    setState(() {
      onProgress = true;
    });
    final uri = Uri.parse(
        "https://apihomechef.antopolis.xyz/api/admin/category/${widget.categoryModel!.id}/update");
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
      print('processing');
      request.files.add(_icon);
    }
    var response = await request.send();
    print("${response.statusCode}");

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var data = jsonDecode(responseString);
    if (response.statusCode == 200) {
      print("responseBody1 $responseData");
      print(data['message']);
      setState(() {
        onProgress = false;
      });
      showInToast(data['message']);
      Provider.of<CategoryProvider>(context, listen: false).getCategory();
      Navigator.pop(context);
      print("${response.statusCode}");
    } else {
      print("responseBody1 $responseString");
      print(data['errors']['image'][0]);
      showInToast(data["errors"]['image'][0]);
      setState(() {
        onProgress = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: onProgress == true,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
          appBar: AppBar(),
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
                        child: Image.network(
                            "https://apihomechef.antopolis.xyz/images/${widget.categoryModel!.icon}"))
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
                        child: Image.network(
                            "https://apihomechef.antopolis.xyz/images/${widget.categoryModel!.image}",fit: BoxFit.cover,))
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
                      editCategory();
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
