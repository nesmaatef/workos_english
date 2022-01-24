// @dart=2.9

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key key}) : super(key: key);

  @override
  _forgetpasswordState createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  TextEditingController _forgetpasscontroller = TextEditingController(text: '');
  final _forgetformkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    _forgetpasscontroller.dispose();

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

  void _submitFormOnforgetpassword() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(children: [
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
                'Forget Password',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'email address',
                style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _forgetformkey,
                child: TextField(
                  controller: _forgetpasscontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              MaterialButton(
                onPressed: () {
                  // _submitFormOnLogin();
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
                      Text('Reset Password',
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
        ]),
      ),
    );
  }
}
