import 'package:flutter/material.dart';
import 'package:helloworld_xuannam/chi_tiet_sp.dart';
import 'package:helloworld_xuannam/listview/list_view_example.dart';
// class PageGridView extends StatelessWidget {
//     PageGridView({super.key});
// ban đầu dày muốn sang sự kiện là satefull
class PageGridView extends StatefulWidget {
    PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  String image = "https://th.bing.com/th/id/OIP.wFZDNPgpXSS6kbaJ8faWnAHaHa?rs=1&pid=ImgDetMain";
  int cout = 0;
  @override
  Widget build(BuildContext context) {
    // giao diện vẫn là material vẫn là scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("My grid view"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              Icon(
               Icons.shopping_cart,color: Colors.red,size: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 4),
                child: Text("${cout}",style: TextStyle(color: Colors.white,
                    fontSize: 12),),
              )

            ],
          ),
          SizedBox(width: 15,)
        ],
      ),
      body:GridView.extent(
          // maxcrossexxit trục ngang
          // mỗi ô lưới 200
          maxCrossAxisExtent: 200,
      //   khoảng cách ô lưới bao nhiêu
        mainAxisSpacing: 5,
        crossAxisSpacing:5,
        childAspectRatio: 0.75,
        children:
        //   cung cấp danh sách cụ thẻ là column
          data.map(
              (e) {
                return Card(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                           child: Image.network(image),
                          ),
                        ),
                        Text(e.ten),
                        Text("${e.gia}")
                      ],
                    ),
                    onTap: () async{

                      // setState(() {
                      //   cout++;
                      // });
                  //     đưa vào
                      String message = await Navigator.of(context).push
                    (MaterialPageRoute(builder: (context) => PageChiTiet(),));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                  ));
                    },
                  ),
                );
              },
          ).toList(),
      ),
    );
  }
}
