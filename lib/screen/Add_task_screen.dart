// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workos_english/widgets/drawer_widget.dart';

class Add_task_screen extends StatefulWidget {
  const Add_task_screen({Key key}) : super(key: key);

  @override
  _Add_task_screenState createState() => _Add_task_screenState();
}

class _Add_task_screenState extends State<Add_task_screen> {
  DateTime currentDate = DateTime.now();
  List<String> taskcategorylist = [
    'Business',
    'Programming',
    'Information technology',
    'Human resourves',
    'Marketing',
    'Design',
    'Accounting'
  ];

  TextEditingController _taskcategoycontroller =
      TextEditingController(text: 'task category');
  TextEditingController _tasktitlecontroller = TextEditingController();
  TextEditingController _taskdescriptioncontroller = TextEditingController();
  TextEditingController _taskdatecontroller =
      TextEditingController(text: 'task date');
  final _addtaskformkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskcategoycontroller.dispose();
    _tasktitlecontroller.dispose();
    _taskdescriptioncontroller.dispose();
    _taskdatecontroller.dispose();
  }

  void _submitupload() {
    final isvalid = _addtaskformkey.currentState.validate();
    print('isvalid $isvalid');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          color: Colors.black12,
          child: ListView(
            children: [
              Center(
                child: Text(
                  'All field are requires',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Form(
                key: _addtaskformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _text('Task category*'),
                    SizedBox(
                      height: 5.0,
                    ),
                    _textformfield(
                        valuekey: 'TaskCategory',
                        controller: _taskcategoycontroller,
                        enabled: false,
                        fct: () {
                          _showtaskcategorydialog(size: size);
                        },
                        maxlengh: 100,
                        maxlines: 1),
                    SizedBox(
                      height: 5.0,
                    ),
                    _text('Task title*'),
                    SizedBox(
                      height: 5.0,
                    ),
                    _textformfield(
                        valuekey: 'tasktitle',
                        controller: _tasktitlecontroller,
                        enabled: true,
                        fct: () {},
                        maxlengh: 100,
                        maxlines: 3),
                    SizedBox(
                      height: 5.0,
                    ),
                    _text('Task description'),
                    SizedBox(
                      height: 5.0,
                    ),
                    _textformfield(
                        valuekey: 'taskdescription',
                        controller: _taskdescriptioncontroller,
                        enabled: true,
                        fct: () {},
                        maxlengh: 200,
                        maxlines: 3),
                    SizedBox(
                      height: 5.0,
                    ),
                    _text('Task date'),
                    SizedBox(
                      height: 5.0,
                    ),
                    _textformfield(
                        valuekey: 'taskdate',
                        controller: _taskdatecontroller,
                        enabled: false,
                        fct: () {
                          _selectDate(context);
                          _taskdatecontroller.text = currentDate.toString();
                        },
                        maxlengh: 200,
                        maxlines: 3),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: MaterialButton(
                    onPressed: () {
                      //  _submitFormOnLogin();
                    },
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0)),
                    child: Text('Upload',
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
      ),
    );
  }

  Widget _textformfield(
      {String valuekey,
      TextEditingController controller,
      bool enabled,
      Function fct,
      int maxlengh,
      int maxlines}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          fct();
        },
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          key: ValueKey(valuekey),
          style: TextStyle(color: Colors.deepOrangeAccent),
          maxLines: valuekey == 'TaskDescription' ? 3 : 1,
          maxLength: maxlengh,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
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
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),
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
                      onTap: () {
                        setState(() {
                          _taskcategoycontroller.text = taskcategorylist[index];
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
            ],
          );
        });
  }
}
