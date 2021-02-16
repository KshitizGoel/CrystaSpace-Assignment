import 'package:crystaspace/authentication/sign_up_page.dart';
import 'package:crystaspace/profile/profile_screen.dart';
import 'package:crystaspace/store/auth_store.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                          "Log In".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 48, right: 48, top: 40),
                    child: Text(
                      "Enter your login details to access your account",
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
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
                          borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                hintText: "Email Address",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 0.5,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        letterSpacing: 0,
                                      ),
                                      hintText: "Your Password",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(16),
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: true,
                                  ),
                                ),
                              ],
                            )
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          "I haven't an account",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey[600]),
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
    if (_emailController.text != "" && _passwordController.text != "") {
      _authStore.setData();

      _authStore.password = _passwordController.text;
      _authStore.email = _emailController.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    } else {
      FlushbarHelper.createError(
        title: "Error!",
        message: "Please fill the details!",
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }
}
