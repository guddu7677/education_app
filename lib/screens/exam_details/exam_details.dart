import 'package:education_app/CustomButton/bottomNavButton.dart';
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
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppColors.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Exam Details",
          style: AppTextStyles.semiboldblack18
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 10),
               Text(
                "Select your exam",
                style: AppTextStyles.boldblblack22,
              ),
             SizedBox(height: 8),
               Text(
                "Please select your exam as per your industry. Or you can skip it for now and add later from settings.",
                style: TextStyle(fontSize: 16, color: AppColors.balcksemibColor),
              ),
             SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Selected Category",
                  hintText: "IT & Cybersecurity",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle:AppTextStyles.boldblack16,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.primary
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: BorderColor.borderPrimary,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: BorderColor.borderPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
             SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Your Exam Date",
                  hintText: "Select your exam date",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: BorderColor.borderPrimary,)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:  BorderSide(
                      color: BorderColor.borderPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
             SizedBox(height: 25),

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
                child: Container(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/MainScreen");
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF4334B4).withOpacity(0.1),
                      side: BorderSide(color: BorderColor.borderPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      
                      "Skip",
                      style: AppTextStyles.primarysemiBold16,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Expanded(
                child:  AppButton(
                  height: 48,
                  title: "Continue",
                  onTap: () {
                    Navigator.pushNamed(context, "/MainScreen");
                  },
                  color: AppColors.primary,
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
