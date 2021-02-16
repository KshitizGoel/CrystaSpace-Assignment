import 'package:shared_preferences/shared_preferences.dart';

class AuthStore{

   String email , password;

  AuthStore({this.email , this.password});


  setData () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Setting the $email and $password");
    prefs.setString("_email", email);
    prefs.setString("_password", password);
  }

   getData () async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.getString("_email");
     prefs.getString("_password");
   }


}