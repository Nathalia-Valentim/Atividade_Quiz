import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atividade_quiz/pag_final.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isCorrect;
  final List<Map<String, dynamic>> questions =[
    {
      'question': 'Qual desses é considerado um dos peixes mais rápidos do mundo?',
      'answer': ['Tubarão', 'Dânio Tigre', 'Agulhão Negro', 'Carpa'],
      'correctAnswer': 'Agulhão Negro'
    },

    {
      'question': 'Qual a maior espécie de baleia?',
      'answer': ['Orca', 'Baleia Azul', 'Baleia-Jubarte', 'Baleia Cachalote'],
      'correctAnswer': 'Baleia Azul'
    },

    {
      'question': 'Qual desses é considerado um dos maiores peixes de água doce?',
      'answer': ['Pirarucu', 'Peixe Espada', 'Pacu', 'Tambaqui'],
      'correctAnswer': 'Pirarucu'
    },

    {
      'question': 'Qual peixe é normalmente usada como exemplo de comensalismo?',
      'answer': ['Rêmora', 'Baiacu', 'Ostra', 'Atum'],
      'correctAnswer': 'Rêmora'
    },

    {
      'question': 'Qual tubarão pode viver mais de 100 anos?',
      'answer': ['Tubarão Branco', 'Tubarão-da-Groelândia', 'Tubarão Galha Preta', 'Tubarão Baleia'],
      'correctAnswer': 'Tubarão-da-Groelândia'
    }
  ];
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      //Fim do Quiz
    }
  }
  void handleAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedAnswer = null;
          isCorrect = null;
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Congratulations()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        title: Text('Quiz marítimo!', style: GoogleFonts.roboto(fontWeight: FontWeight.bold))
        ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Text(currentQuestion['question'],
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), ),
            ),
          ),
          Wrap(
            children: currentQuestion ['answer'].map<Widget>((resposta) {
              bool isSelected = selectedAnswer == resposta;
              Color? buttonColor;
              if (isSelected) {
                buttonColor = isCorrect! ? Colors.green : Colors.red;
              }

              return meuBtn(
                resposta, () => handleAnswer(resposta), buttonColor);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) => 
  Container(
    margin: const EdgeInsets.all(16),
    width: 160,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color
      ),
      child: Text(resposta),
  ),
);