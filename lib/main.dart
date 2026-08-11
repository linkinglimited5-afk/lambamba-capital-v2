import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const LambambaApp());
}

class LambambaApp extends StatelessWidget {
  const LambambaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lambamba Capital',
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.white),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _tapCount = 0;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _handleLogoTap() {
    _tapCount++;
    if (_tapCount >= 5) {
      _tapCount = 0;
      Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminLoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _handleLogoTap,
              child: const Icon(Icons.account_balance_wallet, size: 90, color: Colors.amber),
            ),
            const SizedBox(height: 10),
            const Text("LAMBAMBA CAPITAL", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Tap logo 5x for Admin - 0537613225", style: TextStyle(color: Colors.grey, fontSize: 10)),
            const SizedBox(height: 40),
            TextField(controller: _emailController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: "Email", labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _passController, obscureText: true, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: "Password", labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder())),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
              child: const Text("LOGIN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 10),
            const Text("ROMANUS DINYELU UDEMEZUE", style: TextStyle(color: Colors.amber, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _openWhatsApp(BuildContext context) async {
    const phone = "233537613225";
    const message = "Hello LAMBAMBA CAPITAL, I have paid. My name is:, Amount: GHS, Please confirm. 0537613225 ROMANUS";
    final Uri url = Uri.parse("https://wa.me/$phone?text=${Uri.encodeComponent(message)}");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not open WhatsApp")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lambamba Capital"), backgroundColor: Colors.green, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green)), child: const Column(children: [Text("Your Balance", style: TextStyle(fontSize: 16)), SizedBox(height: 8), Text("GHS 0.00", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green)), Text("Invest and Earn Daily!", style: TextStyle(color: Colors.grey))])),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Enter Amount to Deposit (GHS)", border: OutlineInputBorder(), prefixText: "GHS ")),
            const SizedBox(height: 16),
            Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.amber[100], borderRadius: BorderRadius.circular(8)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("PAY TO:", style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 4), Text("MTN MoMo: 0537613225"), Text("Name: ROMANUS DINYELU UDEMEZUE"), Text("Reference: Your Phone Number")])),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => _openWhatsApp(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 55)), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.chat, color: Colors.white), SizedBox(width: 10), Text("I Have Paid - Open WhatsApp", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))])),
            const SizedBox(height: 12),
            const Text("After paying, tap button above to confirm to 0537613225 via WhatsApp Business", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// ===== SECRET ADMIN PANEL - PASSWORD Lambamba2026 =====
class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});
  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _passController = TextEditingController();
  void _checkPass() {
    if (_passController.text == "Lambamba2026") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdminDashboard()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wrong Password Boss!")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("CEO LOGIN - ROMANUS"), backgroundColor: Colors.amber, foregroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.admin_panel_settings, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            const Text("Enter Admin Password", style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 20),
            TextField(controller: _passController, obscureText: true, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: "Password", hintStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)))),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _checkPass, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)), child: const Text("ENTER DASHBOARD", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            const Text("0537613225 - ROMANUS DINYELU UDEMEZUE", style: TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ),
      ),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CEO DASHBOARD - TOTAL CONTROL"), backgroundColor: Colors.green, foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(12)), child: const Column(children: [Text("Total Deposits Today"), Text("GHS 0.00", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)), Text("WhatsApp Business: 0537613225", style: TextStyle(color: Colors.grey))])),
          const SizedBox(height: 20),
          const Text("Recent Payments - Click to Approve", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          Card(child: ListTile(leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.person, color: Colors.white)), title: const Text("No deposits yet - System Ready"), subtitle: const Text("When customers tap 'I Have Paid', they will message your WhatsApp Business"), trailing: Chip(label: Text("WAITING"), backgroundColor: Colors.amber))),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Next: We will connect Firebase Database!"))); }, style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)), child: const Text("CONNECT TO DATABASE (Next Step)", style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
