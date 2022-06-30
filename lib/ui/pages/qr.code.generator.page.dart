import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorPage extends StatefulWidget {
  const QRCodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<QRCodeGeneratorPage> createState() => _QRCodeGeneratorPageState();
}

class _QRCodeGeneratorPageState extends State<QRCodeGeneratorPage> {
  TextEditingController _controller = TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRCode Generator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: data,
            size: 200,
          ),
          Container(

            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5))),
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
