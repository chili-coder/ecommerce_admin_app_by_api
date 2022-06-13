import 'dart:convert';
import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin_app_by_api/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController qualityController = TextEditingController();
  TextEditingController orginalpriceController = TextEditingController();
  TextEditingController dispriceController = TextEditingController();
  TextEditingController distypeController = TextEditingController();
  TextEditingController percentofController = TextEditingController();
   File? icon, image;
  final picker = ImagePicker();


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

  Future addProduct() async {
    setState(() {
      onProgress = true;
    });
    final uri =
    Uri.parse("https://apihomechef.antopolis.xyz/api/admin/product/store");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(
      await CustomHttpRequest().getHeaderWithToken(),
    );
    request.fields['name'] = nameController.text.toString();
    request.fields['category_id'] = idController.text.toString();
    request.fields['quantity'] = qualityController.text.toString();
    request.fields['original_price'] = orginalpriceController.text.toString();
    request.fields['discounted_price'] = dispriceController.text.toString();
    request.fields['discount_type'] = distypeController.text.toString();
    request.fields['percent_of'] = percentofController.text.toString();
    if (image != null) {
      var photo = await http.MultipartFile.fromPath('image', image!.path);
      print('processing');
      request.files.add(photo);
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
            title: Text("Add New Product"),
            backgroundColor: Colors.teal,
          ),
///name, image, category_id, quantity, original_price, discounted_price, discount_type, percent_of, fixed_value
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      autofocus: false,
                     controller: nameController,
                      decoration: buildInputDecoration("Name", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                      controller: idController,
                      decoration: buildInputDecoration("category id", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                       controller: qualityController,
                      decoration: buildInputDecoration("Quantity", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                      controller: orginalpriceController,
                      decoration: buildInputDecoration("Original Price", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                      controller: dispriceController,
                      decoration: buildInputDecoration("Discounted Price", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                       controller: distypeController,
                      decoration: buildInputDecoration("Discount Type", Icons.start),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                      controller: percentofController,
                      decoration: buildInputDecoration("percent_of", Icons.percent_sharp),
                    ),
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Choose Image"),
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ), child: image == null
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
                      addProduct();
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
      ),
    );
  }
}
