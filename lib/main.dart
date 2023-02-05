import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ravan/Api_Service/get_api.dart';
import 'package:ravan/Screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetApi>(
          create: (context) => GetApi(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
