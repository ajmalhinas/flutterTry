import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
      },
      onSaved: (String value){
        name = value;
      },
    );
  }

  Widget _buildRequestPurpose(){
    return null;
  }

  Widget _buildStartDate(){
    return null;
  }

  Widget _buildStartTime(){
    return null;
  }
  Widget _buildEndDate(){
    return null;
  }

  Widget _buildEndTime(){
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permit Request Form"),),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildName(),
//            _buildRequestPurpose(),
//            _buildStartDate(),
//            _buildStartTime(),
//            _buildEndDate(),
//            _buildEndTime(),
            SizedBox(height: 100,),
            RaisedButton(
              child: Text('Submit',
                style: TextStyle(color: Colors.cyan, fontSize: 16),
              ),
              onPressed: (){
                if(!_formKey.currentState.validate()){
                  return;
                }
                _formKey.currentState.save();
                print('Your name is $name');
              },
            )
          ],
        )),
      ),

    );
  }
}
