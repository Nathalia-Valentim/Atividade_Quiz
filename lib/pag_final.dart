import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atividade_quiz/home_page.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz finalizado!!',
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: 300,
            width: double.infinity,
            child: Card(
              color: Colors.blue[50],
              elevation: 4,
              child: Column(
                children: [
                  Image.asset('assets/orca.png', width: 150, height: 150),
                  Text('Parabéns!! \nVolte para a página inicial.',
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 26, 31, 36)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Text('Voltar para a página inicial'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
