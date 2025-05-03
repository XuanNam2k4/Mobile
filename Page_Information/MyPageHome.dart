import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Mypagehome(title: '',),
    );
  }
}




class Mypagehome extends StatefulWidget {
  const Mypagehome({super.key,required this.title});

  final String title;

  @override
  State<Mypagehome> createState() => _MypagehomeState();
}

class _MypagehomeState extends State<Mypagehome> {
  String message = "Hello";
  TextEditingController txtname = TextEditingController();
  TextEditingController txtNgaysinh = TextEditingController();
  String image = "https://th.bing.com/th/id/R.55816da8f31c80436817d1b709914f81?rik=qd6%2bMDaSY5KApg&pid=ImgRaw&r=0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
     

      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          children: [
            Container(
              width: 400, height: 300,
              child: Image.network(image),
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text("Hello Mobile App"),
            TextField(
              controller: txtname,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: txtNgaysinh,
              decoration: InputDecoration(
                labelText: "Ngaỳ sinh",
                hintText: "Nhập ngày sinh vào đây",
              ),
              keyboardType: TextInputType.datetime,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  message = (message == "Hello") ? "chào" : "Hello";
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Chào : ${txtname.text}"),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
              child: const Text("Click me"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),


    );
  }
}
