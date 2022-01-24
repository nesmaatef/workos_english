// @dart=2.9
import 'package:flutter/material.dart';
import 'package:workos_english/screen/Task_details.dart';

class Tasks_widgets extends StatefulWidget {
  const Tasks_widgets({Key key}) : super(key: key);

  @override
  _Tasks_widgetsState createState() => _Tasks_widgetsState();
}

class _Tasks_widgetsState extends State<Tasks_widgets> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Task_details()),
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
                'https://png.pngtree.com/png-vector/20190228/ourmid/pngtree-check-mark-icon-design-template-vector-isolated-png-image_711433.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text(
          'Title',
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
              'subtitle/task description',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
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
