import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'global_audio.dart';

void main() {
  runApp(const JokiApp());
}

//////////////////////////////////////////////////////
//            JOKI APP
//////////////////////////////////////////////////////

class JokiApp extends StatefulWidget {
  const JokiApp({super.key});

  @override
  State<JokiApp> createState() => _JokiAppState();
}

class _JokiAppState extends State<JokiApp> {
  @override
  void initState() {
    super.initState();
    GlobalAudio.startMusic();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokiGame+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Pricedown',
      ),
      home: const SplashScreen(),
    );
  }
}

//////////////////////////////////////////////////////
//                     SPLASH SCREEN
//////////////////////////////////////////////////////

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videogame_asset,
                size: 80, color: Color.fromARGB(255, 13, 186, 255)),
            SizedBox(height: 20),
            Text(
              "JokiGame+",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
//                     LOGIN PAGE
//////////////////////////////////////////////////////

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  String? errorText;

  void login() {
    if (userC.text == "derian" && passC.text == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      setState(() {
        errorText = "Username atau password salah!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.videogame_asset,
                  color: Colors.redAccent, size: 70),
              const SizedBox(height: 20),
              const Text(
                "Login JokiGame+",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: userC,
                decoration: textInput("Username"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passC,
                obscureText: true,
                decoration: textInput("Password"),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 10),
                Text(errorText!,
                    style: const TextStyle(color: Colors.redAccent)),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                style: btn(),
                child: const Text("Login"),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
                child: const Text("Belum punya akun? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
//                     REGISTER PAGE
//////////////////////////////////////////////////////

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userC = TextEditingController();
    final TextEditingController passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            TextField(
              controller: userC,
              decoration: textInput("Buat Username"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passC,
              decoration: textInput("Buat Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: btn(),
              child: const Text("Daftar"),
            )
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
//                 INPUT DEKORASI
//////////////////////////////////////////////////////

InputDecoration textInput(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.white70),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white38),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

ButtonStyle btn() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

//////////////////////////////////////////////////////
//                     MAIN PAGE
//////////////////////////////////////////////////////

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = [
    const HomePage(),
    const ListInfoPage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() => index = value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Informasi"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////
//                     HOME PAGE
//////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> games = const [
    {"title": "Mobile Legends", "image": "assets/ml.jpg"},
    {"title": "PUBG Mobile", "image": "assets/pubg.jpg"},
    {"title": "Free Fire", "image": "assets/ff.jpg"},
    {"title": "Genshin Impact", "image": "assets/genshin.jpg"},
    {"title": "Honkai Impact 3", "image": "assets/honkai.jpg"},
    {"title": "Delta Force", "image": "assets/delta force.jpg"},
    {"title": "Gold and Glory", "image": "assets/gold and glory.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 0.9,
      children: games.map((game) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: AssetImage(game["image"]!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Text(
              game["title"]!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

//////////////////////////////////////////////////////
//                     LIST INFORMASI
//////////////////////////////////////////////////////

class ListInfoPage extends StatelessWidget {
  const ListInfoPage({super.key});

  final info = const [
    "Joki Mobile Legends Murah",
    "Joki PUBG Rank Cepat",
    "Joki Free Fire 100% Aman",
    "Joki Genshin Artifact + Level",
    "Top Up Game Termurah",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.redAccent),
          title: Text(info[index]),
        );
      },
    );
  }
}

//////////////////////////////////////////////////////
//                       HISTORY
//////////////////////////////////////////////////////

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Riwayat Pesanan",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
