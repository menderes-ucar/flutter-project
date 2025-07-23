import 'package:flutter/material.dart';
import 'package:schdule/scenes/sinav_neti.dart';
import 'package:schdule/data/entity/sinavlar.dart';

class sinavEkle extends StatefulWidget {
  final Sinav? sinavlar;
  const sinavEkle({this.sinavlar, super.key});

  @override
  State<sinavEkle> createState() => _sinavEkleState();
}

class _sinavEkleState extends State<sinavEkle> {
  final sinavAdi = TextEditingController();
  final sinavNetleri = TextEditingController();
  final sinavDerecesi = TextEditingController();
  final sinavTarihi = TextEditingController();
  DateTime? _secilenTarih;
  String? selectedSinavTuru;
  final List<String> sinavTurleri = ['TYT', 'AYT', 'LGS', 'YKS', 'Diğer'];

Future<void> kaydet(
  var sinav_ad,
  var sinav_Neti,
  var sinav_tarihi,) async{
}

  Widget buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
      buildTextField(sinavAdi, "Sınavın Adı"),
      buildTextField(sinavNetleri, "Sınavın Neti"),

      DropdownButtonFormField<String>(
        value: selectedSinavTuru,
        hint: const Text("Sınav Türünü Seç"),
        items: sinavTurleri.map((tur) {
          return DropdownMenuItem<String>(
            value: tur,
            child: Text(tur),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedSinavTuru = value!;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
      TextField(
        controller: sinavTarihi,
        readOnly: true,
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (picked != null) {
            setState(() {
              _secilenTarih = picked;
              sinavTarihi.text = picked.toIso8601String();
            });
          }
        },
        decoration: InputDecoration(
          labelText: "Sınav Tarihi",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          final yeniSinav = Sinav(
            sinav_id: 0,
            sinav_ad: sinavAdi.text,
            sinav_Neti: int.parse(sinavNetleri.text),
            sinav_tarihi: DateTime.parse(sinavTarihi.text),
            sinav_turu:  selectedSinavTuru ?? "Bilinmiyor",
          );
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SinavNeti(sinav: yeniSinav),
              ),
          );
        },
        child: const Text("Kaydet"),
      ),

    ],
    ),
    ),
    );
  }
}
