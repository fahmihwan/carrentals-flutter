import 'package:flutter/material.dart';

class DetailCar extends StatefulWidget {
  const DetailCar({super.key});

  @override
  _DetailCarState createState() => _DetailCarState();
}

class _DetailCarState extends State<DetailCar> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 234, 234),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // kembali ke halaman sebelumnya
          },
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://cdn2.rcstatic.com/images/car_images_b/web/toyota/agya_lrg.jpg',
            fit: BoxFit.fitWidth,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Toyota Avanza 2022",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const Text("DKI JAKARTA - KOTA JAKARTA SELATAN"),
                  const Text("Rp. 3000000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text("2 baggages"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text("6 seats"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text("Automatic Transmisson"),
                      ),
                      // Text(""),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      _radioButton(
                          1, 'Gambar 2', 'assets/images/logo-payment/bca.png'),
                      _radioButton(
                          2, 'Gambar 2', 'assets/images/logo-payment/bni.png'),
                      _radioButton(3, 'Gambar 2',
                          'assets/images/logo-payment/briva.png'),
                      _radioButton(4, 'Gambar 2',
                          'assets/images/logo-payment/mandiri.png'),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _radioButton(int value, String label, String imagePath) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedValue = value;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio<int>(
                value: value,
                groupValue: _selectedValue,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
              ),
              Image.asset(imagePath, width: 150, height: 100),
              // Text(label),
            ],
          ),
        ));
  }
}
