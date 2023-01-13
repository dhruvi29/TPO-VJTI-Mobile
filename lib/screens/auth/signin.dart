// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:supa_test/screens/auth/signup.dart';
// import 'package:supa_test/screens/home_page.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../supabase_state/auth_state.dart';

// class SignInScreen extends StatefulWidget {

//   static const id = "SignInScreen";

//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends AuthState<SignInScreen> {
//   var authRedirectUri = 'io.supabase.flutterdemo://login-callback';
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: true,
//         body: SizedBox(
//           height: 768,
//           width: 375,
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       height: 587,
//                       width: 375,
//                       margin: const EdgeInsets.only(top: 68, bottom: 113),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 34,
//                               width: 264,
//                               margin: const EdgeInsets.only(
//                                 left: 15,
//                                 right: 16,
//                               ),
//                               child: const Text(
//                                 "TPO VJTI",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 26,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 70.0,
//                               child: Image.asset(
//                                 "assets/logo.png",
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 16,
//                                 top: 28,
//                                 right: 16,
//                               ),
//                               child: Container(
//                                 width: 343,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white70,
//                                   borderRadius: BorderRadius.circular(
//                                     5,
//                                   ),
//                                   border: Border.all(
//                                     color: Colors.blue.shade50,
//                                     width: 1,
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   controller: emailController,
//                                   decoration: InputDecoration(
//                                       hintText: "Enter your email",
//                                       hintStyle: TextStyle(
//                                           fontSize: 12.0,
//                                           color: Colors.blueGrey.shade300),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           5,
//                                         ),
//                                         borderSide: const BorderSide(
//                                             color: Colors.white70),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           5,
//                                         ),
//                                         borderSide: const BorderSide(
//                                             color: Colors.white70),
//                                       ),
//                                       prefixIcon: const Padding(
//                                         padding: EdgeInsets.all(
//                                           15,
//                                         ),
//                                         child: Icon(Icons.email_outlined),
//                                       ),
//                                       filled: true,
//                                       fillColor: Colors.white),
//                                   style: TextStyle(
//                                       color: Colors.blueGrey.shade300,
//                                       fontSize: 14.0,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: 343,
//                               height: 48,
//                               margin: const EdgeInsets.only(
//                                 left: 16,
//                                 top: 8,
//                                 right: 16,
//                               ),
//                               child: TextFormField(
//                                 controller: passwordController,
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     hintText: "Enter Password",
//                                     hintStyle: TextStyle(
//                                         fontSize: 12.0,
//                                         color: Colors.blueGrey.shade300),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         5,
//                                       ),
//                                       borderSide: BorderSide(
//                                           color: Colors.blue.shade50),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         5,
//                                       ),
//                                       borderSide: BorderSide(
//                                           color: Colors.blue.shade100),
//                                     ),
//                                     prefixIcon: const Padding(
//                                       padding: EdgeInsets.all(
//                                         15,
//                                       ),
//                                       child: Icon(Icons.lock_outline_rounded),
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.white),
//                                 style: TextStyle(
//                                     color: Colors.blueGrey.shade300,
//                                     fontSize: 14.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 onTapBtnSignin();
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 16,
//                                   top: 18,
//                                   right: 16,
//                                 ),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.amber,
//                                     borderRadius: BorderRadius.circular(
//                                       5,
//                                     ),
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 1,
//                                     ),
//                                   ),
//                                   alignment: Alignment.center,
//                                   height: 57,
//                                   width: 343,
//                                   child: const Text(
//                                     "Sign In",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: 375,
//                               height: 21,
//                               margin: const EdgeInsets.only(
//                                 top: 19,
//                               ),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 1,
//                                       width: 134,
//                                       margin: const EdgeInsets.only(
//                                         left: 16,
//                                         top: 10,
//                                         bottom: 10,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.blue.shade50,
//                                           width: 1,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 21,
//                                       width: 21,
//                                       margin: const EdgeInsets.only(
//                                         left: 28,
//                                       ),
//                                       child: const Text(
//                                         "OR",
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 1,
//                                       width: 120,
//                                       margin: const EdgeInsets.only(
//                                         left: 23,
//                                         top: 10,
//                                         right: 16,
//                                         bottom: 10,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.blue.shade50,
//                                           width: 1,
//                                         ),
//                                       ),
//                                     )
//                                   ]),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacementNamed(
//                                     context, SignUpScreen.id);
//                               },
//                               child: Container(
//                                 width: 212,
//                                 margin: const EdgeInsets.only(
//                                   left: 81,
//                                   top: 8,
//                                   right: 82,
//                                 ),
//                                 child: RichText(
//                                     text: TextSpan(children: <InlineSpan>[
//                                       TextSpan(
//                                         text: "Don't have an account?",
//                                         style: TextStyle(
//                                             color: Colors.blueGrey.shade300,
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       TextSpan(
//                                         text: ' ',
//                                         style: TextStyle(
//                                             color: Colors.indigo.shade300,
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                       TextSpan(
//                                         text: "SignUp",
//                                         style: TextStyle(
//                                             color: Colors.lightBlue.shade300,
//                                             fontSize: 12,
//                                             fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w700),
//                                       )
//                                     ]),
//                                     textAlign: TextAlign.center),
//                               ),
//                             )
//                           ]),
//                     ),
//                   ),
//                 )
//               ]),
//         ),
//       ),
//     );
//   }

//   void onTapBtnSignin() async {
//     final response = await Supabase.instance.client.auth.signIn(
//       email: emailController.text,
//       password: passwordController.text,
//     );
//     if (response.error != null) {
//       final snackbar = SnackBar(content: Text(response.error!.message));
//       ScaffoldMessenger.of(context).showSnackBar(snackbar);
//     } else {
//       Navigator.pushReplacementNamed(context, MyHomePage.id);
//     }
//   }

//   void onTapBtnGoogleSignin() async {
//     await Supabase.instance.client.auth.signInWithProvider(
//       Provider.google,
//       options: AuthOptions(redirectTo: authRedirectUri),
//     );
//   }

//   void onTapBtnFacebookSignin() async {
//     await Supabase.instance.client.auth.signInWithProvider(
//       Provider.facebook,
//       options: AuthOptions(redirectTo: authRedirectUri),
//     );
//   }
// }
