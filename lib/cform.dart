
import 'dart:developer';

import 'package:flutter/material.dart';


// import 'package:date_field/date_field.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Cform extends StatefulWidget {
  const Cform({super.key});
  @override
  State<Cform> createState() => _MyFormState();
  
}
 class _MyFormState extends State<Cform> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // var enDatesFuture = initializeDateFormatting('en-us', null);
  var date=DateTime.now().add(const Duration(days: 10));
  var myFormat = DateFormat('d-MM-yyyy');
  final _datecontroller = TextEditingController();
  final _placecontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _gendercontroller = TextEditingController();
  final _finStatuscontroller = TextEditingController();
  final _maritalStatuscontroller = TextEditingController();
  final _schoolcontroller = TextEditingController();
  final _religioncontroller = TextEditingController();
  final _fEducationcontroller = TextEditingController();
  final _fOccupationcontroller = TextEditingController();
  final _mEducationcontroller = TextEditingController();
  final _mOccupationcontroller = TextEditingController();
  final _problemcontroller =  TextEditingController();
  final _historycontroller =  TextEditingController();
  final _interventioncontroller =  TextEditingController();
  final _challengescontroller =  TextEditingController();
  final _sessioncontroller = TextEditingController();
  final _referralcontroller =  TextEditingController();
  final _outcomecontroller =  TextEditingController();
  final _remarkscontroller =  TextEditingController();
  final _statuscontroller = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    setState(() {
      date = picked ?? date;
      _datecontroller.text=myFormat.format(date).toString();
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      var data = {
      "date": _datecontroller.text,
      "place_of_counselling": _placecontroller.text,
      "name": _namecontroller.text,
      "age":_agecontroller.text,
      "gender" : _gendercontroller.text,
      "finacial_status":_finStatuscontroller.text,
      "marital_status":_maritalStatuscontroller.text,
      "school":_schoolcontroller.text,
      "religion":_religioncontroller.text,
      "fathers_education":_fEducationcontroller.text,
      "fathers_occupation":_fOccupationcontroller.text,
      "mothers_education":_mEducationcontroller.text,
      "mothers_occupation":_mOccupationcontroller.text,
      "problem":_problemcontroller.text,
      "history_of_problem":_historycontroller.text,
      "intervention":_interventioncontroller.text,
      "challenges_by_counsellor":_challengescontroller.text,
      "number_of_followup_sections":_sessioncontroller.text,
      "referral_service":_referralcontroller.text,
      "outcome":_outcomecontroller.text,
      "remarks":_remarkscontroller.text,
      "status":_statuscontroller.text
    };
    }
    // log(_datecontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form'),
      ),
      backgroundColor: Colors.green[200],
      body: SingleChildScrollView(
        padding:const  EdgeInsets.all(16.0),
        
        child: Form(
          key: _formKey,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                // elevation: 5.0,
                
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _datecontroller,
                        decoration: InputDecoration(

                        hintText: ('${myFormat.format(date)}'),
                          ),
                        onTap: () =>  _selectDate(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            
                            return 'Please select a date';
                            
                          }
                          return null;
                        },
                      ),
                      
                     
                      const SizedBox(height: 16.0),
                      const Text(
                        'Place of Counselling',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            _placecontroller.text = value.toString();
                          });
                        },
                        
                        items: const [
                          DropdownMenuItem(
                            value: 'Vypin-Rajagiri Sea Shore School',
                            child:  Text('Vypin-Rajagiri Sea Shore School'),
                          ),
                           DropdownMenuItem(
                            value: 'Kakkanad',
                            child:  Text('Kakkanad'),
                          ),
                           DropdownMenuItem(
                            value: 'Thevara-SH College(East Campus)',
                            child:  Text('Thevara-SH College(East Campus)'),
                          ),
                           DropdownMenuItem(
                            value: 'Thevara-Higher Secondary School',
                            child:  Text('Thevara-Higher Secondary School'),
                          ),
                           DropdownMenuItem(
                            value: 'Thevara-SH UP',
                            child:  Text('Thevara-SH UP'),
                          ),
                           DropdownMenuItem(
                            value: 'Thevara-SH High School',
                            child:  Text('Thevara-SH High School'),
                          ),
                           DropdownMenuItem(
                            value: 'Karukutty-Christ the King monastery Church',
                            child:  Text('Karukutty-Christ the King monastery Church'),
                          ),
                           DropdownMenuItem(
                            value: 'Kanjoor',
                            child:  Text('Kanjoor'),
                          ),
                           DropdownMenuItem(
                            value: 'Eloor-SHJ UP School',
                            child:  Text('Eloor-SHJ UP School'),
                          ),
                           DropdownMenuItem(
                            value: 'Kottarapalli-Amala Public School',
                            child:  Text('Kottarapalli-Amala Public School'),
                          ),
                           DropdownMenuItem(
                            value: 'Manappuram-St Teresas High School',
                            child:  Text('Manappuram-St Teresas High School'),
                          ),
                           DropdownMenuItem(
                            value: 'Pothy',
                            child:  Text('Pothy'),
                          ),
                          // Add other options here
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a place';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                // elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _namecontroller,
                        maxLength: 100,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller:_agecontroller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Age'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter age';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            _gendercontroller.text = value.toString();
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                           
                            value: 'Male', 
                            child: Text('Male'),

                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'Others',
                            child: Text('Others'),
                            
                          ),
                        ],
                        decoration: const  InputDecoration(labelText: 'Gender'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select  gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            _finStatuscontroller.text = value.toString();
                          });
                        },
                         items: const [
                          DropdownMenuItem(
                           
                            value: 'APL', 
                            child: Text('APL'),

                          ),
                          DropdownMenuItem(
                            value: 'BPL',
                            child: Text('BPL'),
                          ),
                        ],
                        decoration: const InputDecoration(labelText: 'Family Financial Status'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter family financial status';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            _maritalStatuscontroller.text = value.toString();
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            
                            value: 'Married',
                            child: Text('Married'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Single',
                            child: Text('Single'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Divorcee',
                            child: Text('Divorcee'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Widower',
                            child: Text('Widower'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Widow',
                            child: Text('Widow'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Separated',
                            child: Text('Separated'),
                          ),
                        ],
                        decoration: const InputDecoration(labelText: 'Marital Status'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select marital status';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            _schoolcontroller.text = value.toString();
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            
                            value: 'Government',
                            child: Text('Government'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Aided',
                            child: Text('Aided'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Private',
                            child: Text('Private'),
                          ),
                        ],
                        decoration: const InputDecoration(labelText: 'School'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _religioncontroller,
                        maxLength: 20,
                        decoration: const InputDecoration(labelText: 'Religion'),
                      ),
                      const SizedBox(height: 16.0),
                      // Add other personal details fields similarly
                    ],
                  ),
                ),
              ),
              Card(
                // elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Family Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _fEducationcontroller,
                        maxLength: 25,
                        decoration: const InputDecoration(labelText: "Father's Education"),
                      ),
                     const  SizedBox(height: 16.0),
                      TextFormField(
                        controller: _fOccupationcontroller,
                        maxLength: 25,
                        decoration: const InputDecoration(labelText: "Father's Occupation"),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _mEducationcontroller,
                        maxLength: 25,
                        decoration: const InputDecoration(labelText: "Mother's Education"),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _mOccupationcontroller,
                        maxLength: 25,
                        decoration: const InputDecoration(labelText: "Mother's Occupation"),
                      ),
                     const SizedBox(height: 16.0),
                      // Add other family details fields similarly
                    ],
                  ),
                ),
              ),
              Card(
                // elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _problemcontroller,
                        maxLines: 5,
                        maxLength: 200,
                        decoration: const InputDecoration(labelText: 'Problem'),
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter the probelm';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                         controller: _historycontroller,
                        maxLines: 6,
                        maxLength: 500,
                        decoration: const InputDecoration(labelText: 'History of the Problem'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _interventioncontroller,
                        maxLength: 100,
                        maxLines: 3,
                        decoration:const InputDecoration(labelText: 'Intervention'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _challengescontroller,
                        maxLines: 4,
                        maxLength: 200,
                        decoration: const InputDecoration(labelText: 'Challenges by Counsellor'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _sessioncontroller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Number of Follow-up Sessions'),
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of follow-up sessions';
                          }
                          return null;
                        },
                      ),
                     const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _referralcontroller,
                        maxLines: 3,
                        maxLength: 100,
                        decoration: const InputDecoration(labelText: 'Referral Service'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _outcomecontroller,
                        maxLines: 4,
                        maxLength: 250,
                        decoration: const InputDecoration(labelText: 'Outcome'),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _remarkscontroller,
                        maxLines: 4,
                        maxLength: 200,
                        decoration: const InputDecoration(labelText: 'Remarks'),
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                             _statuscontroller.text = value.toString();
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            
                            value: 'Pending',
                            child: Text('Pending'),
                          ),
                          DropdownMenuItem(
                            
                            value: 'Completed',
                            child: Text('Completed'),
                          ),
                        ],
                        decoration: const InputDecoration(labelText: 'Status'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the status';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 