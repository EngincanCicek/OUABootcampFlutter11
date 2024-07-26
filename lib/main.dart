import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'logger.dart'; // Logger fonksiyonları burada tanımlı olmalı
import 'views/sign_in/sign_in_state.dart'; // SignInState için doğru import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the FirebaseService
  final firebaseService = FirebaseService();

  /* Register a new user TODO buradan yeni kullanıcılar yaratılabilir
  final newUser = await firebaseService.registerUser('example@example.com', '123123123', 'newuser');
  if (newUser != null) {
    info('New user registered with username: ${newUser.username}');
  } else {
    warning('Failed to register new user');
  }*/

  /* Sign in an existing user

  final signedInUser = await firebaseService.signInUser('example@example.com', '123123123');
  if (signedInUser != null) {
    info('User signed in with username: ${signedInUser.username}');
  } else {
    warning('Failed to sign in user');
  }*/

  //Sign out the current user
  //await firebaseService.signOutUser();

  // Create and write a random post to Firestore
  await firebaseService.createAndWriteRandomPost();

  // Read and log a post
// backend
  //await firebaseService.readAndLogPost('post_147'); // Replace with actual post ID if available

  // Start logging all posts
  //firebaseService.logAllPosts();

  // Start logging all posts using Future

=======
  // Replace with actual post ID if available
// backend

  // Create a new Tag and add to Firestore TODO buradan yeni tag ler yaratılabilir
  //final newTag = Tag(tagId: 'NewTag', postIds: []);
  //await firebaseService.createTag(newTag);

  // Read and log all tags
  //await firebaseService.readAndLogAllTags();

  // Read and log posts by Tag ID
  //await firebaseService.readAndLogPostsByTagId('NewTag');

  // Define the URL of the image to download
  //const imageUrl = 'gs://muse0-6debb.appspot.com/newimage.webp';

  // Download and log the image
  //await firebaseService.downloadAndLogImage(imageUrl);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInState(), // SignInState ana sayfa olarak ayarlandı
    );
  }
}
