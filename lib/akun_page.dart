import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/editprofil_page.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:pengelolaan_lele/login_page.dart';
import 'package:pengelolaan_lele/panduan_page.dart';
import 'package:pengelolaan_lele/informasi_page.dart';


class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  int _currentIndex = 3;

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
}

  @override
  Widget build(BuildContext context) {
   // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: AkunHalaman(currentUser: getCurrentUser()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set currentIndex to the index of "Panduan"
        onTap: (index) {
          setState(() {
            _currentIndex = 3;
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
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformasiPage()),
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
            icon: Icon(Icons.newspaper_rounded, color: _currentIndex == 2 ? Color(0xFFFAFAFA): Colors.grey), label: "Informasi"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _currentIndex == 3 ? Colors.blue.shade900: Colors.grey), label: "Akun"),
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
        elevation: 50,
        iconSize: 20,
      ),
    );
  }
}

class AkunHalaman extends StatelessWidget {
  final User? currentUser;

  const AkunHalaman({super.key, this.currentUser});

  @override
  Widget build(BuildContext context) {
    print("Nama Tampilan Pengguna: ${currentUser?.displayName}");

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 95,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg"),
                                    ),
                                    borderRadius: BorderRadius.circular(65),
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  currentUser?.displayName ?? "",
                                  style: GoogleFonts.inter(
                                    color: Colors.blue.shade900,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  currentUser?.email ?? "",
                                  style: GoogleFonts.inter(
                                    color: Colors.blue.shade900,
                                    fontSize: 12
                                  ),
                                ),
                                SizedBox(height:30),
                                AkunCard(
                                  iconData: Icons.person, // Ganti dengan ikon yang diinginkan
                                  text: "Edit Profil",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfilPage(currentUser: currentUser),
                                      ),
                                      
                                    );
                                    
                                  },
                                ),
                                SizedBox(height: 4),
                                AkunCard(
                                iconData: Icons.logout, // Ganti dengan ikon yang diinginkan
                                text: "Logout Akun",
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut();
                                
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(), // Ganti dengan halaman awal atau halaman login Anda
                                  ),
                                );
                                }
                                )                                                              
                              ]
                            )
                ]
              ),
                      )
            ]
          )
                ]
        )
            ]
      )
    )
      )
      );

  }
}

class AkunCard extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function()? onTap;

  const AkunCard({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          width: 320,
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.blue.shade900, // Ganti dengan warna ikon yang diinginkan
              ),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  color: Colors.blue.shade900, // Ganti dengan warna teks yang diinginkan
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
