import 'package:flutter/material.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {

  String ngaysinh = "24/06/2004";
  String? gioitinh = "Nam";
  List<String> ngonNgus = ["JAVA","C#","C/C++","HTML","Python","Dart","Tiếng Việt"];
  String ? ngonNgu;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile64.CNTT-2"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: buildBody(index),

    // cái drawler giống menu
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Huỳnh Xuân Nam"),
                accountEmail: Text("Nam.hx.64cntt@ntu.edu.vn"),
                currentAccountPicture: CircleAvatar(
                  child: Text("Nam",style: TextStyle(color: Colors.lightBlueAccent),),
                backgroundImage: AssetImage("asset/images/hoahong.jpg"),
                ),
            ),
            ListTile(

              title: Text("Inbox"),
              trailing: Text("10"),
              //vi dụ ontap muôn qua sms
              onTap: () {
                setState(() {
                  index = 1;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Draft"),
              trailing: Text("5"),
              onTap: () {
                setState(() {
                  index = 2;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Sent"),
              trailing: Text("7"),
            ),
            ListTile(
              title: Text("Delete"),
              trailing:Text("3"),
            ),
            TextField(),
            ListTile(
              title: Text("Setting"),
            ),
          ],
        ),
      ),

    bottomNavigationBar: BottomNavigationBar(
        // cái này phải từ 2 item trở lên , 1 items là bị lỗi
      currentIndex:index ,
        // khi nháấn thay đôi màu
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items:[
        BottomNavigationBarItem(
          icon:Icon(Icons.home,color: Colors.blue,),
          label: "Home",

        ),
          BottomNavigationBarItem(
              icon:Icon(Icons.sms,color: Colors.orange,),
            label: "SMS"
          ),
        BottomNavigationBarItem(
            icon: Icon(Icons.phone,color: Colors.green,),
          label: "Phone"
        )
        ],
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    ),
    );
  }
  Widget buildHome(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        // muốn cho chữ mình qua là crossAlinghmtent
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            // ảnh image assest
            //   muôn co kich thuoc đat trong container
            //
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 3 /4,
                child: Image.asset("asset/images/hoahong.jpg"),
              ),
            ),
            SizedBox(height: 15,),
            Text("Họ tên:"),
            Text("Huỳnh Xuân Nam",style: TextStyle
              (fontSize:18,color: Colors.blue,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Ngày sinh:"),
            Row(
              children: [
                Expanded(child: Text(ngaysinh,style:
                TextStyle(fontSize: 18),)),
                // phải  box text vào expand
                IconButton(
                    onPressed: () async{
                      var selectedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040)
                      );
                      if(selectedDate != null){
                        ngaysinh = "${selectedDate.day}/${selectedDate.month}"
                            "/${selectedDate.year}";
                        //   chưa gọi ra giao diẹn phải gọi lại setState
                        setState(() {

                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month)
                ),
                SizedBox(width: 30,),

              ],

            ),
            SizedBox(height: 15,),
            Text("Giới tính:"),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Nam"),
                    // value là gia trị co dinh , groupValue là gia tri thay doi
                    // onchange là ham khi click vào thay đôi giá trị
                    value: "Nam",
                    groupValue: gioitinh,
                    //Khi value  =  groupValue thì radio sẽ duọc chọn
                    onChanged: (value) {
                      setState(() {
                        gioitinh = value;
                      });
                    },
                  ),
                )
                ,

                Expanded(
                  child: RadioListTile(
                    title: Text("Nữ"),
                    // value là gia trị co dinh , groupValue là gia tri thay doi
                    // onchange là ham khi click vào thay đôi giá trị
                    value: "Nu",
                    groupValue:gioitinh,
                    onChanged: (value) {
                      setState(() {
                        gioitinh = value;
                      });
                    },


                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Text("Sở thích:"),
            Text("Xem phim ,Xe con Audi ,Nghe nhạc , Thể thao "
                ",Tiền Nhà Giàu ,Guitar,Thời trang, ..." , style: TextStyle(fontSize: 15,
                fontStyle: FontStyle.italic),),
            SizedBox(height: 15,),
            Text("Ngôn ngữ lập trình giỏi nhất của bạn:"),
            DropdownButton<String>(
              // để dày xấu nên là cho bung ra hêt màn hình cho expand
              isExpanded: true,
              // value sẽ là cái thay đôi cái đầu mặc định
              value: ngonNgu,//thay đổi , khi value bằng với
              // value của menuitem thì item đó sẽ được chọn
              //item là 1 listwidget
              //item sẽ là dropdown menu
              // map là chuyển đôi vd: từ tiền thành vàng
              items: ngonNgus.map(
                // map lam viec với list hoac tostring
                    (e) => DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.abc, size: 40, color: Colors.blue,),
                      SizedBox(width: 40,),
                      Text(e),
                    ],
                  ),

                  value: e,//cố định
                ),
              ).toList(),
              onChanged: (value) { // value của DropdownMenuitem
                setState(() {
                  ngonNgu = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget buiLdSMS(){
    return Center(
      child: Text("SMS",style: TextStyle(fontSize: 20),),
    );
  }
  Widget buiLdPhone(){
    return Center(
      child: Text("Phone",style: TextStyle(fontSize: 20),),
    );
  }
  
  Widget buildBody(int index){
    switch(index){
      case 0: return buildHome();
      case 1: return buiLdSMS();
      case 2: return buiLdPhone();
    }
    return buildHome();
  }
}
