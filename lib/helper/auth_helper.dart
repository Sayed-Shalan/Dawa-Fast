import 'dart:ffi';
import '../main.dart';

class AuthHelper {
  //TODO Enable This
  ///Data *********************************************************************
  bool isLoggedIn(){
    var client = pref.user;
    if(client == null) return false;
    return true;
    /*var loggedIn = (FirebaseAuth.instance.currentUser != null && phoneVerified()) ||
        (FirebaseAuth.instance.currentUser != null && pref.hasClientClaims());
    if(!loggedIn && FirebaseAuth.instance.currentUser != null) FirebaseAuth.instance.signOut();
    return loggedIn;*/
  }

  ///Logout
  Future<Void?> logout() async {
    await pref.clear();
    return Future.value();
  }

}

/// USER TYPES ********************************
enum EUserRole { client, empty, other }

/// To decide linking or auth with credentials
enum EAuthType { signIn, link }
