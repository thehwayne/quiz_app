import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Stateless widget to show summary of questions correct or incorrect
//Should take in summaryData map, which has data about the questions, user answer, correct answer, question index
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

// UI related code
  @override
  Widget build(context) {

    // Column including summary data
    return Column(
      children: summaryData.map((data) {
        // This is a check to see whether or not the user answer is the same as the correct answer
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
                // If user gets correct? Blue! If not, pink.
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
                      color: Colors.purple[100], 
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
