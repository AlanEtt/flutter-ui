import 'package:flutter/material.dart';
import 'package:figma_app/theme.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Promo Pilihan Untukmu',
          style: bold18.copyWith(color: green2),
        ),
        const SizedBox(height: 16),
        _promoCard(
          context,
          image: 'assets/images/1.png',
          title: 'Diskon 50% GoFood',
          desc: 'Nikmati makan enak hemat setiap hari dengan GoFood!',
          buttonText: 'Pesan Sekarang',
        ),
        const SizedBox(height: 16),
        _promoCard(
          context,
          image: 'assets/images/2.png',
          title: 'Voucher GoRide Rp5.000',
          desc: 'Perjalanan makin murah dengan voucher GoRide.',
          buttonText: 'Cek Voucher',
        ),
        const SizedBox(height: 16),
        _promoCard(
          context,
          image: 'assets/images/3.png',
          title: 'Cashback GoPayLater',
          desc: 'Belanja di Tokopedia pakai GoPayLater, dapat cashback!',
          buttonText: 'Belanja Sekarang',
        ),
      ],
    );
  }

  Widget _promoCard(BuildContext context,
      {required String image,
      required String title,
      required String desc,
      required String buttonText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: bold16.copyWith(color: green2)),
                  const SizedBox(height: 6),
                  Text(desc, style: regular14.copyWith(color: dark2)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                    ),
                    onPressed: () {},
                    child: Text(buttonText,
                        style: semibold14.copyWith(color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
