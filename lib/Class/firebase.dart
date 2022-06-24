import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  String email = "";
  String password = "";

  void createWithMail(String email, String password) async {
    this.email = email.trim();
    this.password = password.trim();

    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
