import 'package:flutter/material.dart';
import 'package:figma_app/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Chat Terbaru',
          style: bold18.copyWith(color: green2),
        ),
        const SizedBox(height: 16),
        _chatTile(
          avatar: 'assets/images/avatar.png',
          name: 'Driver GoRide',
          message: 'Saya sudah sampai di lokasi, kak.',
          time: '08:20',
          unread: true,
        ),
        _chatTile(
          avatar: 'assets/images/avatar.png',
          name: 'GoFood - Ayam Geprek',
          message: 'Pesananmu sedang diproses.',
          time: 'Kemarin',
          unread: false,
        ),
        _chatTile(
          avatar: 'assets/images/avatar.png',
          name: 'Merchant GoMart',
          message: 'Terima kasih sudah belanja di GoMart!',
          time: '2 hari lalu',
          unread: false,
        ),
      ],
    );
  }

  Widget _chatTile(
      {required String avatar,
      required String name,
      required String message,
      required String time,
      bool unread = false}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: green2.withOpacity(0.15),
          backgroundImage: AssetImage(avatar),
        ),
        title: Text(
          name,
          style: semibold14.copyWith(color: dark1),
        ),
        subtitle: Text(
          message,
          style: regular14.copyWith(color: unread ? green2 : dark3),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: regular12_5.copyWith(color: dark3),
            ),
            if (unread)
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: green2,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
