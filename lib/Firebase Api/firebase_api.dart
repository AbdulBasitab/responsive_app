import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
 static final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signInUsingEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}
