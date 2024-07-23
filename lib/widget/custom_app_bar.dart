import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final User? currentUser;

  const CustomAppBar({Key? key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    //String displayName = currentUser?.displayName ?? "Tidak Diketahui";
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: const BorderRadius.all(Radius.zero),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg"),
                  ),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentUser?.displayName ?? "",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    currentUser?.email ?? "",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
