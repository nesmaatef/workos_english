// @dart=2.9
import 'package:flutter/material.dart';
import 'package:workos_english/widgets/drawer_widget.dart';
import 'package:workos_english/widgets/worker_widget.dart';

class All_workers extends StatefulWidget {
  const All_workers({Key key}) : super(key: key);

  @override
  _All_workersState createState() => _All_workersState();
}

class _All_workersState extends State<All_workers> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Worker_widget();
      }),
    );
  }
}
