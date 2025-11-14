import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 35),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: _buildHeader(),
              ),

              // Content Container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
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
                        // Expandable Items
                        const ExpandableHelpItem(
                          title: "What is Lorem Ipsum?",
                          description:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        ),
                        const ExpandableHelpItem(
                          title: "Why do we use it?",
                          description:
                              "It is a long established fact that a reader will be distracted by readable content.",
                        ),
                        const ExpandableHelpItem(
                          title: "Where does it come from?",
                          description:
                              "Contrary to popular belief, Lorem Ipsum is not random text.",
                        ),
                        const ExpandableHelpItem(
                          title: "Where can I get some?",
                          description:
                              "There are many variations of passages of Lorem Ipsum available.",
                        ),

                        const SizedBox(height: 16),

                        // Help Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Need Help?",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "Please get in touch, we will be happy\nto help you.",
                                style: TextStyle(fontSize: 15),
                              ),

                              const SizedBox(height: 20),

                              // Call Button
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.phone, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Call Us at: +91 00987654321",
                                      style: AppTextStyles.smallWhite12bold,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Email Button
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.email, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Email Us at: info@gstbillingapp.com",
                                      style: AppTextStyles.smallWhite12bold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
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

  // HEADER
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
          "Help & Support",
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

class ExpandableHelpItem extends StatefulWidget {
  final String title;
  final String description;

  const ExpandableHelpItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<ExpandableHelpItem> createState() => _ExpandableHelpItemState();
}

class _ExpandableHelpItemState extends State<ExpandableHelpItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => isExpanded = !isExpanded);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Icon(
                isExpanded ? Icons.close : Icons.add,
                color: AppColors.primary,
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),

        const Divider(),
      ],
    );
  }
}
