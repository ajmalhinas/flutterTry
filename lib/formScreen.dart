import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'dart:async';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String name;
  String requestPurpose;
  String startDate;
  String startTime;
  String endDate;
  String endTime;

  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  Widget _buildName(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,0,0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Name'),

        validator: (String value){
          if(value.isEmpty){
            return 'Name is Required';
          }
        },
        onSaved: (String value){
          name = value;
        },
      ),
    );
  }

  Widget _buildRequestPurpose(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,10,5,5),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Purpose for permit'),
      ),
    );
  }

  Widget _buildStartDate(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: <Widget>[
            Text("Permit Required Date:      ",style: TextStyle(fontSize: 16),),
            Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontSize: 16),),
            IconButton(icon: Icon(Icons.date_range), onPressed: ()=> _selectDate(context)),
          ],
        )
    );
  }

  Widget _buildStartTime(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(

          children: <Widget>[
            Text("Starting Time -                           ",style: TextStyle(fontSize: 16),),
            Text("${selectedTime.hour}: ${selectedTime.minute} ",style: TextStyle(fontSize: 16),),
            IconButton(icon: Icon(Icons.access_time), onPressed: ()=> _selectTime(context)),
          ],
        )
    );
  }
  Widget _buildEndDate(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: <Widget>[
            Text("Estimated Ending Date:     ",style: TextStyle(fontSize: 16),),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            IconButton(icon: Icon(Icons.date_range), onPressed: ()=> _selectDate(context)),
          ],
        )
    );
  }

  Widget _buildEndTime(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(

          children: <Widget>[
            Text("Closing Time -                           ", style: TextStyle(fontSize: 16 ),),
            Text("${selectedTime.hour}: ${selectedTime.minute} ", style: TextStyle(fontSize: 16),),
            IconButton(icon: Icon(Icons.access_time), onPressed: ()=> _selectTime(context)),
          ],
        )
    );
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    } }
   Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime);
    if (picked != null ) {
      setState(() {
        selectedTime = picked;
      });
    } }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permit Request Application"),
        backgroundColor: Colors.blue,
      centerTitle: true, actions: <Widget>[
        IconButton(icon: Icon(Icons.account_circle), onPressed: null)
        ],
      ),
      body: Center(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.tealAccent, Colors.blue[500]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            margin: EdgeInsets.all(0),
            child: Form(
              key: _formKey,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                _buildName(),
//            SizedBox(height: 5.0,),
                _buildRequestPurpose(),
            _buildStartDate(),
            _buildStartTime(),
            _buildEndDate(),
            _buildEndTime(),
              SizedBox(height: 10,),
                SizedBox(height: 0,),


                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20.0,),
                      RaisedButton(
                        child: Text('Logout',
                          style: TextStyle(color: Colors.white, fontSize: 20,),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(30.0)
                        ),
                        color: Colors.deepPurple,
                        onPressed: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                        },
                      ),
                      SizedBox(width: 80,),
                      RaisedButton(
                        child: Text('Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20,),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(30.0)
                        ),
                        color: Colors.deepPurple,
                        onPressed: (){
                          if(!_formKey.currentState.validate()){
                            return;
                          }
                          _formKey.currentState.save();
//                print('Your name is $name');
                        },
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),

    );
  }
}

