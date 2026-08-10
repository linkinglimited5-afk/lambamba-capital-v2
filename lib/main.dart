import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF0A1931),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_balance, size: 80, color: Colors.amber),
              SizedBox(height: 20),
              Text("LAMBAMBA CAPITAL", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Investment & Growth", style: TextStyle(color: Colors.white70)),
              SizedBox(height: 40),
              ElevatedButton(onPressed: (){}, child: Text("Get Started"))
            ],
          ),
        ),
      ),
    );
  }
}
