import 'package:flutter/material.dart';

class QuestionPage2 extends StatefulWidget {
  const QuestionPage2({super.key});

  @override
  State<QuestionPage2> createState() => _QuestionPage2State();
}

class _QuestionPage2State extends State<QuestionPage2> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/BG.png",
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Header (Back button + Title)
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Quick Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),

          /// 🔹 Progress + Question Info
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFF4334B4).withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      return Container(
                        height: 3,
                        width: 25,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: index == 0 ? Colors.white : Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  Image.asset("assets/images/1p.png", height: 50, width: 50),
                  const Text(
                    "Question 1/10",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 Content (Question + Answers)
          Positioned(
            top: height * 0.32,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Subject name here",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    _buildCorrectAnswerCard(
                      "A",
                      "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                    ),
                    const SizedBox(height: 12),
                    _buildOptionCard(
                      "B",
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                    ),
                    const SizedBox(height: 12),
                    _buildOptionCard(
                      "C",
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                    ),
                    const SizedBox(height: 12),
                    _buildWrongAnswerCard(
                      "D",
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      /// 🔹 Bottom Button
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: 
                   () {
                      Navigator.pushNamed(context, "/QuickQuizResultPage");
                    },
                  
              style: ElevatedButton.styleFrom(
               backgroundColor: Color(0xFF4334B4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "View Result",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 /// 🟦 Neutral Option Card
  Widget _buildOptionCard(String label, String description) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildSideLabel(
            label: label,
            color: const Color(0xFFF8F9FD),
            textColor: Colors.black,
            borderColor: Colors.grey.shade300,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FD),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border:Border(left: BorderSide.none,
                top: BorderSide(color: Colors.grey.shade300),
                right: BorderSide(color: Colors.grey.shade300),
                bottom: BorderSide(color: Colors.grey.shade300))

              ),
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Correct Answer Card (Green)
  Widget _buildCorrectAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              _buildSideLabel(
                label: label,
                color: Colors.green,
                textColor: Colors.white,
                borderColor: Colors.green,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildAnswerTag("Correct Answer", Colors.green),
      ],
    );
  }

  /// ❌ Wrong Answer Card (Red)
  Widget _buildWrongAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              _buildSideLabel(
                label: label,
                color: Colors.red,
                textColor: Colors.white,
                borderColor: Colors.red,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildAnswerTag("Your Answer", Colors.red),
      ],
    );
  }

  /// 🔹 Common label builder (A, B, C, D)
  Widget _buildSideLabel({
    required String label,
    required Color color,
    required Color textColor,
    required Color borderColor,
  }) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        border: Border.all(color: borderColor, ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// 🔹 Common tag ("Your Answer")
  Widget _buildAnswerTag(String text, Color color) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
