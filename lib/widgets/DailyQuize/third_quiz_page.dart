import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ThirdQuizPage extends StatefulWidget {
  const ThirdQuizPage({super.key});

  @override
  State<ThirdQuizPage> createState() => _ThirdQuizPageState();
}

class _ThirdQuizPageState extends State<ThirdQuizPage> {
  bool showExplanation = false;

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
                const SizedBox(width: 100),
                const Text(
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

          /// ✅ Question of the Day Card
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
                  const Text(
                    "Question of the Day",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
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
                              const Text(
                                "Community Stats",
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
              onPressed: () {
                Navigator.pushNamed(context, "/MainScreen");
              },
              style:AppButtonStyles.elevatedButtonStyle,
              child: const Text(
                "Back to Home",
                style: AppTextStyles.boldWhite16
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Normal option card (B & C)
  Widget _buildOptionCard(String label, String description) {
    return IntrinsicHeight(
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
              border: Border.all(color: Colors.grey.shade300),
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
                  top: BorderSide(color: Colors.grey.shade300),
                  right: BorderSide(color: Colors.grey.shade300),
                  bottom: BorderSide(color: Colors.grey.shade300),
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
    );
  }

  /// Correct answer card (Option A) - Green container
  Widget _buildCorrectAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              /// Green left container with label
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              /// Right content container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.green, width: 2),
                      right: BorderSide(color: Colors.green, width: 2),
                      bottom: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      /// Show Explanation toggle
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showExplanation = !showExplanation;
                          });
                        },
                        child: Row(
                          children: [
                            const Text(
                              "Show Explanation",
                              style: TextStyle(
                                color: Color(0xFF4334B4),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              showExplanation
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: const Color(0xFF4334B4),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      
                      /// Explanation text (collapsible)
                      if (showExplanation) ...[
                        const SizedBox(height: 12),
                        const Text(
                          "This is the explanation for the correct answer. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                            color: Color(0xFF212121),
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
        /// "Correct Answer" label outside container at bottom right
       Container(height: 30,
       width: 100,
       decoration: BoxDecoration(color: Colors.green,
        border: Border(bottom: BorderSide(color: Colors.green),left: BorderSide(color: Colors.green),right: BorderSide(color: Colors.green)),
        borderRadius:BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
         child: Center(
           child: Text(
            "Your Answer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
                   ),
         ),
       ),
      ],
    );
  }

  /// Wrong answer card (Option D) - Red container
  Widget _buildWrongAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              /// Red left container with label
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              /// Right content container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.red, width: 2),
                      right: BorderSide(color: Colors.red, width: 2),
                      bottom: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  child: Text(
                    description,
                    style:  TextStyle(
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
     Container(height: 30,
         width: 100,
         decoration: BoxDecoration(color: Colors.red,
          border: Border(bottom: BorderSide(color: Colors.red),left: BorderSide(color: Colors.red),right: BorderSide(color: Colors.red)),
          borderRadius:BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
           child: Center(
             child: Text(
              "Your Answer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
                     ),
           ),
         ),
      ],
    );
  }
}