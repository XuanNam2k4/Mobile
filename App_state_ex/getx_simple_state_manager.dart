import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld_xuannam/app_state_ex/getx_ex64.dart';

class ControllerSimpleState extends
    GetxController{
//     ko cần sử dụng bién reactive

static ControllerSimpleState
get({String ? tag}) => Get.find<ControllerSimpleState>
  (tag:tag);

  int count = 0;
  void increase1(){
    count++;
    update(["01"]);
  // gọi uppdate có 1 list object --> chỉ cập nhật liên quan object thoã mãn
    //list object dat trong ngoac []
  }

  void increase2(){
    count++;
    update(["02"]);
  }

  void increaseAll(){
  count++;
  update(["01","02"]);
  }
}

class BinDingController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ControllerSimpleState(),);
  }
}

class BindingTempoController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.create(() => ControllerSimpleState(),permanent: false);
  }
}

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX",
      initialBinding: BinDingController(),
      home: PageSimpleState(),
    );
  }
}





class PageSimpleState extends StatelessWidget {
   PageSimpleState({super.key});
  // final c = Get.put(ControllerSimpleState());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Simple State"),
        backgroundColor:Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          // can vo giua
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<ControllerSimpleState>(
              init: ControllerSimpleState.get(),
                id: "01",
                // 2 cái controller nay giôống nhau
                builder: (controller) => Text("01..${controller.count}",style: TextStyle(fontSize: 20),),
            ),
            GetBuilder<ControllerSimpleState>(
              init: ControllerSimpleState.get(),
              id: "02",
              builder: (controller) => Text("02..${controller.count}",style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increase1();
                },
                child: Text("increase 1")
            ),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increase2();
                },
                child: Text("increase 2")
            ),

            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increaseAll();
                },
                child: Text("increase all")
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(PageCounterGetX(),binding: BindingTempoController());
                },
                child: Text("Next")
            )
          ],
        ),
      ),
    );
  }
}
