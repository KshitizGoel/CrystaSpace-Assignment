import 'package:crystaspace/authentication/login_page.dart';
import 'package:crystaspace/profile/profile_screen.dart';
import 'package:crystaspace/store/auth_store.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  AuthStore _authStore;

  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: Text(
                          "Create an Account".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 48, right: 48, top: 40),
                    child: Text(
                      "Enter your details to create new your account",
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24, top: 36),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    letterSpacing: 0, color: Colors.grey[400]),
                                hintText: "Email",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            Divider(
                              color: Colors.grey[500],
                              height: 0.5,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    letterSpacing: 0, color: Colors.grey[400]),
                                hintText: "Your Password",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: true,
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 0.5,
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    letterSpacing: 0, color: Colors.grey[400]),
                                hintText: "Confirm Password",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 24, right: 24, top: 36),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(48)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigoAccent[100],
                              blurRadius: 5,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Colors.indigoAccent,
                          splashColor: Colors.white.withAlpha(100),
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          onPressed: () {
                            navigatingToProfilePage(context);
                          },
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.8,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Positioned(
                                right: 16,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.indigo,
                                    // button color
                                    child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Icon(
                                          MdiIcons.arrowRight,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          "I have already an account",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  navigatingToProfilePage(BuildContext context) async {



    if (_emailController.text != "" &&
        _passwordController.text != "" &&
        _confirmPasswordController.text != "") {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        _authStore.setData();

        _authStore.password = _passwordController.text;
        _authStore.email = _emailController.text;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      } else {
        FlushbarHelper.createError(
          title: "Error",
          message: "Your Passwords don't match!",
          duration: Duration(seconds: 3),
        )..show(context);
      }
    } else {
      FlushbarHelper.createError(
        title: "Error",
        message: "Please fill the details!",
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }
}
