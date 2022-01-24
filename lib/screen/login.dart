// @dart=2.9
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workos_english/screen/forgetpassword.dart';
import 'package:workos_english/screen/sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AnimationController _animationController;
  Animation<double> _animation;
  TextEditingController _emailcontroller = TextEditingController(text: '');
  TextEditingController _passcontroller = TextEditingController(text: '');
  bool _obscureText = true;
  final _loginformkey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void dispose() {
    _animationController.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
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

  void _submitFormOnLogin() async {
    final isvalid = _loginformkey.currentState.validate();
    if (isvalid) {
      setState(() {
        isloading = true;
      });
      try {
        await _auth.signInWithEmailAndPassword(
            email: _emailcontroller.text.trim().toLowerCase(),
            password: _passcontroller.text.trim());
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
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
                SizedBox(height: 10.0),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Do not have an account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  TextSpan(text: '     '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sign_up()),
                        );
                      },
                    text: 'Regist here',
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
                  key: _loginformkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,
                        validator: (value) {
                          if (value.isEmpty || !value.contains("@"))
                            return "please enter valid email";
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgetpassword()),
                      );
                    },
                    child: Text(
                      'Forget password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    _submitFormOnLogin();
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
                        Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic)),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.login,
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
}
