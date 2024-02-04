import 'package:ex_01/widgets/login_widget.dart';
import 'package:flutter/material.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget                               // Stateless --> ไม่มีการเปลี่ยนแปลง = static
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData 
      (
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX_01'),
    );
  }
}

class MyHomePage extends StatefulWidget                           // Stateful --> มีการเปลี่ยนแปลง = dynamic
{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();          // มี "_" ใช้ได้แค่ใน package เท่านั้น
}

class _MyHomePageState extends State<MyHomePage> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: const Center
      (
        child: LoginWidget(),
      )
    );
  }
}
