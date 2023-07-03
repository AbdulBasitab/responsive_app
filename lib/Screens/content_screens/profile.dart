import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';

import '../../widgets/custom_scaffold_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  ResponsiveAppProvider? provider;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _controller.view, curve: Curves.easeIn);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward();
      // final GoRouter route = GoRouter.of(context);
      // final String location = route.location;
      // (location.startsWith('/profile'))
      //     ? context.read<ResponsiveAppProvider>().setSelectedItem('profile')
      //     : null;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<ResponsiveAppProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    // if (mounted) {
    //   final GoRouter route = GoRouter.of(context);
    //   final String location = route.location;
    //   (location.startsWith('/profile'))
    //       ? provider!.setSelectedItem('profile')
    //       : null;
    // }
    return CustomScaffoldPage(
      appBarTitle: "Profile",
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8).h,
          child: IconButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color(0xff263743),
              ),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 24.spMin,
              color: Colors.white,
            ),
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return profileWebWidget(context, constraints);
          } else {
            return profileMobileWidget(context, constraints);
          }
        },
      ),
    );
  }

  Padding profileMobileWidget(
      BuildContext context, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25).h,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          FadeTransition(
            opacity: _animation,
            //filterQuality: FilterQuality.high,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preferences",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14).h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Color Mode",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.spMin,
                            ),
                          ),
                          RadioMenuButton(
                            value: false,
                            groupValue: false,
                            onChanged: (value) {},
                            child: Text(
                              "White",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          RadioMenuButton(
                            value: true,
                            groupValue: true,
                            style: const ButtonStyle(),
                            onChanged: (value) {},
                            child: Text(
                              "Dark",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.01),
                      SizedBox(
                        width: constraints.maxWidth,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Language',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "English",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.spMin),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                ),
                SizedBox(height: 25.spMin),
                Text(
                  "Access",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14).h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(color: Color(0xff8F979C)),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8F979C),
                                style: BorderStyle.solid),
                          ),
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabled: false,
                          hintText: "jason",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password hint',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "asd123",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 45.spMin),
                      ElevatedButton(
                        onPressed: () {},
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
                        child: Text(
                          "Change Password",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.spMin),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                ),
                SizedBox(height: 25.spMin),
                Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ).h,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "abc@gmail.com",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "(123)313-456",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.spMin),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                ),
                SizedBox(height: 25.spMin),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ).h,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Address line 1',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "7 Willoghbly Court",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Address line 2',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "Durham",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'State',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "NYC",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.spMin),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Zip Code',
                          labelStyle: TextStyle(
                            color: const Color(0xffC3C7CA),
                            fontSize: 13.spMin,
                          ),
                          disabledBorder: const UnderlineInputBorder(),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC3C7CA)),
                          ),
                          hintText: "123456",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding profileWebWidget(BuildContext context, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preferences",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14).h,
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Color Mode",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.spMin,
                            ),
                          ),
                          RadioMenuButton(
                            value: false,
                            groupValue: false,
                            onChanged: (value) {},
                            child: Text(
                              "White",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          RadioMenuButton(
                            value: true,
                            groupValue: true,
                            style: const ButtonStyle(),
                            onChanged: (value) {},
                            child: Text(
                              "Dark",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: constraints.maxWidth * 0.10),
                      SizedBox(
                        width: constraints.maxWidth * 0.15,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Language',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "English",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.spMin),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                  endIndent: 200,
                ),
                SizedBox(height: 25.spMin),
                Text(
                  "Access",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.spMin),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14).h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.16,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                              color: const Color(0xff8F979C),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff8F979C),
                                  style: BorderStyle.solid),
                            ),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabled: false,
                            hintText: "jason",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.04),
                      SizedBox(
                        width: constraints.maxWidth * 0.20,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password hint',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "asd123",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 45.spMin),
                      ElevatedButton(
                        onPressed: () {},
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
                        child: Text(
                          "Change Password",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.025),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                  endIndent: 200,
                ),
                SizedBox(height: constraints.maxHeight * 0.07),
                Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ).h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.35,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "abc@gmail.com",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 35.spMin),
                      SizedBox(
                        width: constraints.maxWidth * 0.2,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "(123)313-456",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.spMin),
                const Divider(
                  color: Color(0xff45505A),
                  height: 10,
                  endIndent: 200,
                ),
                SizedBox(height: 25.spMin),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 18.spMin,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ).h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.15,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Address line 1',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "7 Willoghbly Court",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.05),
                      SizedBox(
                        width: constraints.maxWidth * 0.15,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Address line 2',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 35.spMin),
                      SizedBox(
                        width: constraints.maxWidth * 0.12,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'City',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "Durham",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.spMin),
                      SizedBox(
                        width: constraints.maxWidth * 0.12,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'State',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "NYC",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.spMin),
                      SizedBox(
                        width: constraints.maxWidth * 0.12,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Zip Code',
                            labelStyle: TextStyle(
                              color: const Color(0xffC3C7CA),
                              fontSize: 13.spMin,
                            ),
                            disabledBorder: const UnderlineInputBorder(),
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffC3C7CA)),
                            ),
                            hintText: "123456",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
