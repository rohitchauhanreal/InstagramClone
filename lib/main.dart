// Unveiling my new project:
//
// A cutting-edge Instagram-clone app that seamlessly adapts to Android, iOS, and Web platforms! 🚀
//
//
//
// Features include :
//
// ✅ Responsive Instagram UI
//
// ✅ Email & Password Authentication
//
// ✅ Share Posts with Caption
//
// ✅ Display Posts with Caption
//
// ✅ Like & Comment on Posts
//
// ✅ Search Users
//
// ✅ Follow Users
//
// ✅ Display User Posts, Followers & Following
//
// ✅ EVERYTHING REAL-TIME
//
// ✅ Sign Out
//
//
//
// 🔧 Tech Stack:
//
// Server: Firebase Auth, Firebase Storage, Firebase Firestore.
//
// Client: Flutter, Provider.
//
//
//
// #InstagramClone #Flutter #Firebase #MobileDevelopment #appdevelopment #newproject
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCvLyIg73SFxswaQkghviVlAsDk1etgTyA",
            appId: "1:686132089674:web:39108356be7810b05ee7b3",
            messagingSenderId: "686132089674",
            projectId: "instagram-clone-59263",
            storageBucket: "instagram-clone-59263.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark(),
        // home:
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}