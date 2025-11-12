import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    
    final double appBarHeight = AppBar().preferredSize.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double totalHeight = MediaQuery.of(context).size.height;
        final double minBodyHeight = totalHeight - appBarHeight - topPadding - 32;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF4334B4),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "OTP",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),
     body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SizedBox(
            height: minBodyHeight, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: 30),
               Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
               SizedBox(height: 8),

               Text(
                  "Please enter the OTP that has been sent to your phone number.",
                  style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
                ),
                 SizedBox(height: 16),
                 Text.rich(
                  TextSpan(
                    text: "+91 1234567890 ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4334B4),
                        ),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 40),
                Center(
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 20),
               Center(
                  child: Text(
                    "Resend OTP (59s)",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                 Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/PersnolDetails");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4334B4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}