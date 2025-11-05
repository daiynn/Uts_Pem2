import 'package:flutter/material.dart';

void main() {
  runApp(const JokiApp());
}

class JokiApp extends StatelessWidget {
  const JokiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Joki Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Pricedown',
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PembayaranPage(),
    const HistoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: 'Pembayaran'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.redAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Konten utama
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  atasan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "JokiGame+ 🎮",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Naik Rank Sekarang, Tanpa Stres!",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const SizedBox(height: 20),

                  // Banner utama
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/gold and glory.jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Promo Spesial! Diskon Hingga 50%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Game Populer
                  const Text(
                    "Game Populer 🔥",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.9,
                      children: [
                        buildGameCard('Mobile Legends', 'assets/ml.jpg'),
                        buildGameCard('PUBG Mobile', 'assets/pubg.jpg'),
                        buildGameCard('Free Fire', 'assets/ff.jpg'),
                        buildGameCard('Genshin Impact', 'assets/genshin.jpg'),
                        buildGameCard('Honkai Impact 3', 'assets/honkai.jpg'),
                        buildGameCard('Delta Force', 'assets/delta force.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Widget Game Card
  Widget buildGameCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Pembayaran 💳',
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Riwayat Pesanan 🕒',
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
