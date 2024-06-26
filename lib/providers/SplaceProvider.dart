import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplaceProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;


  SplaceProvider(BuildContext ){

      if(auth.currentUser!=null)
      {
        
      }


  }



}
