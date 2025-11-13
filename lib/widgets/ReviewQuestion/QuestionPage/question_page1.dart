import 'package:flutter/material.dart';

class QuestionPage1 extends StatefulWidget {
  const QuestionPage1({super.key});

  @override
  State<QuestionPage1> createState() => _QuestionPage1State();
}

class _QuestionPage1State extends State<QuestionPage1> {
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

                    _buildOptionCard(
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
                    _buildOptionCard(
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
              onPressed: selectedOption != null
                  ? () {
                      Navigator.pushNamed(context, "/QuestionPage2");
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedOption != null
                    ? const Color(0xFF4334B4)
                    : const Color(0xFF4334B4).withOpacity(0.4),
                disabledBackgroundColor:
                    const Color(0xFF4334B4).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Submit",
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

  /// 🟦 Option Card Widget
  Widget _buildOptionCard(String label, String description) {
    bool isSelected = selectedOption == label;
    Color borderColor = isSelected ? Colors.grey : Colors.grey.shade300;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FD),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(
                  color: borderColor,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:  Color(0xFFF8F9FD),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                    right: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                    bottom: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
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
    );
  }
}
