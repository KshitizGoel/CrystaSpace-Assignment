import 'package:crystaspace/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'on_boarding_screens/on_boarding_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthStore _authStore = AuthStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        Provider<AuthStore>(create: (_) => _authStore),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  OnBoardingScreen(),
      ),
    );
  }


}
