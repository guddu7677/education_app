import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
               SizedBox(height: 35),

              Padding(
                padding:
                   EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      children: List.generate(
                        8,
                        (index) => _notificationTile(),
                      ),
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
          "Notifications",
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

  
  Widget _notificationTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lorem Ipsum", style: AppTextStyles.boldblack16),
            Text("1 week ago", style: AppTextStyles.colorGrey),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          "Lorem Ipsum Lorem Ipsum Lorem Ipsum\nLorem Ipsum Lorem Ipsum",
          style: AppTextStyles.colorGrey,
        ),

        const SizedBox(height: 12),

        const Divider(height: 0),
      ],
    );
  }
}
