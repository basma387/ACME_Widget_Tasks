import 'package:flutter/material.dart';
import 'package:widgettasks/theme/textStyles.dart';
import 'package:widgettasks/theme/colors.dart';

class createAccount extends StatefulWidget{
  const createAccount({super.key});
  @override
  State<createAccount> createState() => _createAccountState();
}
  class _createAccountState extends State<createAccount> {
  bool _obscurePassword = true; 
  bool _obscureConfirmPassword = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _selectedGender;
  String? _selectedCountry;

  bool _agreeToTerms = false;
  bool _receiveUpdates=false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override

        Widget build(BuildContext context){
          return MaterialApp(
            debugShowCheckedModeBanner:false,
            home: Scaffold(
              backgroundColor: ColorManager.lightBlue,
              appBar: AppBar(
                backgroundColor: ColorManager.blue,
                centerTitle:true,
                title: Text(
                  'Create Account',
                  style:TextStyles.titleWhite,
                  
                ),
                leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/screen');
                      },
                    ),
                ),

                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal:16.0, vertical: 20.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: _formKey,
                        child:Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Color(0xffE8F2FE),
                            child: const Icon(Icons.person, size:60, color:ColorManager.blue),
                            ),
                          ),

                            Center (
                              child:Text(
                              "Welcome",style: TextStyles.titleBlack,),
                            ),

                            Center(
                              child:Text("Create your account to get started",style: TextStyles.subtextGrey,),
                          ),
                        

                              SizedBox(height:15),

                              Text(
                                "Full Name",
                                textAlign: TextAlign.left,
                                style: TextStyles.subtitleBlack,
                                ),
                                SizedBox(height:8),
                                TextFormField(
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText:'Enter your full name',
                                    prefixIcon: Icon(Icons.person_outline),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    )
                                ),

                                SizedBox(height:15),

                                Text("Email", textAlign: TextAlign.left, style: TextStyles.subtitleBlack,),
                                SizedBox(height:8),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText:'Enter your email',
                                    prefixIcon: Icon(Icons.mail_outline),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),

                                SizedBox(height:16),

                                Text("Password",textAlign: TextAlign.left, style:TextStyles.subtitleBlack),
                                SizedBox(height:8),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    prefixIcon:Icon(Icons.lock_clock_outlined),
                                      suffixIcon: IconButton(
                                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                      ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return 'Please enter a password';
                                    return null;
                                    },
                                ),

                                SizedBox(height:16),

                                Text("Confirm Password",textAlign: TextAlign.left, style:TextStyles.subtitleBlack),
                                SizedBox(height:8),
                                TextFormField(
                                  controller: _confirmPasswordController, 
                                  obscureText: _obscureConfirmPassword,
                                  decoration: InputDecoration(
                                    hintText: "Confirm your password",
                                    prefixIcon:Icon(Icons.lock_clock_outlined),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                                      onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                                    ),
                                  ),
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

                                SizedBox(height:16),

                                Text("Gender", textAlign:TextAlign.left, style:TextStyles.subtitleBlack),

      
                                SizedBox(height: 8),
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

                                SizedBox(height:16),

                                Text("Country",textAlign: TextAlign.left, style:TextStyles.subtitleBlack),
                                SizedBox(height:8),
                                DropdownButtonFormField<String>(
                                  initialValue: _selectedCountry,
                                  decoration: InputDecoration(
                                    alignLabelWithHint:true,
                                    hintText:'Select your country',
                                    prefixIcon: Icon(Icons.language,),
                                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
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

    SizedBox(height: 2),

    // --- TERMS AND CONDITIONS CHECKBOX ---
    FormField<bool>(
      initialValue: _agreeToTerms,
      validator: (bool? value) {
        // If the value is false or null (unchecked), return an error
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
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to top
              children: [
                // The Checkbox
                Checkbox(
                  value: state.value??false, // Use the FormField's value
                  onChanged: (bool? newValue) {
                    // Update BOTH the FormField state AND your local variable
                    state.didChange(newValue);
                    setState(() {
                      _agreeToTerms = newValue ?? false;
                    });
                  },
                  // Highlight the checkbox red if there's an error
                  activeColor: state.hasError ? Colors.red : Colors.blue, 
                ),
                
                // The Text (Expanded prevents it from overflowing)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyles.subtextGrey, // Default text style
                        children: const [
                          TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(color: Colors.blue), // Blue text
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // If the validator returns an error, display it in red below the row
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

                        SizedBox(height:16),
                        
                        Center(
                          child: Container(
                            width:double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.blue,
                            foregroundColor: Colors.black,
                            elevation:0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              textStyle: TextStyles.titleWhite,
                              ),
                              child: Text("Sign Up", style:TextStyles.titleWhite,),
                              onPressed:(){
                              Navigator.pushNamed(context, '/Profile');
                              }
                            ),
                        ),
                        ),

                            SizedBox(height: 16),

                            Center(
                            child: Row(children: [
                              Text(
                                "Already have an account?",
                                style:TextStyles.subtextGrey,
                              ),
                              SizedBox(width:2),
                              Text("Login", style:TextStyle( color:ColorManager.blue, fontSize:15, fontWeight: FontWeight.bold), )
                            ],
                            ),
                            ),

                            SizedBox(height:10),
                        

                      ],
                      ),
                      )
                    )
                  )
                )
                )

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