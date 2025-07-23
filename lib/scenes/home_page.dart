import 'package:flutter/material.dart';
import 'package:schdule/data/entity/sinavlar.dart';
import 'package:schdule/scenes/exams_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Sinav>> sinavlariYukle() async {
    var sinavlarListesi= <Sinav>[];
    return sinavlarListesi;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kontrol Sende"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>examsPage()));
            }, child: Text("Sınavlar"),),
            ElevatedButton(onPressed: (){}, child: Text("Çalışma"),),
            ElevatedButton(onPressed: (){}, child: Text("Program"),),
            ElevatedButton(onPressed: (){}, child: Text("Sorular ve Konular"),),
            ElevatedButton(onPressed: (){}, child: Text("Duyurular"),)
          ],
        ),
      ),
    );
  }
}