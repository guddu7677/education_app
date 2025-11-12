import 'package:flutter/material.dart';

class SecondReviewQuestionPage extends StatefulWidget {
  const SecondReviewQuestionPage({super.key});

  @override
  State<SecondReviewQuestionPage> createState() =>
      _SecondReviewQuestionPageState();
}

class _SecondReviewQuestionPageState extends State<SecondReviewQuestionPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                  "Review Question",
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

          /// 🔹 Content (Question + Answers)
          Positioned(
            top: height * 0.13,
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
                    /// 🔸 Question Section
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

                    /// 🔸 Answer Options
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
                    SizedBox(height: 30,),
                    Text("Explanation",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black),),
                    Divider(color: Color(0xFF4334B4),),
                    SizedBox(height: 10,),
                    Text(
                      
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black),),
                    SizedBox(height: 10,),
                     Text("References:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black),),
                    Divider(color: Color(0xFF4334B4),),
                Text(
                  
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                
                
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black),),

                  ],
                ),
              ),
            ),
          ),
        ],
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
                border: Border.all(color: Colors.grey.shade300),
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
        border: Border.all(color: borderColor, width: 2),
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
