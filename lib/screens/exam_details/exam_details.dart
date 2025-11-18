import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ExamDetails extends StatefulWidget {
  const ExamDetails({super.key});

  @override
  State<ExamDetails> createState() => _ExamDetailsState();
}

class _ExamDetailsState extends State<ExamDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppColors.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Exam Details",
          style: AppTextStyles.semiboldblack18
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Text(
                "Select your exam",
                style: AppTextStyles.boldblblack22,
              ),
              const SizedBox(height: 8),

              const Text(
                "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                style: TextStyle(fontSize: 16, color: AppColors.balcksemibColor),
              ),
              const SizedBox(height: 20),

              // Selected Category
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Selected Category",
                  hintText: "IT & Cybersecurity",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle:AppTextStyles.boldblack16,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.primary
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: BorderColor.borderPrimary,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: BorderColor.borderPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Exam Date
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Your Exam Date",
                  hintText: "Select your exam date",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: BorderColor.borderPrimary,)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: BorderColor.borderPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: BorderColor.borderPrimary,),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: BorderColor.borderPrimary,),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Cisco CCNA",
                          style: AppTextStyles.smibold16black2121,)
                      ],
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                      style: TextStyle(fontSize: 12, color: AppColors.balcksemibColor),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoItem(
                          icon: Icons.help_outline,
                          text: "500+ Questions",
                        ),
                        _infoItem(icon: Icons.help_outline, text: "6 Subjects"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: BorderColor.borderPrimary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with radio and title
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: BorderColor.borderPrimary),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Cisco CCNA",
                          style: AppTextStyles.smibold16black2121
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                      style: TextStyle(fontSize: 12, color: AppColors.balcksemibColor),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoItem(
                          icon: Icons.help_outline,
                          text: "500+ Questions",
                        ),
                        _infoItem(icon: Icons.help_outline, text: "6 Subjects"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.balcksemibColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: BorderColor.borderPrimary),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Cisco CCNA",
                          style:AppTextStyles.smibold16black2121
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                      style: TextStyle(fontSize: 12, color: AppColors.balcksemibColor),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoItem(
                          icon: Icons.help_outline,
                          text: "500+ Questions",
                        ),
                        _infoItem(icon: Icons.help_outline, text: "6 Subjects"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/MainScreen");
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF4334B4).withOpacity(0.1),
                    side: BorderSide(color: BorderColor.borderPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Skip",
                    style: AppTextStyles.primarysemiBold16,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Continue Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.pushNamed(context, "/MainScreen");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Continue",
                    style: AppTextStyles.boldWhite16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: const Color(0xFF4334B4).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(icon, color: AppColors.primary, size: 16),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color:AppColors.balcksemibColor),
        ),
      ],
    );
  }
}
