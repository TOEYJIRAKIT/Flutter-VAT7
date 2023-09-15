import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double totalPrice = 0;
  double totalVat = 0;
  double totalNetPrice = 0;
  TextEditingController txtInputPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('VAT 7%'),
      ),
      body: Container(
          margin: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              TextField(
                controller: txtInputPrice,
                decoration: const InputDecoration(
                    hintText: 'Enter price here', 
                    border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    final inputPrice = double.tryParse(txtInputPrice.text) ?? 0.0;
                    totalPrice = inputPrice;
                    totalVat = inputPrice * 0.07;
                    totalNetPrice = inputPrice - totalVat;
                  });
                },
                child: const Icon(Icons.calculate),
              ),
              Text('Total Price: ${NumberFormat("#,###.##").format(totalPrice)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('VAT: ${NumberFormat("#,###.##").format(totalVat)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Net Price: ${NumberFormat("#,###.##").format(totalNetPrice)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
