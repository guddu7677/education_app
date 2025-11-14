import 'package:flutter/material.dart';
import 'package:education_app/constants/app_constant.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),

          Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _buildHeader(),
              ),
          
              /// Page Content
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
                        const SizedBox(height: 20),
                        Text("Definitions", style: AppTextStyles.boldblack16),
                        const SizedBox(height: 16),
          
                        Text("Service", style: AppTextStyles.colorGrey),
                        const SizedBox(height: 16),
          
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Mauris eget mauris nec elit placerat aliquam. "
                          "Proin cursus, ipsum in facilisis malesuada, "
                          "nisi eros interdum nisl, a pharetra massa risus ut erat.\n\n"
                          "Sed euismod sapien id arcu gravida, vitae consequat nisl dictum."
                          ""
                          ,
                          
                          style: AppTextStyles.black16,
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
    );
  }

  /// HEADER
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
          "Privacy Policy",
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
}
