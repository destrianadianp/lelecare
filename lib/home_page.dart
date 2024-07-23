import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/panduan_page.dart';
import 'package:pengelolaan_lele/informasi_page.dart';
import 'package:pengelolaan_lele/akun_page.dart';
import 'package:pengelolaan_lele/tutorial_page.dart';
import 'package:pengelolaan_lele/peternak_page.dart';
import 'package:pengelolaan_lele/widget/custom_app_bar.dart';
import 'package:pengelolaan_lele/widget/custom_hero_image.dart';
import 'package:pengelolaan_lele/widget/feature_menu_list.dart';

import 'artikel_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFAFAFA),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PanduanPage()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InformasiPage()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AkunPage()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFFAFAFA),
              icon: Icon(Icons.home,
                  color:
                      _currentIndex == 0 ? Colors.blue.shade900 : Colors.grey),
              label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined,
                  color: _currentIndex == 1 ? Color(0xFFFAFAFA) : Colors.grey),
              label: "Panduan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded,
                  color: _currentIndex == 2 ? Color(0xFFFAFAFA) : Colors.grey),
              label: "Informasi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  color: _currentIndex == 3 ? Color(0xFFFAFAFA) : Colors.grey),
              label: "Akun"),
        ],
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            GoogleFonts.inter(color: Colors.blue.shade900, fontSize: 12),
        unselectedLabelStyle:
            GoogleFonts.inter(color: Colors.grey, fontSize: 12),
        type: BottomNavigationBarType
            .fixed, // Pastikan menetapkan type agar label selalu tampil
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 50,
        iconSize: 20,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(currentUser: getCurrentUser()),
              const CustomHeroImage(),
              const FeatureMenuList(),
              SizedBox(height: 20),
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tutorial Budidaya",
                                      style: GoogleFonts.inter(
                                        color: Color(0xFF002E58),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Lele Berkualitas, Peluang Usaha Terjamin!",
                                      style: GoogleFonts.inter(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 110),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TutorialPage()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 160,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TutorialCard(
                                      urlToPage:
                                          'https://efishery.com/id/resources/bibit-ikan-lele/',
                                      title:
                                          '7 Ciri Bibit Ikan Lele Berkualitas agar Budidaya Lancar',
                                      imageUrl:
                                          'https://wpheadless.efishery.com/wp-content/uploads/2023/01/bibit-ikan-lele.webp',
                                    ),
                                    SizedBox(width: 11),
                                    TutorialCard(
                                        urlToPage:
                                            'https://efishery.com/id/resources/probiotik-ikan-lele/',
                                        title:
                                            'Probiotik Ikan Lele: Tips, Cara Pakai, dan Pembuatannya',
                                        imageUrl:
                                            'https://wpheadless.efishery.com/wp-content/uploads/2023/01/probiotik-ikan-lele.webp'),
                                    SizedBox(width: 11),
                                    TutorialCard(
                                        urlToPage:
                                            'https://dkpp.bulelengkab.go.id/informasi/detail/artikel/58_cara-budidaya-ikan-lele-bagi-pemula-di-kolam-terpal',
                                        title:
                                            'Cara Budidaya Ikan Lele bagi Pemula di Kolam Terpal',
                                        imageUrl:
                                            'https://dkpp.bulelengkab.go.id/public/uploads/konten/58_cara-budidaya-ikan-lele-bagi-pemula-di-kolam-terpal.jpg'),
                                  ],
                                ),
                              ),
                            ),
                            
                            Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 0, left: 0),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Peternak Hebat",
                                              style: GoogleFonts.inter(
                                                color: Color(0xFF002E58),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "Temukan peternak lele handal hanya disini!",
                                              style: GoogleFonts.inter(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 110),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PeternakPage()),
                                            );
                                          },
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.grey[400],
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 160,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TutorialCard(
                                            urlToPage:
                                                'https://aceh.tribunnews.com/2023/08/15/kisah-gustavian-usia-26-tahun-sukses-bisnis-budidaya-lele-omzet-capai-rp-500-juta-per-bulan#:~:text=Adalah%20Gustavian%20Ahmad%20Rifai%2C%20anak,%2C%20Kabupaten%20Kediri%2C%20Jawa%20Timur',
                                            title:
                                                'Kisah Gustavian, Usia 26 Tahun Sukses Bisnis Budidaya Lele',
                                            imageUrl:
                                                'https://asset-2.tstatic.net/aceh/foto/bank/images/Kisah-Gustavian-Usia-26-Tahun-Sukses-Bisnis-Budidaya-Lele-Omzet-Rp-500-juta-Panen-12-TonBulan.jpg',
                                          ),
                                          SizedBox(width: 11),
                                          TutorialCard(
                                              urlToPage:
                                                  'https://regional.kompas.com/read/2020/10/13/06070021/cerita-bripka-heidi-sukses-jadi-peternak-lele-terinspirasi-tekuni-bisnis?page=all#:~:text=Awalnya%2C%20Heidi%20membuat%20satu%20petak%20kolam%20lele%20dengan%20kapasitas%206.000%20bibit.&text=%22Dari%20hasil%20panennya%20saya%20dapat,Pabean%2C%20Kecamatan%20Dringu%2C%20Probolinggo',
                                              title:
                                                  'Cerita Bripka Heidi Sukses Jadi Peternak Lele, Terinspirasi Tekuni Bisnis Setelah Tilang Seorang Pengendara',
                                              imageUrl:
                                                  'https://asset.kompas.com/crops/MQoLYRVGX1d-neWHgeyJNZnhxoI=/0x0:0x0/750x500/data/photo/2020/10/12/5f844e96bb45e.jpg'),
                                          SizedBox(width: 11),
                                          TutorialCard(
                                              urlToPage:
                                                  'https://www.liputan6.com/jateng/read/4872751/kisah-sukses-warga-tegalrejo-panen-600-ton-lele-per-bulan-dari-2000-kolam#:~:text=MKP%20Sakti%20Wahyu%20Trenggono%20dalam,yang%20tersebar%20pada%202.000%20kolam',
                                              title:
                                                  'Kisah Sukses Warga Tegalrejo Panen 600 Ton Lele per Bulan dari 2.000 Kolam',
                                              imageUrl:
                                                  'https://cdn1-production-images-kly.akamaized.net/DMTLBhdQmO29ZYNgERjCa1MzqJ4=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3254563/original/058358500_1601516842-Pengasapan-Lele2.jpg'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TutorialCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String urlToPage;

  TutorialCard({
    required this.title,
    required this.imageUrl,
    required this.urlToPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtikelPage(
              urlToPage: urlToPage,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 171,
            height: 90,
            margin: EdgeInsets.only(
                top: 8,
                bottom: 0,
                left: 8,
                right: 8), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 171,
                height: 40,
              ),
            ),
          ),
          Container(
            width: 171,
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.only(top: 6, bottom: 10, right: 8, left: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
