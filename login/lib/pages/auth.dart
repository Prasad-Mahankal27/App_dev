import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Getters
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Helper function for validation
  bool _validatePassword(String password) {
    // Implement your password validation logic here (e.g., minimum length, complexity)
    return password.length >= 8 && password.contains(RegExp(r'[a-zA-Z]')) && password.contains(RegExp(r'[0-9]'));
  }

  // Signing In
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (!_validatePassword(password)) {
      throw ArgumentError('Invalid password: must be at least 8 characters and contain both letters and numbers.');
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors or throw a more generic error
      throw Exception('Failed to sign in: ${e.message}');
    }
  }

  // Creating User
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (!_validatePassword(password)) {
      throw ArgumentError('Invalid password: must be at least 8 characters and contain both letters and numbers.');
    }

    try {
      print('Attempting to create user...');
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created successfully.');
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors or throw a more generic error
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  // Signing Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
