import 'package:supa_test/models/student.dart';
import 'package:supa_test/models/student_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final GoTrueClient _auth = Supabase.instance.client.auth;
  // create user object based on FirebaseUser
  StudentUser _userFromSupabaseState(AuthState user) {
    return StudentUser.withId(user.session!.user.id);
  }

  StudentUser? _userFromSupabaseUser(User? user) {
    return user == null ? null : StudentUser.withId(user.id);
  }

  // auth change user stream
  Stream<StudentUser> get user {
    return _auth.onAuthStateChange.map(_userFromSupabaseState);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResponse response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      return _userFromSupabaseUser(response.user!);
    } catch (e) {
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResponse response =
          await _auth.signUp(email: email, password: password);
      return response;
    } catch (e) {
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  StudentUser? getInitialUser() {
    return _userFromSupabaseUser(_auth.currentUser);
  }
}
