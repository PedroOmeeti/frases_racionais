import 'package:flutter/material.dart';
import 'package:frases_racionais/controller/home_controller.dart';
import 'package:frases_racionais/view/component/espacamento_h.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController = HomeController();
  String frase = '';

  Future<void> resultado() async {
    homeController.frase = await homeController.puxarFrase();
    setState(() {
      
    });
    print(homeController.frase.frase);
  }

   void initState()   {
    super.initState();
    resultado();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            EspacamentoH(h: 200),
            
            Image.asset('assets/images/racionais.jpg', width: 200, height: 200),

            EspacamentoH(h: 75),

            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Text(homeController.frase.frase ?? '', style: TextStyle(fontSize: 20)),
            ),

            EspacamentoH(h: 28),
            Text("-${homeController.frase.autor ?? ''}", style: TextStyle(fontSize: 20)),

            EspacamentoH(h: 28),

            ElevatedButton(
              
              onPressed: () async {
                await resultado();
                setState(() {
                  
                });
              }, 
              child: Text('Gerar Frase',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              )
            )
      
          ],
        ),
      ),
    );
  }
}