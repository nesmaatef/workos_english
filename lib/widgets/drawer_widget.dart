// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workos_english/screen/Add_task_screen.dart';
import 'package:workos_english/screen/All_workers.dart';
import 'package:workos_english/screen/tasks.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.network(
                      'https://image.shutterstock.com/image-vector/work-home-concept-design-freelance-260nw-1680624523.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Text(
                    'Work os English',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          _listtiles(
              icon: Icons.task,
              title: 'All tasks',
              open: () {
                _navigatetoalltasks(context);
              }),
          _listtiles(
              icon: Icons.task,
              title: 'All workers',
              open: () {
                _navigatetoallworkers(context);
              }),
          _listtiles(
              icon: Icons.settings_outlined,
              title: 'My Account',
              open: () {
                _showtaskcategorydialog(context);
              }),
          _listtiles(
              icon: Icons.workspaces_outline,
              title: 'Registered works',
              open: () {
                _showtaskcategorydialog(context);
              }),
          _listtiles(
              icon: Icons.add_task,
              title: 'Add Task',
              open: () {
                _navigatetoaddtask(context);
              }),
          Divider(
            thickness: 2,
          ),
          _listtiles(
              icon: Icons.logout,
              title: 'Lodout',
              open: () {
                _showtaskcategorydialog(context);
              }),
        ],
      ),
    );
  }

  Widget _listtiles({IconData icon, String title, Function open}) {
    return ListTile(
      onTap: () {
        open();
      },
      leading: Icon(
        icon,
        color: Colors.redAccent,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.redAccent,
            fontSize: 20.0,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  _showtaskcategorydialog(context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.login_outlined,
                    color: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
            content: Text(
              'Do you want to logout',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  auth.signOut();
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          );
        });
  }

  void _navigatetoaddtask(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Add_task_screen(),
      ),
    );
  }

  void _navigatetoalltasks(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Tasks(),
      ),
    );
  }

  void _navigatetoallworkers(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => All_workers(),
      ),
    );
  }
}
