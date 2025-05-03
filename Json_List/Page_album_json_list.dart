import 'package:flutter/material.dart';
import 'package:helloworld_xuannam/json_list/json_data.dart';

class PageAlbum extends StatelessWidget {
  const PageAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album 64.CNTT-2"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // sao sử dụng futute --> bởi vì composst bọc trong dữ liệu futute
      body: FutureBuilder<List<Album>>(
        future: docDuLieu(),
        builder: (context, snapshot) {
          // print(snapshot.error);
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("lỗi rồi!!!"),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = snapshot.data!;
          return ListView.separated(

            itemBuilder: (context, index) {
              Album album = list[index];
              return ListTile(
                leading: Text("${album.albumId}"),
                title: Text("${album.title}"),
                subtitle: Text("${album.url}"),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
