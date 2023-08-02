import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // JSON verisi
    String jsonString = '''
    {
      "id": 34,
      "name": "Hatice D.",
      "instagramPage": "@biseylergelistiriyorum",
      "job":"Software Engineer"
    }
    ''';

    // JSON verisini Map'e dönüştürüyoruz.
    Map<String, dynamic> jsonData = jsonDecode(jsonString);

    // Map verisini Employee sınıfına dönüştürüyoruz.
    Employee employee = Employee.fromJson(jsonData);

    // Employee sınıfını JSON formatına dönüştürüyoruz.
    Map<String, dynamic> employeeJson = employee.toJson();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text('JSON Serialize Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Id: ${employeeJson['id']}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Name: ${employeeJson['name']}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'InstagramPage:  ${employeeJson['instagramPage']}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Job: ${employeeJson['job']}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Employee sınıfını JSON verilerini temsil etmek için kullanıyoruz.
class Employee {
  int id;
  String name;
  String instagramPage;
  String job;
  Employee(
      {required this.id,
      required this.name,
      required this.instagramPage,
      required this.job});

  // toJson metodu, Employee sınıfını JSON formatına dönüştürür.
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'instagramPage': instagramPage, 'job': job};
  }

  // fromJson metodu, JSON verilerini Employee sınıfına dönüştürür.
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      instagramPage: json['instagramPage'],
      job: json['job'],
    );
  }
}

//JSON Serileştirme Nedir?
//Flutter'da "json_serializable" paketi, Dart sınıflarını JSON formatına dönüştürme ve JSON formatındaki verileri Dart nesnelerine dönüştürme işlemlerini kolaylaştıran bir araçtır.
// Bu paket, JSON serileştirme ve deserializasyon süreçlerini otomatikleştirmek için kullanılır.
// JSON SEileştirme Neden Kullanılır?
// JSON serialization, bir programlama dilindeki veri yapılarını JSON (JavaScript Object Notation) formatına dönüştürmeyi sağlayan bir işlemdir. JSON, verileri metin tabanlı bir formatta temsil eder ve insanlar tarafından kolayca okunabilir ve anlaşılabilir.
// JSON serialization kullanımının bazı nedenleri şunlardır:
// 1. Veri Paylaşımı: JSON, farklı platformlar arasında veri paylaşımı için yaygın olarak kullanılan bir formattır. Verileri JSON olarak serialize ederek, bu verileri başka bir uygulama veya sistemle kolayca paylaşabilirsiniz.
// 2. Veri Depolama: JSON serialization, verileri veritabanına veya dosyalara kaydetmek için kullanılabilir. Verileri JSON formatına dönüştürerek, veritabanına veya dosyalara yazmak ve okumak daha kolay hale gelir.
// 3. API İstekleri ve Yanıtları: Birçok API (Application Programming Interface), JSON formatını istekler ve yanıtlar için kullanır. Bu nedenle, uygulamaların API'larla etkileşimde bulunması için verileri JSON formatına dönüştürmeleri gerekebilir.
// 4. Veri Görselleştirme: JSON verilerini kullanarak web uygulamalarında veya mobil uygulamalarda verileri görselleştirmek veya rapor
