import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:pengelolaan_lele/peternak_page.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tutorial Budidaya',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()));
          },
        ),
      ),
      body: TutorialHalaman(),
    );
  }
}

class TutorialHalaman extends StatelessWidget {
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
                title: '7 Ciri Bibit Ikan Lele Berkualitas agar Budidaya Lancar',
                imageUrl:
                    'https://wpheadless.efishery.com/wp-content/uploads/2023/01/bibit-ikan-lele.webp',
                urlToPage: 'https://efishery.com/id/resources/bibit-ikan-lele/'
              ),
              SizedBox(height: 11),
              PeternakCard(
                title: 'Probiotik Ikan Lele: Tips, Cara Pakai, dan Pembuatannya',
                imageUrl:
                    'https://wpheadless.efishery.com/wp-content/uploads/2023/01/probiotik-ikan-lele.webp',
                urlToPage: 'https://efishery.com/id/resources/probiotik-ikan-lele/'
              ),
              SizedBox(height: 11),
              PeternakCard(
                title: 'Cara Budidaya Ikan Lele bagi Pemula di Kolam Terpal',
                imageUrl: 'https://dkpp.bulelengkab.go.id/public/uploads/konten/58_cara-budidaya-ikan-lele-bagi-pemula-di-kolam-terpal.jpg',
                urlToPage: 'https://dkpp.bulelengkab.go.id/informasi/detail/artikel/58_cara-budidaya-ikan-lele-bagi-pemula-di-kolam-terpal'
              ),
            ],
          ),
        ]
      )
    );
  }
}