import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),

          Column(
            children: [
              const SizedBox(height: 35),

              Padding(
                padding: const EdgeInsets.symmetric(
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
                      children: [
                        _personalInfo(),
                        SizedBox(height: 16),
                        _helpSupportInfo(),
                        SizedBox(height: 16),
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: AppColors.white),
                              SizedBox(width: 4),
                              Text("Log Out", style: AppTextStyles.white16),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("v1.8.12", style: AppTextStyles.black16),
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
          "Profile",
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

  Widget _personalInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/PersonalInformation");
            },
            child: _profileTile(
              icon: Icons.person_pin,
              text: "Personal Information",
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),

          _divider(),

          _profileTile(
            icon: Icons.leaderboard,
            text: "Leaderboard",
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),

          _divider(),

          _profileTile(
            icon: Icons.notifications_active_outlined,
            text: "Notification Setting",
            trailing: Switch(
              trackColor: WidgetStatePropertyAll(Colors.grey.shade300),
              trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade300),
              value: false,
              onChanged: (value) {},
            ),
          ),
          _divider(),
          _profileTile(
            icon: Icons.subscriptions_outlined,
            text: "Subscription",
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          _divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/PurchaseHistory");
            },
            child: _profileTile(
              icon: Icons.receipt_long_outlined,
              text: "Purchase History",
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTile({
    required IconData icon,
    required String text,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Color(0XFFF4F6F9),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),

          Expanded(child: Text(text, style: AppTextStyles.black16)),

          trailing,
        ],
      ),
    );
  }

  Widget _divider() => const Divider(height: 1);

  Widget _helpSupportInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/HelpSupport");
            },
            child: _profileTile(
              icon: Icons.support_agent_outlined,
              text: "Help & Support",
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),

          _divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/PrivacyPolicy");
            },
            child: _profileTile(
              icon: Icons.policy_outlined,
              text: "Privacy Policy",
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),

          _divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/TermConditions");
            },
            child: _profileTile(
              icon: Icons.gavel,
              text: "Terms & Condition",
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
