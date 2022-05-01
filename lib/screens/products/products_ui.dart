import 'package:flutter/material.dart';
import 'package:restapiflutter/models/user_model.dart';
import 'package:restapiflutter/services/api_service.dart';


class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

   late List<UserModel>? _userModel = [];

  @override
    void initState() {
    super.initState();
    _getData();
  }

   void _getData() async {
_userModel = (await ApiService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),

                        ],
                      ),
                   
                    ],
                  ),
                );
              },
            ),
    );
  }
}
 


