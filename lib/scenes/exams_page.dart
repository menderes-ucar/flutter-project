import 'package:flutter/material.dart';
import 'package:schdule/scenes/sinav_ekle.dart';
import 'package:schdule/data/entity/sinavlar.dart';
import 'package:schdule/scenes/takvim_sayfasi.dart';

class examsPage extends StatefulWidget {
  const examsPage({super.key});

  @override
  State<examsPage> createState() => _examsPageState();
}

class _examsPageState extends State<examsPage> {
  List<Sinav> sinavListesi = [];

  double ortalamaNetHesapla(List<Sinav> sinavlar, String tur) {
    final filtreli = sinavlar.where((s) => s.sinav_turu == tur).toList();
    if (filtreli.isEmpty) return 0;
    final toplamNet = filtreli.fold(0, (sum, sinav) => sum + sinav.sinav_Neti);
    return toplamNet / filtreli.length;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sınav Sayfası")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Üst Başlık ve Butonlar
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  "SINAVLAR",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (sinavListesi.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Sınav Yok"),
                          content: const Text("Henüz sınav eklenmemiş."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Tamam"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Tüm Sınavlar"),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: sinavListesi.length,
                              itemBuilder: (context, index) {
                                final sinav = sinavListesi[index];
                                return ListTile(
                                  title: Text(sinav.sinav_ad),
                                  subtitle: Text(
                                    "Net: ${sinav.sinav_Neti}, "
                                        "Tarih: ${sinav.sinav_tarihi.toString().split(' ')[0]}",
                                  ),
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Kapat"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Tüm Sınavlar"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final yeniSinav = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const sinavEkle()),
                    );
                    if (yeniSinav != null && yeniSinav is Sinav) {
                      setState(() {
                        sinavListesi.add(yeniSinav);
                      });
                    }
                  },
                  child: const Text("Sınav Ekle"),
                ),

              ],
            ),
            const SizedBox(height: 20),
            // Kart 1
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [

                      Icon(Icons.calendar_month_outlined, size: 30),
                       SizedBox(height: 4),
                       Text("Yaklaşan Sınavlar"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TYT Ortalaması: ${ortalamaNetHesapla(sinavListesi, 'TYT').toStringAsFixed(2)}"),
                      Text("AYT Ortalaması: ${ortalamaNetHesapla(sinavListesi, 'AYT').toStringAsFixed(2)}"),
                      Text("LGS Ortalaması: ${ortalamaNetHesapla(sinavListesi, 'LGS').toStringAsFixed(2)}"),
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => TakvimSayfasi (),),);
                      },
                        icon: Icon(Icons.calendar_month_outlined, size: 30),),
                      Text("Takvim"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Kart 2
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Yaklaşan sınavların listesi",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 6),
            // Kart 3
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Son Sınavlar",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
