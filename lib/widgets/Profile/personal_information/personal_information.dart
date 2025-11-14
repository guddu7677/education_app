import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  String selectedDifficulty = "Easy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),

          Column(
            children: [
               SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _buildHeader(),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xFFF4F6F9),
                              child: Icon(
                                Icons.person_pin,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Personal Information",
                              style: AppTextStyles.black16,
                            ),
                          ],
                        ),
                        const Divider(),

                        const SizedBox(height: 16),
                        _buildProfilePic(),

                        const SizedBox(height: 20),
                        _buildTextFields(),

                        const SizedBox(height: 20),
                        _buildSortHeader(),

                        const SizedBox(height: 12),
                        const Divider(),

                        const SizedBox(height: 10),
                        _buildDifficultyCircle(
                          title: "Weakest to Strongest",
                          isSelected:
                              selectedDifficulty == "Weakest to Strongest",
                          onTap: () => setState(
                            () => selectedDifficulty = "Weakest to Strongest",
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildDifficultyCircle(
                          title: "Strongest to Weakest",
                          isSelected:
                              selectedDifficulty == "Strongest to Weakest",
                          onTap: () => setState(
                            () => selectedDifficulty = "Strongest to Weakest",
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildDifficultyCircle(
                          title: "Alphabetically",
                          isSelected: selectedDifficulty == "Alphabetically",
                          onTap: () => setState(
                            () => selectedDifficulty = "Alphabetically",
                          ),
                        ),
                        SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: const Color(0xFFF4F6F9),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Delete Account",
                                style: AppTextStyles.black16,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Text(
                          "Delete My Exam Prep Account?",
                          style: AppTextStyles.smallblack12bold,
                        ),
                        Text(
                          " Are you sure you want to permanently delete your Exam Prep account? This action cannot be undone, and all your data will be permanently lost.",
                          style: AppTextStyles.smallblack12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
              onPressed:
                   () {
                      Navigator.pushNamed(context, "/MainScreen");
                    },
                  
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
 
              
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Delete Account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      
          )  ),
    );
  }
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
        const Spacer(),
        const Text(
          "Personal Information",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildProfilePic() {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(AppImages.profileinfo, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text("Profile picture / Logo", style: AppTextStyles.boldblack16),
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        _field("First Name", "Luism"),
        const SizedBox(height: 16),
        _field("Last Name", "Ipsum"),
        const SizedBox(height: 16),
        _field("Alternate Mobile Number", "+91 12345667890"),
        const SizedBox(height: 16),
        _field("Email", "example@gmail.com"),
        const SizedBox(height: 16),
        _field(
          "Exam Category",
          "Choose Category",
          suffix: const Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }

  Widget _field(String label, String hint, {Widget? suffix}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.2),
        ),
      ),
    );
  }

  Widget _buildSortHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFF4F6F9),
          child: Icon(Icons.short_text, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 20),
        Text("Sort Subject Insight", style: AppTextStyles.black16),
      ],
    );
  }

  Widget _buildDifficultyCircle({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: Center(
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primary : Colors.transparent,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.primary : Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
