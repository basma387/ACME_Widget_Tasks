import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgettasks/theme/textStyles.dart';
import 'package:widgettasks/theme/colors.dart';
import 'package:flutter/gestures.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _selectedGender;
  String? _selectedCountry;

  bool _agreeToTerms = false;
  bool _receiveUpdates = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.lightBlue,
        appBar: AppBar(
          backgroundColor: ColorManager.blue,
          centerTitle: true,
          title: Text(
            'Create Account',
            style: TextStyles.titleWhite,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.go('/splash');
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xffE8F2FE),
                        child: Icon(Icons.person, size: 60, color: ColorManager.blue),
                      ),
                    ),
                    Center(
                      child: Text("Welcome", style: TextStyles.titleBlack),
                    ),
                    Center(
                      child: Text("Create your account to get started", style: TextStyles.subtextGrey),
                    ),

                    verticalSpace(15),

                    Text("Full Name", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    
                    // CHANGE 3: Using CustomTextFormField
                    CustomTextFormField(
                      hintText: 'Enter your full name',
                      prefixIcon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(15),

                    Text("Email", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    
                    // CHANGE 3: Using CustomTextFormField
                    CustomTextFormField(
                      hintText: 'Enter your email',
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || !email.contains('@') || email.isEmpty) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(16),

                    Text("Password", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    
                    // CHANGE 3: Using CustomTextFormField (obscureText handles the eye icon)
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: "Enter your password",
                      prefixIcon: Icons.lock_clock_outlined,
                      obscureText: true, 
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter a password';
                        return null;
                      },
                    ),

                    verticalSpace(16),

                    Text("Confirm Password", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    
                    // CHANGE 3: Using CustomTextFormField
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      hintText: "Confirm your password",
                      prefixIcon: Icons.lock_clock_outlined,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(16),

                    Text("Gender", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: "Male",
                                groupValue: _selectedGender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                              ),
                              const Text("Male"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: "Female",
                                groupValue: _selectedGender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                              ),
                              const Text("Female"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: "Other",
                                groupValue: _selectedGender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                              ),
                              const Text("Other"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(16),

                    Text("Country", textAlign: TextAlign.left, style: TextStyles.subtitleBlack),
                    verticalSpace(8),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedCountry,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Select your country',
                        prefixIcon: const Icon(Icons.language),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: _countries.map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your country';
                        }
                        return null;
                      },
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _receiveUpdates,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _receiveUpdates = newValue ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              'I would like to receive updates and marketing communications',
                              style: TextStyles.subtextGrey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(2),

                    // --- TERMS AND CONDITIONS CHECKBOX ---
                    FormField<bool>(
                      initialValue: _agreeToTerms,
                      validator: (bool? value) {
                        if (value == null || value == false) {
                          return 'You must agree to the terms';
                        }
                        return null;
                      },
                      builder: (FormFieldState<bool> state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: state.value ?? false,
                                  onChanged: (bool? newValue) {
                                    state.didChange(newValue);
                                    setState(() {
                                      _agreeToTerms = newValue ?? false;
                                    });
                                  },
                                  activeColor: state.hasError ? Colors.red : Colors.blue,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyles.subtextGrey,
                                        children: [
                                          const TextSpan(text: 'I agree to the '),
                                          
                                          
                                          TextSpan(
                                            text: 'Terms and Conditions',
                                            style: const TextStyle(color: Colors.blue),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print("Terms clicked");
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (state.hasError)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  state.errorText!,
                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        );
                      },
                    ),

                    verticalSpace(16),

                    Center(
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.blue,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            textStyle: TextStyles.titleWhite,
                          ),
                          child: Text("Sign Up", style: TextStyles.titleWhite),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.go('/products');
                            }else{
                              print("Form has errors. Please fix them.");
                            }
                          },
                        ),
                      ),
                    ),

                    verticalSpace(16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyles.subtextGrey,
                        ),
                        horizontalSpace(2),
                        
                        InkWell(
                          onTap: () {
                            print("Login clicked");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: ColorManager.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> _countries = [
  'United States',
  'United Kingdom',
  'Canada',
  'Australia',
  'Egypt',
];

// CHANGE 1: Helper functions for SizedBox
SizedBox verticalSpace(double size) => SizedBox(height: size);
SizedBox horizontalSpace(double size) => SizedBox(width: size);


// CHANGE 3: CustomTextFormField Class
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    this.readOnly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
    );
  }
}