import 'dart:io';
import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/services/api_service.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _api = ApiService();

  bool _loading = false;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController altMobile = TextEditingController();
  final TextEditingController examCategory = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    altMobile.dispose();
    examCategory.dispose();
    super.dispose();
  }

  Future<void> _saveDetails() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final result = await _api.savePersonalDetails(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      alternateMobile: altMobile.text.isEmpty ? null : altMobile.text,
      image: null, 
    );

    setState(() => _loading = false);

    if (result['success']) {
      if (examCategory.text.isNotEmpty) {
        await _api.saveExamCategory(examCategory.text);
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['message'])));

      Navigator.pushReplacementNamed(context, "/ExamDetails");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: AppColors.primary),
        title: Text("Personal Details", style: AppTextStyles.boldblack16),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.grey),
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your personal details",
                      style: AppTextStyles.boldblblack22),
                  SizedBox(height: 6),
                  Text("Enter your details in the below fields",
                      style: TextStyle(color: AppColors.balcksemibColor)),

                  SizedBox(height: 25),

                  _field("First Name", firstName, "Loren",
                      validator: (val) =>
                          val!.isEmpty ? "Please enter first name" : null),

                  SizedBox(height: 20),

                  _field("Last Name", lastName, "Ipsum",
                      validator: (val) =>
                          val!.isEmpty ? "Please enter last name" : null),

                  SizedBox(height: 20),

                  _field("Alternate Mobile", altMobile, "+91 1234567890",
                      keyboard: TextInputType.phone),

                  SizedBox(height: 20),

                  _field("Email", email, "example@gmail.com",
                      keyboard: TextInputType.emailAddress,
                      validator: (val) {
                    if (val == null || val.isEmpty) return "Please enter email";
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val))
                      return "Please enter valid email";
                    return null;
                  }),

                  SizedBox(height: 20),

                  _field("Exam Category", examCategory, "Choose Category",
                      readOnly: true,
                      suffix: Icon(Icons.arrow_drop_down,
                          color: AppColors.primary)),

                  SizedBox(height: 40),

                  AppButton(
                    title: "Continue",
                    color: AppColors.primary,
                    onTap: _loading ? null : _saveDetails,
                  )
                ],
              ),
            ),
          ),

          if (_loading)
            Container(
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            )
        ],
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller,
    String hint, {
    bool readOnly = false,
    TextInputType keyboard = TextInputType.text,
    Widget? suffix,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
