import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:pengelolaan_lele/panduan_page.dart';
import 'package:pengelolaan_lele/akun_page.dart';
import 'package:pengelolaan_lele/peternak_page.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({Key? key}) : super(key: key);

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
   // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi & Berita Terbaru'),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: InformasiHalaman(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set currentIndex to the index of "Panduan"
        onTap: (index) {
          setState(() {
            _currentIndex = 2;
          if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            }
            else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PanduanPage()),
              );
            }
            else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AkunPage()),
              );
            }
        });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFAFAFA),
            icon: Icon(Icons.home_outlined, color: _currentIndex == 0 ? Color(0xFFFAFAFA): Colors.grey), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_outlined, color: _currentIndex == 1 ? Color(0xFFFAFAFA): Colors.grey), label: "Panduan"),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined, color: _currentIndex == 2 ? Colors.blue.shade900: Colors.grey), label: "Informasi"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: _currentIndex == 3 ? Color(0xFFFAFAFA): Colors.grey), label: "Akun"),
        ],
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.inter(
          color: Colors.blue.shade900,
          fontSize: 12
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          color: Colors.grey,
          fontSize: 12
        ),
        type: BottomNavigationBarType.fixed, // Pastikan menetapkan type agar label selalu tampil
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        iconSize: 20,
      ),
    );
  }
}

class InformasiHalaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              PeternakCard(
                title: 'Dokter Bedah Ini Manfaatkan Lahan Sempit di Rumah untuk Beternak Lele',
                imageUrl:
                    'https://asset.kompas.com/crops/DHgd6-eb1mIQAU4QShL1NkqMxhE=/0x0:0x0/750x500/data/photo/2023/11/05/65472e554e29c.jpg',
                urlToPage: 
                    'https://lestari.kompas.com/read/2023/11/05/153735086/dokter-bedah-ini-manfaatkan-lahan-sempit-di-rumah-untuk-beternak-lele'
              ),
              SizedBox(height: 11),
              PeternakCard(
                title: 'Harga Pakan Terus Meningkat, Pembudidaya Lele Kian Terpuruk',
                imageUrl:
                    'https://cdn-assetd.kompas.id/qTN0kiVEfws-bHpwiMJ-KyBHYY8=/1280x801/filters:watermark(https://cdn-content.kompas.id/umum/kompas_main_logo.png,-16p,-13p,0)/https%3A%2F%2Fasset.kgnewsroom.com%2Fphoto%2Fpre%2F2023%2F03%2F05%2Feb0695fa-5ca0-4c30-abb8-ab1b269d0522_jpg.jpg',
                urlToPage: 
                'https://www.kompas.id/baca/ekonomi/2023/05/07/harga-pakan-terus-meningkat-pembudidaya-lele-kian-terpuruk'
              ),
                SizedBox(height: 11),
                PeternakCard(
                  title: 'Kabupaten Kediri Pecahkan Rekor MURI Penyajian Sate Lele Terbanyak',
                  imageUrl: 'https://berita.kedirikab.go.id/asset/foto_berita/lele_(2).jpeg',
                  urlToPage: 'https://berita.kedirikab.go.id/baca/2023/10/kabupaten-kediri-pecahkan-rekor-muri-penyajian-sate-lele-terbanyak'
                ),
              ],
            ),
        ]
      )
    );
  }
}


