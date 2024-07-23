import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:pengelolaan_lele/informasi_page.dart';
import 'package:pengelolaan_lele/akun_page.dart';


class PanduanPage extends StatefulWidget {
  const PanduanPage({Key? key}) : super(key: key);

  @override
  State<PanduanPage> createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Budidaya'),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: PanduanHalaman(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set currentIndex to the index of "Panduan"
        onTap: (index) {
          setState(() {
            _currentIndex = 1;
          if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            }
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformasiPage()),
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
            icon: Icon(Icons.my_library_books_rounded, color: _currentIndex == 1 ? Colors.blue.shade900: Colors.grey), label: "Panduan"),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded, color: _currentIndex == 2 ? Color(0xFFFAFAFA): Colors.grey), label: "Informasi"),
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
        elevation: 50,
        iconSize: 20,
      ),
    );
  }
}

class PanduanHalaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Persiapan Kolam',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF002E58),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Tahap pertama dalam budidaya ikan lele adalah dengan memilih jenis kolam yang sesuai dengan lingkungan, budget, dan kemampuan perawatan Anda.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PanduanCard(
                  title: 'Kolam Terpal',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/17120756/Kolam-terpal.png',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Semen (Beton)',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/17120607/Kolam-air-deras.png',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Tanah',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/17120509/kolam-tanah.png',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Keramba (Jaring Apung)',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/18104342/Keramba.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Fiber',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/18104624/kolam-fiber.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Drum',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/18104454/kolam-drum.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Kolam Plastik',
                  imageUrl: 'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/06/18104730/kolam-plastik.jpg',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pemilihan Benih',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF002E58),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Tahapan kedua dalam proses budidaya ikan lele adalah proses pemilihan bibit lele.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PanduanCard(
                  title: 'Lele Mutiara',
                  imageUrl: 'https://wpheadless.efishery.com/wp-content/uploads/2022/09/lele-mutiara.webp',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Lele Dumbo',
                  imageUrl: 'https://wpheadless.efishery.com/wp-content/uploads/2022/09/ikan-lele-dumbo.webp',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Lele Sangkuriang',
                  imageUrl: 'https://wpheadless.efishery.com/wp-content/uploads/2022/09/ikan-lele-sangkuriang.webp',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Lele Lokal',
                  imageUrl: 'https://wpheadless.efishery.com/wp-content/uploads/2022/09/ikan-lele-lokal.webp',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Lele Phyton',
                  imageUrl: 'https://wpheadless.efishery.com/wp-content/uploads/2022/09/ikan-lele-phyton.webp',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pemilihan Pakan',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF002E58),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Pakan ikan lele sangat perlu diperhatikan, penting untuk memberikan pakan yang seimbang dan berkualitas untuk menjaga kesehatan dan pertumbuhan yang optimal.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PanduanCard(
                  title: 'Pelet Ikan',
                  imageUrl: 'https://pndice.com/wp-content/uploads/2023/03/1d11cf10cf4b3301f7b40071f8d32d10.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Jangkrik',
                  imageUrl: 'https://pndice.com/wp-content/uploads/2023/03/6f30fc99db5bbbfa29b77e5d7952a0a0.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Cacing Tanah',
                  imageUrl: 'https://pndice.com/wp-content/uploads/2023/03/f9cae4a7b849f46bc39bca827c557cb3.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Lumut',
                  imageUrl: 'https://pndice.com/wp-content/uploads/2023/03/7fc9a6fbadc00836e7d2c64585876dec.jpg',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Sayuran',
                  imageUrl: 'https://pndice.com/wp-content/uploads/2023/03/4e9a7268cc412ffc35c78c24b48fbd1c.jpg',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pemilihan Obat',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF002E58),
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Obat untuk ikan lele haruslah tersedia pada sebuah pembudidayaan. Hal tersebut dikarenakan, ada banyak jenis penyakit yang bisa menyerang ikan kapanpun dengan berbagai macam penyebab.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PanduanCard(
                  title: 'Pupuk Organik Kolam MB',
                  imageUrl: 'https://down-id.img.susercontent.com/file/d49a7de514bf2df5191a725437828ab2'
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'ProHerbal Plus MB',
                  imageUrl: 'https://images.tokopedia.net/img/cache/700/product-1/2018/10/1/3101395/3101395_e6eae3da-b07d-4319-aea0-4fc3a1b60b6f_540_540.jpg.webp',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Disinfeksi',
                  imageUrl: 'https://e-katalog.lkpp.go.id/katalog/produk/download/gambar/961884730',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Multivitamin',
                  imageUrl: 'https://down-id.img.susercontent.com/file/sg-11134201-22100-6839xw60gziv0d',
                ),
                SizedBox(width: 11),
                PanduanCard(
                  title: 'Blue Green',
                  imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/5/25/5f0138dc-28c4-452d-840c-02eb54b41e9b.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class PanduanCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  PanduanCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi yang diinginkan saat kartu di-tap di sini
        print('Card tapped!');
      },
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 191,
            height: 90,
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
                width: 191,
                height: 90,
              ),
            ),
          ),
          Container(
            width: 191,
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


