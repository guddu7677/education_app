import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
                  const SizedBox(height: 20),

                  _buildGetPremium(),
                  const SizedBox(height: 20),

                  _buildAnualPrice(
                    text: "Annual",
                    style: AppTextStyles.boldWhite16,
                  ),
                  const SizedBox(height: 20),

                  _buildAnualPrice(
                    text: "Monthly",
                    style: AppTextStyles.boldWhite16,
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "By placing this order, you agree to the Terms of Service and Privacy Policy. "
                    "Subscription automatically renews unless auto-renew is turned off at least 24-hours "
                    "before the end of the current period.",
                    style: AppTextStyles.smallWhite12,
                    textAlign: TextAlign.center,
                  ),
                  _buildPurchageButton(),
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
          "Subscription",
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

  Widget _buildGetPremium() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
         Text(
            "Get Premium",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
         SizedBox(height: 10),
          Text(
            "Unlock all the power of this mobile tool and enjoy digital experience like never before!",
            style: AppTextStyles.white16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(AppImages.primiumImage),
        ],
      ),
    );
  }

  Widget _buildAnualPrice({required String text, required TextStyle style}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: style),
             SizedBox(width: 10),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Best Value",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                 SizedBox(width: 10),
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
         SizedBox(height: 10),
         Text(
            "First 30 days free - Then \$999/Year",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchageButton() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/MainScreen");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              disabledBackgroundColor: Color(0xFF4334B4).withOpacity(0.4),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              "Continue to Purchase",
              style: AppTextStyles.primaryBold16,
            ),
          ),
        ),
      ),
    );
  }
}
