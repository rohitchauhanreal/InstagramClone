import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Center(
      child: Text(
    'Created by Rohit Chauhan ♥',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  )),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
