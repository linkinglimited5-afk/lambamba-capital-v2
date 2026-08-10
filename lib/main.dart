import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1931),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120, height: 120,
              decoration: BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle),
              child: Center(child: Text("LB", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black))),
            ),
            SizedBox(height: 30),
            Text("LAMBAMBA CAPITAL", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37), letterSpacing: 1.2)),
            SizedBox(height: 8),
            Text("Your Investment, Our Priority", style: TextStyle(fontSize: 16, color: Colors.white70)),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InvestPage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37), minimumSize: Size(250, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Text("INVEST NOW", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioPage()));
              },
              style: OutlinedButton.styleFrom(minimumSize: Size(250, 55), side: BorderSide(color: Color(0xFFD4AF37)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: Text("MY PORTFOLIO", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class InvestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1931),
      appBar: AppBar(title: Text("Invest Now"), backgroundColor: Color(0xFFD4AF37), foregroundColor: Colors.black),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.trending_up, size: 80, color: Color(0xFFD4AF37)),
        SizedBox(height: 20),
        Text("Start Investing Today", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("GHS 500 minimum - 15% monthly ROI", style: TextStyle(color: Colors.white70)),
        SizedBox(height: 30),
        ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Investment Feature Coming Soon!'))); }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37)), child: Text("Deposit via MoMo", style: TextStyle(color: Colors.black)))
      ])),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1931),
      appBar: AppBar(title: Text("My Portfolio"), backgroundColor: Color(0xFFD4AF37), foregroundColor: Colors.black),
      body: Padding(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xFFD4AF37), borderRadius: BorderRadius.circular(15)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Total Portfolio Value", style: TextStyle(color: Colors.black54)),
          SizedBox(height: 5),
          Text("GHS 125,430.00", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 10),
          Text("+ GHS 12,430 profit this month (11%)", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600))
        ])),
        SizedBox(height: 30),
        Text("Your Investments", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        ListTile(leading: Icon(Icons.account_balance_wallet, color: Color(0xFFD4AF37)), title: Text("Gold Vault Plan", style: TextStyle(color: Colors.white)), subtitle: Text("GHS 85,000 - Active", style: TextStyle(color: Colors.white70)), trailing: Text("+15%", style: TextStyle(color: Colors.green))),
        Divider(color: Colors.white24),
        ListTile(leading: Icon(Icons.show_chart, color: Color(0xFFD4AF37)), title: Text("Agri Growth Fund", style: TextStyle(color: Colors.white)), subtitle: Text("GHS 40,430 - Active", style: TextStyle(color: Colors.white70)), trailing: Text("+8%", style: TextStyle(color: Colors.green))),
      ])),
    );
  }
}
