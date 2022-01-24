// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workos_english/widgets/drawer_widget.dart';

class User_profile extends StatefulWidget {
//  const User_profile(BuildContext context, {Key key}) : super(key: key);
  @override
  State<User_profile> createState() => _User_profileState();
}

class _User_profileState extends State<User_profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isloading = false;
  String phonenumber = "";
  String email = "";
  String name = "";
  String job = "";
  String imageurl = "";
  String joinedAt = "";
  bool issameuser = false;
  void getprofiledata() async {
    isloading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Card(
                    margin: EdgeInsets.all(30),
                    // height: 300.0,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            'Nesma atef',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Team leader science 2021-7-8',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Contact info ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Icon(
                                Icons.bookmark,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'nesma@gmail',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Phone number: ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '022251551515',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _contactBy(
                                  color: Colors.green,
                                  fct: () {},
                                  icon: Icons.message_outlined),
                              _contactBy(
                                  color: Colors.red,
                                  fct: () {},
                                  icon: Icons.mail_outline),
                              _contactBy(
                                  color: Colors.purple,
                                  fct: () {},
                                  icon: Icons.call_outlined),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.orange,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border:
                              Border.all(width: 8.0, color: Colors.blueGrey),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://static4.depositphotos.com/1000393/362/i/950/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
    );
  }

  Widget _Text(String title) {
    return Text(title);
  }

  Widget _contactBy({Color color, Function fct, IconData icon}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              icon,
              color: color,
            ),
            onPressed: () {
              fct();
            },
          )),
    );
  }
}
