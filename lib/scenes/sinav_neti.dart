import 'package:flutter/material.dart';
import 'package:schdule/scenes/exams_page.dart';
import 'package:schdule/scenes/sinav_ekle.dart';
import 'package:schdule/data/entity/sinavlar.dart';

class SinavNeti extends StatefulWidget {
  final Sinav sinav;
  const SinavNeti({Key? key, required this.sinav}) : super(key: key);
  @override
  State<SinavNeti> createState() => _SinavNetiState();
}

class _SinavNetiState extends State<SinavNeti> {
  final turkceNet = TextEditingController();
  final matNet = TextEditingController();
  final tarihNet = TextEditingController();
  final cografyaNet = TextEditingController();
  final felsefeNet = TextEditingController();
  final dinNet = TextEditingController();
  final fizikNet = TextEditingController();
  final kimyaNet = TextEditingController();
  final biyolojiNet = TextEditingController();
  var topNet ;





  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sınav Netleri")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField("Türkçe Neti", turkceNet),
              buildTextField("Matematik Neti", matNet),
              buildTextField("Tarih Neti", tarihNet),
              buildTextField("Coğrafya Neti", cografyaNet),
              buildTextField("Felsefe Neti", felsefeNet),
              buildTextField("Din Kültürü Neti", dinNet),
              buildTextField("Fizik Neti", fizikNet),
              buildTextField("Kimya Neti", kimyaNet),
              buildTextField("Biyoloji Neti", biyolojiNet),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("Kaydet"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {Navigator.of(context).pop(); // Net sayfasından çık
                  Navigator.of(context).pop(Sinav); // Sınav sayfasına geri dön ve veriyi geri gönder


                    print("Türkçe: ${turkceNet.text}");
                    print("Mat: ${matNet.text}");
                    print("Tarih: ${tarihNet.text}");
                    print("Coğrafya: ${cografyaNet.text}");
                    print("Felsefe: ${felsefeNet.text}");
                    print("Din: ${dinNet.text}");
                    print("Fizik: ${fizikNet.text}");
                    print("Kimya: ${kimyaNet.text}");
                    print("Biyoloji: ${biyolojiNet.text}");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}