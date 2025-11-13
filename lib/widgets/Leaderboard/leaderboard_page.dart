import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            fit: BoxFit.cover,
            height: height,
            width: double.infinity,
          ),
          SafeArea(
            child: SingleChildScrollView(
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

              child: Column(
                children: [
                  _buildHeader(),
                 SizedBox(height: 20),
                  _buildTime(),
                 SizedBox(height: 20),
                  _buildMainContent(),
                ],
              ),
            ),
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
            size: 20,
          ),
        ),
        const Spacer(),
        const Text(
          "Leaderboard",
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

  Widget _buildTime() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
        Container(height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.primary,
    borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text("Weekly",style: AppTextStyles.boldWhite16,)),
        ),
        Text("Monthly",style: AppTextStyles.boldWhite16,),
        Text("All Time",style: AppTextStyles.boldWhite16,),

      ]),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(children: [

      ],),
    );
  }
}
