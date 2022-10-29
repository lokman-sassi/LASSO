import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_app/forum.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:onboarding_app/qrcode.dart';
import 'package:onboarding_app/chatbot.dart';

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lasso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black.withOpacity(0.8),
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
            bodyMedium: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold))),
      ),
      home: const MyHomePage(title: 'Predictor Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black.withOpacity(0.8),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.online_prediction_sharp),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Qr-code',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.voice_chat_rounded),
            label: 'Google\n assistant',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}

List<Widget> pages = <Widget>[
  Ronaldo(),
  ScanQR(),
  Chat(),
];
