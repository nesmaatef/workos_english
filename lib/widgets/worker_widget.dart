// @dart=2.9
import 'package:flutter/material.dart';
import 'package:workos_english/screen/User_profile.dart';

class Worker_widget extends StatefulWidget {
  const Worker_widget({Key key}) : super(key: key);

  @override
  _Worker_widgetState createState() => _Worker_widgetState();
}

class _Worker_widgetState extends State<Worker_widget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => User_profile()),
          );
        },
        onLongPress: () {
          _deltedialog();
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1)),
          ),
          child: CircleAvatar(
            radius: 20,
            child: Image.network(
                'https://www.pngitem.com/pimgs/m/164-1649242_woman-office-worker-computer-icons-laborer-female-office.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text(
          'Nesma',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale_rounded,
              color: Colors.pink,
            ),
            Text(
              'Manager/5554464646',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: Icon(
          Icons.email_outlined,
          size: 30.0,
          color: Colors.pink,
        ),
      ),
    );
  }

  _deltedialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
