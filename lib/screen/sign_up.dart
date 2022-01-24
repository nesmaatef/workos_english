// @dart=2.9
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key key}) : super(key: key);

  @override
  sign_upState createState() => sign_upState();
}

class sign_upState extends State<sign_up> with TickerProviderStateMixin {
  List<String> companypositionlist = [
    'manager',
    'employee',
    'it engineer',
    'worker',
    'graphic designer',
  ];
  List<String> cameradialoglist = [
    'camera',
    'gallary',
  ];
  File imagefile;
  AnimationController _animationController;
  Animation<double> _animation;
  TextEditingController _emailcontroller = TextEditingController(text: '');
  TextEditingController _phonecontroller = TextEditingController(text: '');
  TextEditingController _passcontroller = TextEditingController(text: '');
  TextEditingController _namecontroller = TextEditingController(text: '');
  TextEditingController _companycontroller = TextEditingController(text: '');
  bool _obscureText = true;
  bool isloading = false;
  final _signupformkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String imageurl;
  @override
  void dispose() {
    _animationController.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _namecontroller.dispose();
    _companycontroller.dispose();
    _phonecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();

    // TODO: implement initState
    super.initState();
  }

  void _submitFormOnsignup() async {
    final isvalid = _signupformkey.currentState.validate();
    if (isvalid) {
      if (imagefile == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("please pickup image"),
        ));
        return;
      }
      setState(() {
        isloading = true;
      });
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailcontroller.text.trim().toLowerCase(),
            password: _passcontroller.text.trim());
        final User user = _auth.currentUser;
        final uid = user.uid;
        final ref = FirebaseStorage.instance
            .ref()
            .child('userImage')
            .child(uid + '.jpg');
        await ref.putFile(imagefile);
        imageurl = await ref.getDownloadURL();
        FirebaseFirestore.instance.collection('Users').doc(uid).set({
          'id': uid,
          'name': _namecontroller.text,
          'email': _emailcontroller.text,
          'createdAt': Timestamp.now(),
          'phone': _phonecontroller.text,
          'image': '',
          'companyposition': _companycontroller.text,
        });
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      } catch (errrror) {
        setState(() {
          isloading = false;
        });
        print('error occure $errrror');
      }
    }

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZGFyayUyMGxhcHRvcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
              placeholder: (context, url) =>
                  Image.asset('lib/assets/images/nesma.jpg', fit: BoxFit.fill),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            ListView(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
                SizedBox(height: 10.0),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Already have an account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  TextSpan(text: '     '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {Navigator.pop(context)},
                    text: 'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline),
                  )
                ])),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: _signupformkey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _namecontroller,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "please enter your name";
                                else
                                  return null;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Full name',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Stack(children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  width: size.width * 0.24,
                                  height: size.width * 0.24,
                                  // color: Colors.deepOrange,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white70,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: imagefile == null
                                        ? Image.network(
                                            'https://static4.depositphotos.com/1000393/362/i/950/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg',
                                            fit: BoxFit.fill,
                                          )
                                        : Image.file(
                                            imagefile,
                                            fit: BoxFit.fill,
                                          ),
                                  )),
                            ),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: InkWell(
                                onTap: () {
                                  _show_camera_dialog(size: size);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white70,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      imagefile == null
                                          ? Icons.add_a_photo
                                          : Icons.edit_outlined,
                                      color: Colors.white70,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,
                        validator: (value) {
                          if (value.isEmpty || !value.contains("@"))
                            return "please enter your valid email";
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passcontroller,
                        validator: (value) {
                          if (value.isEmpty || value.length < 7)
                            return "please enter valid password";
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        onTap: () {
                          _showtaskcategorydialog(size: size);
                        },
                        keyboardType: TextInputType.name,
                        controller: _companycontroller,
                        validator: (value) {
                          if (value.isEmpty)
                            return "please enter your company";
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'company position ',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phonecontroller,
                        validator: (value) {
                          if (value.isEmpty)
                            return "please enter your phone";
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'phone number ',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                isloading
                    ? Center(
                        child: Container(
                          width: 70.0,
                          height: 70.0,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : MaterialButton(
                        onPressed: () {
                          _submitFormOnsignup();
                        },
                        color: Colors.teal,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontStyle: FontStyle.italic)),
                              SizedBox(
                                width: 15.0,
                              ),
                              Icon(
                                Icons.person_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showtaskcategorydialog({Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              'company position Category',
              style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: companypositionlist.length,
                  itemBuilder: (ctxx, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _companycontroller.text = companypositionlist[index];
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.redAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              companypositionlist[index],
                              style: TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Close'),
              ),
            ],
          );
        });
  }

  _show_camera_dialog({Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              'choose camera option',
              style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () {
                    getimagefromcamera();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cameradialoglist[0],
                          style: TextStyle(
                              fontSize: 16.0, fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    getimagefromgallary();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cameradialoglist[1],
                          style: TextStyle(
                              fontSize: 16.0, fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void getimagefromcamera() async {
    PickedFile pickedfile = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    cropImage(pickedfile.path);
    Navigator.pop(context);
  }

  void getimagefromgallary() async {
    PickedFile pickedfile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    cropImage(pickedfile.path);
    Navigator.pop(context);
  }

  void cropImage(filepath) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: filepath, maxWidth: 1080, maxHeight: 1080);
    if (croppedImage != null) {
      setState(() {
        imagefile = croppedImage;
      });
    }
  }
}
