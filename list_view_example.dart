//go st
import 'package:flutter/material.dart';
//naãy nó lỗi nhấn alt + Enter
class PageListView extends StatelessWidget {
  const PageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My List View"),
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
            var itemData = data[index];
            return ListTile(
              leading: Text("${index + 1}" , style: TextStyle(fontSize: 16),),
              title: Text(itemData.ten),
              subtitle: Text("Trái cây việt gap",style: TextStyle(
                  fontStyle:FontStyle.italic),),
              trailing: Text("${itemData.gia} VND",style:TextStyle(color: Colors.red)),
              // nó làm hàm ko tham số trả về void
              // gõ ctrol + space
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                    SnackBar(
                        content: Text("Bạn đã chọn sản phẩm ${itemData.ten}"),
                        // ta đang viết hàm khởi tạo cho duration
                       duration: Duration(seconds: 5),
                    )
                );
              },
            );
          },
          separatorBuilder: (context,index) => Divider(thickness: 1.5,),
          itemCount: data.length
      ),
    );
  }
}

class SanPham {
  String ten;
  int gia;


  SanPham({
    required this.ten,
    required this.gia
  });



}
var data = [
  SanPham(ten: "Chuối",gia: 25000),
  SanPham(ten: "Bưởi",gia: 50000),
  SanPham(ten: "Chôm chôm",gia: 50000),
  SanPham(ten: "Xoài",gia: 45000),
  SanPham(ten: "Mít",gia: 40000),
  SanPham(ten: "Mẳng cầu",gia: 50000),
  SanPham(ten: "Dưa chuột",gia: 50000),
  SanPham(ten: "Nhãn",gia: 27000),
  SanPham(ten: "Dừa",gia: 100000),
  //ta gõ ctrol + D sau dáu phảy của từng sp để copy
  SanPham(ten: "Măng cụt",gia: 40000),
  SanPham(ten: "Sơ ri",gia: 22000),
  SanPham(ten: "Me",gia: 23000),
];


