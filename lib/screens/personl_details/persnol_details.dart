import 'package:education_app/CustomButton/bottomNavButton.dart';
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
        scrolledUnderElevation: 0,
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
        backgroundColor: BackGroundColor.white,
        centerTitle: true,
        title: Text(
          "Personal Details",
          style: AppTextStyles.boldblack16,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
                "Enter your personal details",
                style: AppTextStyles.boldblblack22,
              ),
               SizedBox(height: 6),
             Text(
                "Enter your details in the below fields",
                style: TextStyle(fontSize: 16, color: AppColors.balcksemibColor),
              ),
               SizedBox(height: 25),
              _buildTextField(
                controller: _firstNameController,
                label: "First Name",
                hint: "Loren",
                validator: (value) =>
                  value!.isEmpty ? "Please enter first name" : null,
              ),
               SizedBox(height: 20),
              _buildTextField(
                controller: _lastNameController,
                label: "Last Name",
                hint: "Ipsum",
                validator: (value) =>
                  value!.isEmpty ? "Please enter last name" : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _mobileController,
                label: "Alternate Mobile Number",
                hint: "+91 1234567890",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: "Email",
                hint: "example@gmail.com",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              _buildTextField(
                controller: _examCategoryController,
                label: "Exam Category",
                hint: "Choose Category",
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4334B4)),
              ),

              const SizedBox(height: 40),

              AppButton(
                title: "Continue",
                color: ButtonBackgroundColor.buttonBackgroundColor,
                textColor: Colors.white,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/ExamDetails");

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Form submitted successfully!")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    FormFieldValidator<String>? validator,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BorderColor.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BorderColor.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: BorderColor.borderPrimary, width: 2),
        ),
      ),
    );
  }
}
