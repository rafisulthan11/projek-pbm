import 'package:flutter/material.dart';
import 'package:flutter_perlinda/views/features/bantuan_hukum.dart';
import 'package:flutter_perlinda/views/features/bantuan_psikolog.dart';
import 'package:flutter_perlinda/views/features/emergency.dart';
import 'package:flutter_perlinda/views/features/profile.dart';
import 'package:flutter_perlinda/views/features/report.dart';
import 'package:flutter_perlinda/views/features/report_history.dart';
import 'package:flutter_perlinda/views/features/undang_undang_kdrt.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Indeks item yang dipilih

  final List<String> titles = [
    'Buat Laporan',
    'Riwayat Laporan',
    'Undang-Undang KDRT',
    'Telepon Darurat',
  ];

  final List<String> images = [
    'images/buat_laporan.png',
    'images/riwayat_laporan.png',
    'images/uud_kdrt.png',
    'images/telepon_darurat.png',
  ];

  // Fungsi untuk menangani pemilihan item navigasi
  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        // Jika profil ditekan, arahkan ke halaman profil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      } else {
        _selectedIndex = index; // Perbarui indeks yang dipilih
      }
    });
  }

  void _onBoxTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuatLaporan()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportHistory()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UUDKDRTPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmergencyScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan gambar kustom dan logo
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/logo_home.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 14.0,
                  left: 16.0,
                  child: Image.asset(
                    'images/logo_perlinda.png',
                    width: 68.0,  // Sesuaikan lebar sesuai kebutuhan
                    height: 68.0, // Sesuaikan tinggi sesuai kebutuhan
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Text(
                    'Semoga harimu baik, Linda Permatasari!',
                    style: TextStyle(
                      color: Color(0xFF00355C),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0), // Spasi

            // Grid dari 4 kotak
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 kolom
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 4, // Hanya 4 item
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _onBoxTapped(index); // Tangani ketukan item
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100.0, // Tinggi yang sama untuk semua kotak
                            width: 100.0,  // Lebar yang sama untuk semua kotak
                            decoration: BoxDecoration(
                              color: Color(0xFFC1D9F1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Mengubah posisi bayangan
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0), // Spasi antara kotak dan teks
                          Text(
                            titles[index].replaceAll(' ', '\n'), // Mengganti spasi dengan newline untuk memisahkan teks menjadi 2 baris
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0, // Sesuaikan ukuran font sesuai kebutuhan
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF00355C),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Bagian bantuan
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, left: 18.0, right: 18.0),
              child: Container(
                height: 162,
                width: MediaQuery.of(context).size.width - 36, // Menggunakan lebar layar yang tersedia
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF00355C)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kamu butuh bantuan?',
                      style: TextStyle(
                        color: Color(0xFF4682A9), // Ubah warna teks
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BantuanHukumPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4682A9), // Warna latar belakang
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dapatkan Bantuan Hukum',
                            style: TextStyle(color: Colors.white, fontSize: 16.0), // Ubah warna teks
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white, // Ubah warna icon
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BantuanPsikologPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4682A9), // Warna latar belakang
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dapatkan Bantuan Psikolog',
                            style: TextStyle(color: Colors.white, fontSize: 16.0), // Ubah warna teks
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white, // Ubah warna icon
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bilah navigasi bawah
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Warna item yang dipilih
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF00355C), // Warna item yang tidak dipilih
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
