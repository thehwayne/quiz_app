import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrect = data['user_answer'] == data['correct_answer'];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // This is for the number circle thingy
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isCorrect ? Colors.lightBlueAccent: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 20),


            // And these are for the questions and answers
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data['user_answer'] as String,
                    style: GoogleFonts.lato(
                      color: Color(0xFFFF2EEA), 
                      fontSize: 14,
                      ),
                    
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: GoogleFonts.lato(color: Colors.cyanAccent,
                    fontSize: 14,
                    
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
