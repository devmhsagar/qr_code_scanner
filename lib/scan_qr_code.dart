import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/result_screen.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

const bgColor = Color(0xfffafafa);

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  MobileScannerController cameraController = MobileScannerController();
  bool isScannedCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;

  void closeScanner() {
    setState(() {
      isScannedCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
            cameraController.toggleTorch();
          }, icon: Icon(Icons.flash_on, color: isFlashOn ? Colors.blue : Colors.grey),),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera = !isFrontCamera;
            });
            cameraController.switchCamera();
          }, icon:  Icon(Icons.camera_front, color: isFrontCamera ? Colors.blue : Colors.grey),)
        ],
        iconTheme:  const IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: const Text(
          'QR Scanner',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 1,
          ),
        ),
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
                  Text(
                    'Scan QR Code Result Automatic Generated',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    allowDuplicates: true,
                    controller: cameraController,
                    onDetect: (barcode, args) {
                      if (!isScannedCompleted) {
                        String code = barcode.rawValue ?? '---'; // Access the scanned data from the 'code' property
                        setState(() {
                          isScannedCompleted = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              code: code,
                              closeScanner: closeScanner,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(overlayColor: bgColor.withOpacity(0.5),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Developed by: MH Sagar',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
