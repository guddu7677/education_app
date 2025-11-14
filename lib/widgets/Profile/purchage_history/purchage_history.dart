import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
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
                        const SizedBox(height: 16),

                        _purchaseTile(),
                        Divider(),
                        _purchaseTile(),
                        Divider(),
                        _purchaseTile(),
                        Divider(),
                        _purchaseTile(),
                         Divider(),
                        _purchaseTile(),
                        Divider(),
                        _purchaseTile(),
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
          "Purchase History",
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

  Widget _purchaseTile() {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Image.asset(
        AppImages.purchageimages,
        height: 35,
        width: 35,
      ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Professional Exam Preparation",
            style: AppTextStyles.smallblack12bold,
          ),

          Text(
            "Apr 19, 2021",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            "Premium Access to 29 exams.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 4),

          Row(
            children: [
              Text(
                "Expired On: May 18, 2021",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              const SizedBox(width: 8),
              Container(height: 18, width: 2, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                "Total Price: \$414.00",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Text(
            "Payment Type: Debit Card ending with **98",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
