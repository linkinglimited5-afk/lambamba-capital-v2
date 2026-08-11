import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(LambambaApp());

class LambambaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  void showMoMo(BuildContext context) {
    showDialog(context: context, builder: (c) => AlertDialog(
      backgroundColor: Color(0xFF0A1931),
      title: Text('Deposit via MoMo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      content: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFFFC107), borderRadius: BorderRadius.circular(12)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('MTN MoMo: 0537613225', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black)),
          Divider(),
          Text('ROMANUS DINYELU UDEMEZUE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ])),
      actions: [
        TextButton(onPressed: ()=> Navigator.pop(c), child: Text('Cancel')),
        ElevatedButton(
          onPressed: () async {
            final Uri url = Uri.parse('https://api.whatsapp.com/send?phone=233537613225&text=Hello%20I%20paid%20to%200537613225');
            await launchUrl(url, mode: LaunchMode.externalApplication);
          },
          child: Text('I Have Paid - Open WhatsApp'),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(radius: 50, backgroundColor: Color(0xFFFDAF37), child: Text('LC', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black))),
        SizedBox(height: 15),
        Text('LAMBAMBA CAPITAL', style: TextStyle(color: Color(0xFFFDAF37), fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 40),
        Padding(padding: EdgeInsets.symmetric(horizontal: 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFDAF37), minimumSize: Size(double.infinity, 50)),
            onPressed: ()=> showMoMo(context),
            child: Text('INVEST NOW', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          )),
      ])),
    );
  }
}
