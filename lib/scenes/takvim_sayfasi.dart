import 'package:flutter/material.dart';

class TakvimSayfasi extends StatefulWidget {
  const TakvimSayfasi ({super.key});

  @override
  State<TakvimSayfasi> createState() => _State();
}

class _State extends State<TakvimSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("takvim sayfası"),),
      body: Center(),
    );
  }
}
