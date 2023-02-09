import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:supa_test/screens/home_page.dart';
import 'package:supa_test/screens/profile/student_profile.dart';

import 'package:supa_test/widgets/edit_field.dart';
import 'package:supa_test/models/student.dart' as s;
import 'package:supa_test/constants/supabse_client.dart' as supa;

import '../../models/student_user.dart';

const List<String> list1 = <String>['BTech', 'MTech'];
const List<String> list2 = <String>[
  'computer',
  'it',
  'extc',
  'electronics',
  'electrical',
  'mechanical',
  'civil',
  'production',
  'textile'
];
const List<String> list3 = <String>['Male', 'Female'];

class SetProfile extends StatefulWidget {
  static const id = "SetProfile";

  const SetProfile({Key? key}) : super(key: key);

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  TextEditingController dateController = TextEditingController();
  String dropdownValue1 = list1.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;
  var finalLinkVal = 'resumeLink';
  var finalFirstNameVal = "firstName";
  var finalMiddleNameVal = "middleName";
  var finalLastNameVal = "lastName";
  var finalMobileNumberVal = 0;
  var finalClgIDVal = 0;
  var finalAgeVal = 0;
  var finalGradYearVal = 0;
  var finalPersonalEmailVal = "dsad@dfds.com";
  var finalsem1Val = 0.0;
  var finalsem2Val = 0.0;
  var finalsem3Val = 0.0;
  var finalsem4Val = 0.0;
  var finalsem5Val = 0.0;
  var finalsem6Val = 0.0;
  var finalsem7Val = 0.0;
  var finalsem8Val = 0.0;
  var finalCPIVal = 0.0;
  var finaltenthVal = 0.0;
  var finaltwelfthVal = 0.0;

  @override
  Widget build(BuildContext context) {
    StudentUser userVar = Provider.of<StudentUser>(context);

    // List of items in our dropdown menu

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          EditField(TextInputType.text, "First Name", Icons.abc, (val) {
            finalFirstNameVal = val;
          }),
          EditField(TextInputType.text, "Middle Name", Icons.abc, (val) {
            finalMiddleNameVal = val;
          }),
          EditField(TextInputType.text, "Last Name", Icons.abc, (val) {
            finalLastNameVal = val;
          }),
          EditField(TextInputType.number, "Mobile Number", Icons.phone, (val) {
            finalMobileNumberVal = int.parse(val);
          }),
          EditField(TextInputType.number, "College ID", Icons.perm_identity,
              (val) {
            finalClgIDVal = int.parse(val);
          }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputDecorator(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house),
                    labelText: "Programme",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue1 = value!;
                    });
                  },
                  items: list1.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputDecorator(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house),
                    labelText: "Branch",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue2,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue2 = value!;
                    });
                  },
                  items: list2.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller:
                    dateController, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1700),
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      dateController.text =
                          formattedDate; //set foratted date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              )),
          EditField(TextInputType.number, "Age", Icons.contact_page, (val) {
            finalAgeVal = int.parse(val);
          }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputDecorator(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house),
                    labelText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue3,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue3 = value!;
                    });
                  },
                  items: list3.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
          ),
          EditField(
              TextInputType.number, "Graduation Year", Icons.calendar_today,
              (val) {
            finalGradYearVal = int.parse(val);
          }),
          EditField(TextInputType.number, "10th Percentage", Icons.numbers,
              (val) {
            finaltenthVal = double.parse(val);
          }),
          EditField(TextInputType.number, "12th Percentage", Icons.numbers,
              (val) {
            finaltwelfthVal = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 1 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem1Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 2 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem2Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 3 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem3Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 4 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem4Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 5 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem5Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 6 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem6Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 7 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem7Val = double.parse(val);
          }),
          EditField(TextInputType.number, "SEM 8 SPI (Enter 0 if unknown)",
              Icons.numbers, (val) {
            finalsem8Val = double.parse(val);
          }),
          EditField(TextInputType.number, "CPI", Icons.numbers, (val) {
            finalCPIVal = double.parse(val);
          }),
          EditField(TextInputType.emailAddress, "Personal Email", Icons.email,
              (val) {
            finalPersonalEmailVal = val;
          }),
          EditField(TextInputType.url, "Resume Link", Icons.link, (val) {
            finalLinkVal = val;
          }),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await supa.supabase.from('Students').update({
                      'resumeLink': finalLinkVal,
                      'firstName': finalFirstNameVal,
                      'middleName': finalMiddleNameVal,
                      'lastName': finalLastNameVal,
                      'mobileNumber': finalMobileNumberVal,
                      'clgId': finalClgIDVal,
                      'programme': dropdownValue1.toLowerCase(),
                      'branch': dropdownValue2,
                      'dob': dateController.text,
                      'age': finalAgeVal,
                      'gender': dropdownValue3.toLowerCase(),
                      'gradYear': finalGradYearVal,
                      'personalEmail': finalPersonalEmailVal,
                      'SPI1': finalsem1Val,
                      'SPI2': finalsem2Val,
                      'SPI3': finalsem3Val,
                      'SPI4': finalsem4Val,
                      'SPI5': finalsem5Val,
                      'SPI6': finalsem6Val,
                      'SPI7': finalsem7Val,
                      'SPI8': finalsem8Val,
                      'CPI': finalCPIVal,
                      '10th': finaltenthVal,
                      '12th': finaltwelfthVal,
                      'hasSetProfile': true,
                    }).match({'id': userVar.userID});
                    Navigator.pushReplacementNamed(context, MyHomePage.id);
                  },
                  child: const Text("Save")),
            ),
          )
        ]),
      ),
    );
  }
}
