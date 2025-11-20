import 'dart:async';
import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final ApiService _api = ApiService();

  bool _isLoading = false;
  int _resendTimer = 59;
  Timer? _timer;

  String? email;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null) {
      email = args["email"];
      isLogin = args["isLogin"] ?? false;
    }
  }

  // ---------------------------------------------------------
  // TIMER
  // ---------------------------------------------------------
  void startTimer() {
    _timer?.cancel();
    _resendTimer = 59;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() => _resendTimer--);
      } else {
        timer.cancel();
      }
    });
  }

  // ---------------------------------------------------------
  // RESEND OTP
  // ---------------------------------------------------------
  Future<void> _handleResendOtp() async {
    if (_resendTimer > 0 || email == null) return;

    setState(() => _isLoading = true);

    final result = isLogin
        ? await _api.userLogin(email!)
        : await _api.userSignup(email!);

    setState(() => _isLoading = false);

    if (result["success"] == true) {
      startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP resent successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result["message"] ?? "Failed to resend OTP")),
      );
    }
  }

  // ---------------------------------------------------------
  // VERIFY OTP
  // ---------------------------------------------------------
  Future<void> _handleContinue() async {
    if (otpController.text.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 4-digit OTP")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final result = await _api.verifyOtp(email!, otpController.text);

    setState(() => _isLoading = false);

    if (result["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result["message"] ?? "OTP Verified")),
      );

      // If login → go to MainScreen
      if (isLogin) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/MainScreen",
          (route) => false,
        );
      }
      // If signup → complete profile
      else {
        Navigator.pushReplacementNamed(context, "/PersonalDetails");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result["message"] ?? "Invalid OTP")),
      );
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bodyHeight =
        MediaQuery.of(context).size.height - appBarHeight - topPadding - 32;

    return Scaffold(
      backgroundColor: BackGroundColor.white,

      // ---------------------------------------------------------
      // APP BAR
      // ---------------------------------------------------------
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: BackGroundColor.white,
        centerTitle: true,
        elevation: 0,
        title: Text("OTP", style: AppTextStyles.boldblack16),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFF4334B4)),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      // ---------------------------------------------------------
      // BODY
      // ---------------------------------------------------------
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                height: bodyHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    Text("Enter OTP", style: AppTextStyles.boldblblack22),
                    const SizedBox(height: 8),

                    Text(
                      "Please enter the OTP sent to your phone number.",
                      style: TextStyle(fontSize: 16, color: AppColors.subtilecolor),
                    ),
                    const SizedBox(height: 16),

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text.rich(
                        TextSpan(
                          text: "${email ?? ''} ",
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Edit",
                              style: AppTextStyles.primarysemiBold16,
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Center(
                      child: Pinput(
                        controller: otpController,
                        length: 4,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 50,
                          textStyle: AppTextStyles.semiboldblack18,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.primary),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: GestureDetector(
                        onTap: _handleResendOtp,
                        child: Text(
                          _resendTimer > 0
                              ? "Resend OTP (${_resendTimer}s)"
                              : "Resend OTP",
                          style: _resendTimer > 0
                              ? AppTextStyles.black16
                              : AppTextStyles.primarysemiBold16,
                        ),
                      ),
                    ),

                    const Spacer(),

                    AppButton(
                      title: "Continue",
                      radius: 8,
                      color: ButtonBackgroundColor.buttonBackgroundColor,
                      onTap: _isLoading ? () {} : _handleContinue,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ---------------------------------------------------------
          // LOADING OVERLAY
          // ---------------------------------------------------------
          if (_isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF4334B4)),
              ),
            ),
        ],
      ),
    );
  }
}
