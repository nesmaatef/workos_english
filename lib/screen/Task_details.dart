// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Task_details extends StatefulWidget {
  const Task_details({Key key}) : super(key: key);

  @override
  _Task_detailsState createState() => _Task_detailsState();
}

class _Task_detailsState extends State<Task_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text('Humman resources Task',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Uploaded by',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  border: Border.all(
                                      width: 3.0, color: Colors.blueGrey),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://static4.depositphotos.com/1000393/362/i/950/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'nesma atef',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14.0,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'nesma atef',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14.0,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Uploaded On',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '15/9/2021',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Deadline date',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '15/9/2021',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Still have Time',
                        style:
                            TextStyle(color: Colors.lightGreen, fontSize: 14.0),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Done state:',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'not done yet',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Task description',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Description for the task',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          //  _submitFormOnsignup;
                        },
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Add a comment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
