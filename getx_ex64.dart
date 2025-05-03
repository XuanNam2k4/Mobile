import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerCounter extends GetxController{
  final _counter = 0.obs;
  int get counter => _counter.value;


  void increase(){
    _counter.value++;
  }
}

class PageCounterGetX extends StatelessWidget {
   PageCounterGetX({super.key});

  final ControllerCounter c = Get.put(ControllerCounter());
   final controller2 = Get.put(ControllerCounter(),tag: "my tag");

  @override
  Widget build(BuildContext context) {
    //láy ra

    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Example"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("controller : ${c.counter}"),),
            GetX<ControllerCounter>(
                builder: (controller) => Text
                  ("controller : ${controller._counter}"),
            ),
            GetX<ControllerCounter>(
              tag: "my tag",
              builder: (controller)
              => Text("controller2 : ${controller._counter}"),
            ),
            ElevatedButton(
                onPressed: () {
                  c.increase();
                //   thay cho controller2
                  controller2.increase();
                },
                child: Text(" + ",style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
