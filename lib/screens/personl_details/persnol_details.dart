import 'package:flutter/material.dart';

class PersnolDetails extends StatefulWidget {
  const PersnolDetails({super.key});

  @override
  State<PersnolDetails> createState() => _PersnolDetailsState();
}

class _PersnolDetailsState extends State<PersnolDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFF4334B4)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Register Account",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        // ✅ Full-width divider added below AppBar
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Properly aligned text column
            const Text(
              "Enter your personal details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your details in the below fields",
              style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
            ),
          ],
        ),
      ),
    );
  }
}
