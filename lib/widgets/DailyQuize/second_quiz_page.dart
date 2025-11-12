import 'package:flutter/material.dart';

class SecondQuizPage extends StatefulWidget {
  const SecondQuizPage({super.key});

  @override
  State<SecondQuizPage> createState() => _SecondQuizPageState();
}

class _SecondQuizPageState extends State<SecondQuizPage> {
  String? selectedOption; // Track which option is selected

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ✅ Background Image
          Positioned.fill(
            child: Image.asset("assets/images/BG.png", fit: BoxFit.cover),
          ),

          /// ✅ Custom AppBar
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
                SizedBox(width: 100),
                Text(
                  "Daily Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFF4334B4).withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/gp.png", height: 50, width: 50),

                  Text(
                    "Question of the Day",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ✅ Bottom White Container (Options)
          Positioned(
            top: height * 0.43,
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                    const SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF4334B4)),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF4334B4).withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  child: Image.asset("assets/images/6p.png"),
                                ),
                              ),
                              Text(
                                "Community Stats",
                                style: TextStyle(
                                  color: const Color(
                                    0xFF4334B4,
                                  ).withOpacity(0.4),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/images/7p.png"),
                                ),
                              ),
                              const Text(
                                "Flag",
                                style: TextStyle(
                                  color: Color(0xFF4334B4),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/images/8p.png"),
                                ),
                              ),
                              const Text(
                                "Share",
                                style: TextStyle(
                                  color: Color(0xFF4334B4),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: selectedOption != null
                  ? () {
                      Navigator.pushNamed(context, "/ThirdQuizPage");
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedOption != null
                    ? const Color(0xFF4334B4)
                    : const Color(0xFF4334B4).withOpacity(0.4),
                disabledBackgroundColor: const Color(
                  0xFF4334B4,
                ).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Check Answer",
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
                color: Color(0xFFF8F9FD),
                borderRadius: BorderRadius.only(
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FD),
                  borderRadius: const BorderRadius.only(
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
                    // 👉 No right border
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
