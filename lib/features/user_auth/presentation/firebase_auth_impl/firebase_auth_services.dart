import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_assistant/global/common/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPass(String email, String password, String displayName) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Set the display name
      await userCredential.user!.updateDisplayName(displayName);
      await userCredential.user!.reload();  // Reload the user to reflect the update

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'Оваа e-mail адреса е веќе во употреба.');
      } else {
        showToast(message: 'Настана проблем: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> logInUserWithEmailAndPass(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }
}