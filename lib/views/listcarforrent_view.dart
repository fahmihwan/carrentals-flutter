import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_project_1/blocs/car_bloc.dart';
import 'package:tes_project_1/models/car_model.dart';
import 'package:http/http.dart' as http;

// ListCarForRent
class ListCarForRent extends StatelessWidget {
  const ListCarForRent({super.key});

  Future<List<dynamic>> fetchCar() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.10:3000/api/cars'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse['data'];
    } else {
      throw Exception("wkwkkw");
    }
    // return
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<dynamic>>(
      future: fetchCar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return _CardImage();
              // return ListTile(
              // title: Text(users[index]['merk']),
              // );
            },
          );
        }
      },
    ));

    // return Scaffold(
    //     backgroundColor: Colors.blue,
    //     appBar: AppBar(
    //       leading: IconButton(
    //         icon: const Icon(Icons.arrow_back),
    //         onPressed: () {
    //           Navigator.pop(context); // kembali ke halaman sebelumnya
    //         },
    //       ),
    //     ),
    //     body: ListView(
    //       children: [
    //         _CardImage(),
    //         _CardImage(),
    //         _CardImage(),
    //         _CardImage(),
    //       ],
    //     ));
  }
}

class _CardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail-car',
        );
      },
      child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Toyota",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Image.network(
                          width: 150.0,
                          'https://cdn2.rcstatic.com/images/car_images_b/web/toyota/agya_lrg.jpg')
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("2 baggages"),
                          Text("6 seats"),
                        ],
                      ),
                      Text("Automatic Transmission"),
                      Text("AE 2033 BB"),
                      Text("1922"),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2, // ketebalan garis
                color: Color.fromARGB(255, 229, 229, 229), // warna garis
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: '200000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' / day.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ])))
              // Text("dsds")
            ],
          )),
    );
  }
}
