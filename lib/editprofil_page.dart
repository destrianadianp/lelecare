import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilPage extends StatefulWidget {
  final User? currentUser;

  const EditProfilPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.currentUser?.displayName);
    emailController = TextEditingController(text: widget.currentUser?.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nama Akun'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Fungsi untuk menyimpan perubahan (bisa disesuaikan)
                _simpanPerubahan();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _simpanPerubahan() async {
    try {
      // Perbarui display name pada objek User di Firebase
      await widget.currentUser?.updateDisplayName(usernameController.text);

      // Perbarui email menggunakan re-authentication
      await _updateEmail();

      // Kembali ke halaman Akun dengan membawa objek User yang diperbarui
      Navigator.pop(context, widget.currentUser);
    } catch (error) {
      print("Error updating profile: $error");
      // Handle error jika perlu
    }
  }

  // Fungsi untuk re-authentication dan memperbarui email
  Future<void> _updateEmail() async {
    if (widget.currentUser != null) {
      try {
        // Minta password pengguna saat ini untuk re-authentication
        String password = "PasswordPengguna"; // Ganti dengan cara aman mendapatkan password pengguna

        // Buat credential untuk re-authentication
        AuthCredential credential = EmailAuthProvider.credential(
          email: widget.currentUser!.email!,
          password: password,
        );

        // Re-authenticate pengguna
        await widget.currentUser!.reauthenticateWithCredential(credential);

        // Perbarui email
        await widget.currentUser!.updateEmail(emailController.text);
      } catch (error) {
        print("Error updating email: $error");
        // Handle error jika perlu
      }
    }
  }
}
