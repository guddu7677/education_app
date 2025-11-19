import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:flutter/material.dart';

class WeakSubjectList extends StatefulWidget {
  const WeakSubjectList({super.key});

  @override
  State<WeakSubjectList> createState() => _WeakSubjectListState();
}

class _WeakSubjectListState extends State<WeakSubjectList> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _buildMainContent(height),
        ],
      ),
     bottomNavigationBar: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton(
      title: "Add Weak Subject",
      onTap: () => Navigator.pop(context),
    ),
  ),
),

    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(AppImages.background, fit: BoxFit.cover),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          ),
           SizedBox(width: 80),
           Text(
            "Weak Subject",
            style: AppTextStyles.semiboldWhite20,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double height) {
    return Positioned(
      top: height * 0.15,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(child: _buildQuestionsList()),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsList() {
    return SingleChildScrollView(
      child: Column(
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Weak Subject List",style: AppTextStyles.black16,),
               ],
             ),
           ),
           SizedBox(height: 16,),
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, "/SecondReviewQuestionPage");
            },
            child: _buildQuestionCard(isCorrect: false),
          ),
          
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQuestionCard({required bool isCorrect}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F9FD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    left: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AACN CCRN (Adult)",
                      style: AppTextStyles.boldblblack14
                    ),
                    Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 40,
              decoration: BoxDecoration(
                color:
                     Color(0xFFD70404).withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(
                   Icons.delete_outline_outlined,
                  color:  Colors.red,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
