import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/artikel_page.dart';
import 'package:pengelolaan_lele/home_page.dart';

class PeternakPage extends StatelessWidget {
  const PeternakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peternak Hebat',
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
      body: PeternakHalaman(),
    );
  }
}

class PeternakHalaman extends StatelessWidget {
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
                title: 'Kisah Gustavian, Usia 26 Tahun Sukses Bisnis Budidaya Lele',
                imageUrl:
                    'https://asset-2.tstatic.net/aceh/foto/bank/images/Kisah-Gustavian-Usia-26-Tahun-Sukses-Bisnis-Budidaya-Lele-Omzet-Rp-500-juta-Panen-12-TonBulan.jpg',
                urlToPage: 'https://aceh.tribunnews.com/2023/08/15/kisah-gustavian-usia-26-tahun-sukses-bisnis-budidaya-lele-omzet-capai-rp-500-juta-per-bulan#:~:text=Adalah%20Gustavian%20Ahmad%20Rifai%2C%20anak,%2C%20Kabupaten%20Kediri%2C%20Jawa%20Timur',
              ),
              SizedBox(height: 11),
              PeternakCard(
                title: 'Cerita Bripka Heidi Sukses Jadi Peternak Lele, Terinspirasi Tekuni Bisnis Setelah Tilang Seorang Pengendara',
                imageUrl:
                    'https://asset.kompas.com/crops/MQoLYRVGX1d-neWHgeyJNZnhxoI=/0x0:0x0/750x500/data/photo/2020/10/12/5f844e96bb45e.jpg',
                urlToPage: 'https://regional.kompas.com/read/2020/10/13/06070021/cerita-bripka-heidi-sukses-jadi-peternak-lele-terinspirasi-tekuni-bisnis?page=all#:~:text=Awalnya%2C%20Heidi%20membuat%20satu%20petak%20kolam%20lele%20dengan%20kapasitas%206.000%20bibit.&text=%22Dari%20hasil%20panennya%20saya%20dapat,Pabean%2C%20Kecamatan%20Dringu%2C%20Probolinggo'
              ),
                SizedBox(height: 11),
                PeternakCard(
                  title: 'Kisah Sukses Warga Tegalrejo Panen 600 Ton Lele per Bulan dari 2.000 Kolam',
                  imageUrl: 'https://cdn1-production-images-kly.akamaized.net/DMTLBhdQmO29ZYNgERjCa1MzqJ4=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3254563/original/058358500_1601516842-Pengasapan-Lele2.jpg',
                  urlToPage: 'https://www.liputan6.com/jateng/read/4872751/kisah-sukses-warga-tegalrejo-panen-600-ton-lele-per-bulan-dari-2000-kolam#:~:text=MKP%20Sakti%20Wahyu%20Trenggono%20dalam,yang%20tersebar%20pada%202.000%20kolam'
                ),
              ],
            ),
        ]
      )
    );
  }
}

class PeternakCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String urlToPage;


  const PeternakCard({
    super.key, 
    required this.title, 
    required this.imageUrl, 
    required this.urlToPage
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
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 300,
            height: 150,
            margin: EdgeInsets.only(top: 8, bottom: 0, left: 8, right: 8), // Kurangi margin di bagian bawah
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 300,
                height: 150,
              ),
            ),
          ),
          Container(
            width: 300,
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
            child: 
            Text(
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