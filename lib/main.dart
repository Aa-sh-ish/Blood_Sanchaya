import 'package:blood_sanchaya/ButtomNavi.dart';
import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/login.dart';
import 'package:blood_sanchaya/services/auth_Services.dart';
import 'package:blood_sanchaya/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
      publicKey: "test_public_key_158e96969237452c9be5e153dcbc391c",
      enabledDebugging: false);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Blood Sanchaya',
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).userModel.token.isEmpty
          ? LoginPage()
          : BottonNav2(),
    );
  }
}
