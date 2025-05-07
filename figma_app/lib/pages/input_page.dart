import 'package:flutter/material.dart';
import 'package:figma_app/theme.dart';

class InputPage extends StatefulWidget {
  final String mode;
  const InputPage({Key? key, this.mode = 'Bayar'}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();

  bool get isFilled =>
      _nominalController.text.isNotEmpty && _tujuanController.text.isNotEmpty;

  @override
  void dispose() {
    _nominalController.dispose();
    _tujuanController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  IconData get _icon {
    switch (widget.mode.toLowerCase()) {
      case 'top up':
      case 'Top Up':
        return Icons.account_balance_wallet;
      case 'eksplor':
      case 'Eksplor':
        return Icons.explore;
      default:
        return Icons.send;
    }
  }

  Color get _color {
    switch (widget.mode.toLowerCase()) {
      case 'top up':
      case 'Top Up':
        return blue2;
      case 'eksplor':
      case 'Eksplor':
        return purple;
      default:
        return green2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_icon, color: Colors.white),
            const SizedBox(width: 8),
            Text('${widget.mode} Transaksi',
                style: bold16.copyWith(color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Masukkan Data', style: bold18.copyWith(color: _color)),
            const SizedBox(height: 24),
            _inputField(
              controller: _nominalController,
              label: 'Nominal',
              hint: 'Masukkan nominal (Rp)',
              icon: Icons.attach_money,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18),
            _inputField(
              controller: _tujuanController,
              label: 'Tujuan',
              hint: 'Masukkan nomor/tujuan',
              icon: Icons.account_circle,
            ),
            const SizedBox(height: 18),
            _inputField(
              controller: _catatanController,
              label: 'Catatan (opsional)',
              hint: 'Tulis catatan untuk transaksi',
              icon: Icons.edit_note,
              maxLines: 2,
            ),
            const SizedBox(height: 32),
            Center(
              child: _actionButton(widget.mode, _color, _icon, isFilled),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: semibold14.copyWith(color: dark1)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: _color),
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF7F7F7),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: dark4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: dark4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: _color, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(String label, Color color, IconData icon, bool enabled) {
    return ElevatedButton.icon(
      onPressed: enabled
          ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$label berhasil!')),
              );
            }
          : null,
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: semibold14.copyWith(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? color : dark3,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: enabled ? 3 : 0,
      ),
    );
  }
}
