import 'package:flutter/material.dart';

void main () {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: const ResponsiveNavbar(),
    );
  }
}

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({super.key});

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TESTE"),
      ),
      body: const Text("Container"),
    );
  }
}