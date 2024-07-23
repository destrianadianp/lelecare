import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/informasi_page.dart';
import 'package:pengelolaan_lele/panduan_page.dart';

class FeatureMenuList extends StatelessWidget {
  const FeatureMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
              // Navigasi ke halaman yang diinginkan saat avatar dipencet
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PanduanPage()),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF90C2F0).withOpacity(0.5),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/lele.png",
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Panduan Budidaya',
                      style: GoogleFonts.inter(
                        fontSize: 8
                      ),
                    ),
                  )
                ],
              ),              
            ),            
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
              // Navigasi ke halaman yang diinginkan saat avatar dipencet
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformasiPage()),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF90C2F0).withOpacity(0.5),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/news.png",
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Informasi Terbaru',
                      style: GoogleFonts.inter(
                        fontSize: 8
                      ),
                    ),
                  )
                ],
              ),              
            ),            
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
              // Navigasi ke halaman yang diinginkan saat avatar dipencet
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xFF90C2F0).withOpacity(0.5),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/cs.png",
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'FAQ',
                      style: GoogleFonts.inter(
                        fontSize: 8
                      ),
                    ),
                  )
                ],
              ),              
            ),            
          ],
        ),
      ],
    );
  }
}
