import 'package:flutter/material.dart';
import 'package:qr_code_scanner/scan_qr_code.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Scanner',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 1,
          ),),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Scanner Result',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                letterSpacing: 1,
              ),),
            SizedBox(height: 10),
            Text('Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                letterSpacing: 1,
              ),),
          ],
        ),
      ),
    );
  }
}
