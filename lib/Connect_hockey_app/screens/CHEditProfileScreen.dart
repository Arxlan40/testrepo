import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_hockey/Connect_hockey_app/User.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CHWidgets.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CWPickerScreenCountry.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CWPickerScreenLanguage.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CWPickerScreenBirthDate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CHEditProfileScreen extends StatefulWidget {
  @override
  _CHEditProfileScreenState createState() => _CHEditProfileScreenState();
}

class _CHEditProfileScreenState extends State<CHEditProfileScreen> {
  final fDb = FirebaseFirestore.instance;
  final _editformkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController goalieNumbercontroller = TextEditingController();
  final TextEditingController teamsGoaliecontroller = TextEditingController();
  String _selectedGlove = 'Left';
  String _selectedRole = 'Goalie';
  String _profilepic = '';
  String id;
  File _pickedImage;
  PickedFile pickedImageFile;
  String imageUrl;
  bool loading = false;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    try {
      fDb
          .collection('users')
          .where('email',
              isEqualTo: FirebaseAuth.instance.currentUser.email.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        print(querySnapshot.docs);
        querySnapshot.docs.forEach((doc) {
          print(doc["teamsGoalie"]);
          setState(() {
            teamsGoaliecontroller.text =
                doc["teamsGoalie"].toList().join().toString();
            firstNameController.text = doc["firstName"];
            lastNameController.text = doc["lastName"];
            goalieNumbercontroller.text = doc["goalieNumber"];
            _selectedGlove = doc["glove"] == "" ? "Left" : doc["glove"];
            _profilepic = doc["profilePicture"];
            id = doc.id;
          });
        });
      });
    } catch (e) {
      Get.log('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mInput(var mLabel, TextEditingController controller) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
        child: TextFormField(
          controller: controller,
          validator: RequiredValidator(errorText: 'This field is required'),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              isDense: true,
              hintText: mLabel,
              border: InputBorder.none),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Profile Setting', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    CircleAvatar(
                        radius: 45,
                        backgroundImage: (_pickedImage != null ||
                                pickedImageFile != null)
                            ? FileImage(_pickedImage)
                            : NetworkImage(
                                _profilepic == "" ? ch_profile : _profilepic)),
                    FittedBox(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                        decoration: boxDecorations(
                            radius: 4, bgColor: Color(0XFF313384)),
                        child: Center(
                          child: GestureDetector(
                              onTap: () =>
                                  showBottomSheetForUpdatePhoto(context),
                              child: Text('Change Profile Photo',
                                  style: boldTextStyle(
                                      size: 12, color: Colors.white))),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: boxDecorations(showShadow: true),
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(16.0),
                      child: Form(
                        key: _editformkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            mInput("FirstName", firstNameController),
                            Divider(height: 1, thickness: 1),
                            mInput("LastName", lastNameController),
                            Divider(height: 1, thickness: 1),
                            mInput("#GoalieNumber", goalieNumbercontroller),
                            Divider(height: 1, thickness: 1),
                            mInput("TeamsGoalie", teamsGoaliecontroller),
                            Divider(height: 1, thickness: 1),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _selectedGlove,
                                items: <String>['Left', 'Right']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: chTextPrimaryColor)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGlove = newValue;
                                  });
                                },
                              ),
                            ),
                            Divider(height: 1, thickness: 1),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _selectedRole,
                                items: <String>['Goalie', 'Coach', 'Both']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: chTextPrimaryColor)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedRole = newValue;
                                  });
                                },
                              ),
                            ),
                            Divider(height: 1, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 250.0,
                                  height: 90.0,
                                  child: CWPickerScreenBirthDate(),
                                ),
                              ],
                            ),
                            Divider(height: 1, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 250.0,
                                  height: 90.0,
                                  child: CWPickerScreenLanguage(),
                                ),
                              ],
                            ),
                            Divider(height: 1, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 250.0,
                                  height: 90.0,
                                  child: CWPickerScreenCountry(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
        persistentFooterButtons: <Widget>[
          loading
              ? SizedBox()
              : Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).copyWith().size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          finish(context);
                        },
                        child: Text('Cancel', style: secondaryTextStyle()),
                      ),
                      FittedBox(
                        child: GestureDetector(
                          onTap: () async {
                            if (_editformkey.currentState.validate() &&
                                birthdate != "" &&
                                country != "" &&
                                language != "") {
                              setState(() {
                                loading = true;
                              });
                              if (_pickedImage != null ||
                                  pickedImageFile != null) {
                                firebase_storage.FirebaseStorage _storage =
                                    firebase_storage.FirebaseStorage.instance;
                                firebase_storage.Reference reference =
                                    _storage.ref().child(
                                          DateTime.now().toString(),
                                        );
                                firebase_storage.UploadTask uploadTask;
                                uploadTask =
                                    reference.putFile(File(_pickedImage.path));

                                firebase_storage.TaskSnapshot taskSnapshot =
                                    await uploadTask.whenComplete(() => {});
                                imageUrl =
                                    await taskSnapshot.ref.getDownloadURL();
                              }
                              await UserFirestore().edituser(
                                firstNameController.text,
                                lastNameController.text,
                                birthdate,
                                country,
                                _selectedGlove,
                                goalieNumbercontroller.text,
                                imageUrl != null ? imageUrl : _profilepic,
                                language,
                                [teamsGoaliecontroller.text],
                                _selectedRole.length == 1
                                    ? [_selectedRole]
                                    : ['Goalie', 'Coach'],
                                id,
                              );
                              print(language + country + birthdate);

                              setState(() {
                                language = "";
                                country = "";
                                birthdate = "";
                                loading = false;
                              });
                              _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text("Profile Updated")));
                            } else {
                              print(language + country + birthdate);
                              setState(() {
                                loading = false;
                              });
                              _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content:
                                          new Text("Put all information")));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                            decoration: boxDecorations(
                                radius: 4, bgColor: Color(0XFF313384)),
                            child: Center(
                              child: Text('Save',
                                  style: boldTextStyle(
                                      size: 12, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future showBottomSheetForUpdatePhoto(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Wrap(children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update account photo",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ).paddingBottom(10),
                createBasicListTile(
                        text: "Choose from gallery",
                        icon: Icons.my_library_books_outlined)
                    .onTap(() async {
                  pickedImageFile =
                      (await _picker.getImage(source: ImageSource.gallery));
                  setState(() {
                    _pickedImage = File(pickedImageFile.path);
                  });
                  finish(context);
                }),
                createBasicListTile(
                        text: "Use Camera", icon: Icons.photo_album_rounded)
                    .onTap(() async {
                  pickedImageFile =
                      (await _picker.getImage(source: ImageSource.camera));
                  setState(() {
                    _pickedImage = File(pickedImageFile.path);
                  });
                  finish(context);
                }),
              ],
            ).paddingAll(10),
          ),
        ]);
      },
    );
  }
}
