import 'package:flutter/material.dart';

const bgColor = Color(0xfffafafa);

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
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
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Place the QR Code in the Area',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 1,
                          ),
                        ),
                       SizedBox(height: 10),
                        Text('Scan QR Code Result Automatic Generated',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        ),
                      ],),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Developed by: MH Sagar',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        letterSpacing: 1,
                      ),),
                  ),
                ),
              ],
            )));
  }
}
