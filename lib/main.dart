import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supa_test/constants/supabase_keys.dart';
import 'package:supa_test/models/student_user.dart';

import 'package:supa_test/screens/application/application_edit.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/wrapper.dart';
import 'package:supa_test/screens/home_page.dart';
import 'package:supa_test/screens/job/job_display.dart';
import 'package:supa_test/screens/job/jobs_list.dart';
import 'package:supa_test/screens/profile/student_profile.dart';
import 'package:supa_test/services/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supa_test/screens/auth/signup.dart';
import 'package:supa_test/screens/profile/edit_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseConstants.supabaseUrl,
      anonKey: SupabaseConstants.supabaseAnnonKey,
      debug: true // optional
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return StreamProvider.value(
        value: _authService.user,
        initialData: _authService.getInitialUser(),
        catchError: (context, error) => StudentUser.withId(error.toString()),
        child: CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.amber,
                iconTheme: const IconThemeData(color: Colors.amber)),
            initialRoute: Decision.id,
            routes: {
              MyHomePage.id: (context) => const MyHomePage(),
              StudentProfile.id: (context) => StudentProfile(),
              EditProfile.id: (context) => EditProfile(),
              JobProfile.id: (context) => JobProfile(),
              AllJobs.id: (context) => const AllJobs(),
              ApplicationList.id: (context) => const ApplicationList(),
              EditApplication.id: (context) => EditApplication(),
              Calender.id: (context) => const Calender(),
              SignIn.id: (context) => SignIn(),
              Decision.id: (context) => const Decision(),
              SignUpScreen.id: (context) => const SignUpScreen(),
            },
          ),
        ));
  }
}
