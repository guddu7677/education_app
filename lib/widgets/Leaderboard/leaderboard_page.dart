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
                  _buildpercent(),
                  SizedBox(height: 10),
                  _buildLeaderbord(),
                  SizedBox(height: 20),

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text("Weekly", style: AppTextStyles.boldWhite16),
            ),
          ),
          Text("Monthly", style: AppTextStyles.boldWhite16),
          Text("All Time", style: AppTextStyles.boldWhite16),
        ],
      ),
    );
  }

  Widget _buildpercent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0XFFFFB380),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Color(0XFFFF9B57),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "#4",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Text(
              "You are doing better than 60% of other students!",
              style: AppTextStyles.white16,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
Widget _buildLeaderbord() {
  return SizedBox(
    height: 760,
    width: double.infinity,
    child: Stack(
      children: [
        // TOP 3 PODIUM
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.second, height: 330),
              Image.asset(AppImages.first, height: 390,),
              Image.asset(AppImages.third, height: 330),
            ],
          ),
        ),

        // BASE IMAGE WITH SCROLLABLE TEXT
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Stack(
            children: [
              // Base image - full width
              Image.asset(
                AppImages.base,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              
              Positioned(
                left: 16,
                right: 16,
                top: 20,
                bottom: 20,
                child: ListView.builder(
                  itemCount: 10, // Number of leaderboard entries
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                       border: Border.all(color: AppColors.greyBorder),
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                        
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.greyBorder),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 4}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          
                          // User info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Student ${index + 4}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Score: ${1000 - (index * 50)}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Points
                          Text(
                            "${1000 - (index * 50)} pts",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


}
