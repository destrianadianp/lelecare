import 'package:flutter/material.dart';

class CustomHeroImage extends StatelessWidget {
  const CustomHeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 0))
        ],
        image: const DecorationImage(
          image: AssetImage(
            'assets/banner.png',
            ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
