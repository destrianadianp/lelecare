import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DatabaseReference _databaseReference =
      FirebaseDatabase(databaseURL: 'https://login-register-b3267-default-rtdb.asia-southeast1.firebasedatabase.app/').ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue.shade900,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Buat Akun",
                    style: GoogleFonts.inter(
                      color: Colors.blue.shade800,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Konfirmasi Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 40), 
                  Container(
                    height: 45,
                    width: double.infinity, // Membuat tombol memenuhi lebar maksimal
                    child: ElevatedButton(
                      onPressed: () async {
                        await registerAccount();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800, // Warna latar belakang tombol
                        onPrimary: Colors.white, // Warna teks tombol saat aktif
                        elevation: 5, // Ketinggian bayangan tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Membulatkan sudut tombol
                        ),
                      ),
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ]
          ),
        )
      )
    );
  }

  Future<void> registerAccount() async {
    try {
      // Validasi apakah kata sandi cocok
      if (passwordController.text != confirmPasswordController.text) {
        // Kata sandi tidak cocok
        print("Kata sandi tidak cocok");
        return;
      }

      // Buat akun menggunakan email dan kata sandi
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await _firebaseAuth.currentUser!.updateProfile(displayName: usernameController.text);

      // Dapatkan ID pengguna yang baru dibuat
      String userId = _firebaseAuth.currentUser!.uid;
      

      // Simpan informasi pengguna ke dalam Realtime Database
      _databaseReference.child("users").child(userId).set({
        "username": usernameController.text,
        "email": emailController.text,
        // Tambahkan informasi pengguna lainnya yang perlu Anda simpan
      });

      // Navigasikan ke halaman utama setelah pendaftaran berhasil
      // (Anda dapat menyesuaikan logika navigasi sesuai kebutuhan aplikasi Anda)
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage())); // Kembali ke halaman sebelumnya
    } catch (e) {
      print(e);
    }
  }
}
