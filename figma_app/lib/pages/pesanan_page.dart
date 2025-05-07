import 'package:flutter/material.dart';
import 'package:figma_app/theme.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Riwayat Pesanan',
          style: bold18.copyWith(color: green2),
        ),
        const SizedBox(height: 16),
        _orderTile(
          icon: Icons.motorcycle,
          title: 'GoRide ke Kampus',
          status: 'Selesai',
          time: 'Hari ini, 08:15',
          color: green2,
        ),
        _orderTile(
          icon: Icons.fastfood,
          title: 'GoFood - Ayam Geprek',
          status: 'Dibatalkan',
          time: 'Kemarin, 19:02',
          color: red,
        ),
        _orderTile(
          icon: Icons.local_grocery_store,
          title: 'GoMart - Indomaret',
          status: 'Selesai',
          time: '2 hari lalu, 14:30',
          color: blue2,
        ),
        _orderTile(
          icon: Icons.local_taxi,
          title: 'GoCar ke Mall',
          status: 'Selesai',
          time: '3 hari lalu, 10:00',
          color: green2,
        ),
      ],
    );
  }

  Widget _orderTile(
      {required IconData icon,
      required String title,
      required String status,
      required String time,
      required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: semibold14.copyWith(color: dark1)),
        subtitle: Text(time, style: regular12_5.copyWith(color: dark3)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: status == 'Selesai'
                ? green1.withOpacity(0.1)
                : red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: semibold12_5.copyWith(
              color: status == 'Selesai' ? green2 : red,
            ),
          ),
        ),
      ),
    );
  }
}
