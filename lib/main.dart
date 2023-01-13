import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/application_display.dart';
import 'package:supa_test/screens/application/application_edit.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/screens/decision.dart';
import 'package:supa_test/screens/home_page.dart';
import 'package:supa_test/screens/job/job_display.dart';
import 'package:supa_test/screens/job/jobs_list.dart';
import 'package:supa_test/screens/profile/student_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/auth/signup.dart';
import 'screens/profile/edit_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://wcuxprabdbhvzollnbig.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndjdXhwcmFiZGJodnpvbGxuYmlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM1MDQzMTksImV4cCI6MTk4OTA4MDMxOX0.EmAexP2N21D0SuusipypvkU_n11cc_W3VuNqOS6ccro',
      debug: true // optional
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            iconTheme: const IconThemeData(color: Colors.amber)),
        initialRoute: Decision.id,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
          StudentProfile.id : (context) => StudentProfile(),
          EditProfile.id : (context) => EditProfile(),
          JobProfile.id: (context) => JobProfile(),
          AllJobs.id: (context) => AllJobs(),
          ApplicationDisplay.id: (context) => ApplicationDisplay(),
          ApplicationList.id: (context) => ApplicationList(),
          EditApplication.id: (context) => EditApplication(),
          Calender.id: (context)=>Calender(),
          SignIn.id: (context)=>SignIn(),
          Decision.id: (context)=>Decision(),
          // SignUpScreen.id: (context)=>SignUpScreen(),
        },
      ),
    );
  }
}

