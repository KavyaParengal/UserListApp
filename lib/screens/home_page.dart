
import 'package:flutter/material.dart';
import 'package:listapp/customWidgets/custom_text.dart';
import 'package:listapp/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserDataProvider>(context, listen: false).getAllDatas();
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width - 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Items',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Consumer<UserDataProvider> (
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final userDatas = value.userDatas;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: userDatas.length,
              itemBuilder: (context, index) {
                final users = userDatas[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Title : ',style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: itemWidth,
                                    ),
                                    child: Text(users.title!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  Text('Body : ',style: const TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: itemWidth,
                                    ),
                                    child: Text(users.title!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2,),
                    const Divider(thickness: 1,)
                  ],
                );
              }
          );
        }
      ),

    );
  }
}
