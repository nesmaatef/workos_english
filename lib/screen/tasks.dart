// @dart=2.9
import 'package:flutter/material.dart';
import 'package:workos_english/widgets/drawer_widget.dart';
import 'package:workos_english/widgets/tasks_widgets.dart';

class Tasks extends StatefulWidget {
  //const Tasks({Key key}) : super(key: key);
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<String> taskcategorylist = [
    'Business',
    'Programming',
    'Information technology',
    'Human resourves',
    'Marketing',
    'Design',
    'Accounting'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black87,
              ),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Tasks',
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showtaskcategorydialog(size: size);
              },
              icon: Icon(
                Icons.filter_list_outlined,
                color: Colors.teal,
              ))
        ],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Tasks_widgets();
      }),
    );
  }

  _showtaskcategorydialog({Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              'Task Category',
              style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: taskcategorylist.length,
                  itemBuilder: (ctxx, index) {
                    return InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.redAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              taskcategorylist[index],
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
              TextButton(
                onPressed: () {},
                child: Text('Cancel filter'),
              )
            ],
          );
        });
  }
}
