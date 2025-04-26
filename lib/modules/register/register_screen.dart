import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/components/component_screen.dart';
import '../../core/network/dio.dart';
import '../../main.dart';
import '../payment/cubit/cubit.dart';
import '../payment/cubit/state.dart';
import '../payment/toggle_screen.dart';
import '../widgets/default_button.dart';
import '../widgets/default_textformfiled.dart';
import '../widgets/show_snack.dart';
import 'package:flutter/material.dart';
TextEditingController priceController = TextEditingController();
void main() async {
  runApp(MyAppRegisterScreenn());
}
class MyAppRegisterScreenn extends StatefulWidget {
  const MyAppRegisterScreenn({Key? key}) : super(key: key);

  @override
  _MyAppRegisterScreennState createState() => _MyAppRegisterScreennState();
}

class _MyAppRegisterScreennState extends State<MyAppRegisterScreenn> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider(
        create: (context) => PaymentCubit()..getAuthToken(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Payment Integration',style: TextStyle(color: Colors.grey)),
            backgroundColor: a,
            centerTitle: true,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocConsumer<PaymentCubit, PaymentStates>(
                    listener: (context, state) {
                      if (state is PaymentRequestTokenSuccessStates) {
                        showSnackBar(
                          context: context,
                          text: 'Success get final token',
                          color: g,
                        );
                        navigateTo(context, const ToggleScreen());
                      }
                    },
                    builder: (context, state) {
                      var cubit = PaymentCubit.get(context);
                      return
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [

                                Container(
                                    child: Image.asset(
                                      "assets/icon/icon.png",fit: BoxFit.scaleDown,width: 170,height: 170,
                                    )
                                ),

                                SizedBox(height: 25,),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Row(
                                        children: [
                                          Expanded(
                                            child: DefaultTextFormFiled(
                                              controller: firstNameController,
                                              type: TextInputType.name,
                                              hintText: 'First name',
                                              prefix: Icons.person,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your first name!';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: DefaultTextFormFiled(
                                              controller: lastNameController,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your last name!';
                                                }
                                                return null;
                                              },
                                              type: TextInputType.text,
                                              hintText: 'Last name',
                                              prefix: Icons.person,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 10),
                                      DefaultTextFormFiled(
                                        controller: emailController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email  !';
                                          }
                                          return null;
                                        },
                                        type: TextInputType.emailAddress,
                                        hintText: 'Email',
                                        prefix: Icons.email,
                                      ),
                                      SizedBox(height: 10),
                                      DefaultTextFormFiled(
                                        controller: phoneController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your phone !';
                                          }
                                          return null;
                                        },
                                        type: TextInputType.number,
                                        hintText: 'Phone',
                                        prefix: Icons.phone,
                                      ),
                                      SizedBox(height: 10),
                                      DefaultTextFormFiled(
                                        controller: priceController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your price !';
                                          }
                                          return null;
                                        },
                                        type: TextInputType.number,
                                        hintText: 'Price',
                                        prefix: Icons.monetization_on,
                                      ),
                                      SizedBox(height: 20),

                                      DefaultButton(
                                        buttonWidget:
                                        state is! PaymentRequestTokenLoadingStates
                                            ? const Text(
                                          'Register',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 1.6,
                                          ),
                                        )
                                            : const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        function: () {
                                          if (formKey.currentState!.validate()) {
                                            cubit.getOrderRegistrationID(
                                              firstName: firstNameController.text,
                                              lastName: lastNameController.text,
                                              email: emailController.text,
                                              phone: phoneController.text,
                                              price: priceController.text,
                                            );
                                          }
                                        },
                                        width: MediaQuery.of(context).size.width,
                                        radius: 10.0,
                                        backgroundColor: Colors.black87,
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



