import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class PersnolDetails extends StatefulWidget {
  const PersnolDetails({super.key});

  @override
  State<PersnolDetails> createState() => _PersnolDetailsState();
}

class _PersnolDetailsState extends State<PersnolDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _examCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor.white,

      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF4334B4),
          ),
        ),
        elevation: 0,
        backgroundColor:BackGroundColor.white,
        centerTitle: true,
        title: const Text(
          "Personal Details",
          style:AppTextStyles.semiboldblack18,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                const Text(
                  "Enter your personal details",
                  style: AppTextStyles.boldblblack22,
                ),
                const SizedBox(height: 8),

                const Text(
                  "Enter your details in the below fields",
                  style: TextStyle(fontSize: 16, color: AppColors.balcksemibColor),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameController,
                  decoration: _inputDecoration("First Name", "Loren"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Please enter first name"
                      : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: _inputDecoration("Last Name", "Ipsum"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Please enter last name"
                      : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    "Alternate Mobile Number",
                    "+91 1234567890",
                  ),
                ),
                const SizedBox(height: 20),
                  TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration("Email", "example@gmail.com"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _examCategoryController,
                  decoration: _inputDecoration(
                    "Exam Category",
                    "Choose Category",
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF4334B4),
                    ),
                  ),
                  // validator: (value) =>
                  //     value == null || value.isEmpty ? "Please choose a category" : null,
                  // readOnly: true,
                ),

                const SizedBox(height: 40),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ButtonBackgroundColor.buttonBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/ExamDetails");
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Form submitted successfully!"),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Continue",
                      style: AppTextStyles.boldWhite16,
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

  InputDecoration _inputDecoration(
    String label,
    String hint, {
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: BorderColor.borderPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color:BorderColor.borderPrimary, width: 2),
      ),
    );
  }
}
