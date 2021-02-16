import 'package:crystaspace/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  AuthStore _authStore;
  String email , password;

  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore = Provider.of<AuthStore>(context);

    _authStore.getData();
    email = _authStore.email;
    password = _authStore.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
         profilePhoto(),
          Container(
            margin: EdgeInsets.only(top: 40 , left: 40 , right: 40),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          MdiIcons.account,
                          color: Colors.grey[900],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Text("Name",
                              style: TextStyle(

                                  fontWeight: FontWeight.w600)),
                        ),
                      ),

                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          MdiIcons.email,
                          color: Colors.grey[900],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Text(email,
                              style: TextStyle(

                                  fontWeight: FontWeight.w600)),
                        ),
                      ),

                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          MdiIcons.formTextboxPassword,
                          color: Colors.grey[900],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Text(password,
                              style: TextStyle(

                                  fontWeight: FontWeight.w600)),
                        ),
                      ),

                    ],
                  ),
                ),
                Divider(),

              ],
            ),
          )

        ],
      ),
    );
  }

  Widget profilePhoto() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5),
      child: Container(

        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
        child: CircleAvatar(
          backgroundColor: Colors.orange[200],

          child: Icon(
            MdiIcons.faceProfile,
            size: 100,
             color: Colors.black,
          ),
        ),
      ),
    );
  }
}
