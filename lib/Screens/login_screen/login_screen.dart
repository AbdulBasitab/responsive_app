import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/Routes/router.dart';
import 'package:responsive_web_app/Utils/data_constants.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';
import 'package:responsive_web_app/utils/theme_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppTheme.appBarColor,
      ),
      backgroundColor: AppTheme.scaffoldBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.3,
              child: TextField(
                controller: emailController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.spMin),
            SizedBox(
              width: screenWidth * 0.3,
              child: TextField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onSubmitted: (value) {},
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.spMin),
            SizedBox(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              child: Consumer<ResponsiveAppProvider>(
                builder: (context, provider, child) => ElevatedButton(
                  onPressed: () async {
                    String? routeLocation =
                        preferences?.getString(deepLinkRouteLocation);
                    String? storageRouteLocation =
                        storage?.read(storageDeepLinkRouteLocation);
                    String result = await provider.signInUsingEmail(
                        emailController.text, passwordController.text);
                    if (result == 'Success' && mounted) {
                      context.pushReplacementNamed(RoutesName.homeScreen);
                      context.go((storageRouteLocation == null ||
                              storageRouteLocation == '/home')
                          ? '/dashboard'
                          : storageRouteLocation);
                      // context.go((routeLocation == null ||
                      //         routeLocation == '/home')
                      //     ? '/dashboard'
                      //     : routeLocation);
                      return;
                    } else {
                      Fluttertoast.showToast(
                        msg: result,
                      );
                      return;
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.orange.shade700,
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: Center(
                    child: (provider.isLoading == true)
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
