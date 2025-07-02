import 'package:flutter/material.dart';
import 'package:mobile_document/provider/home_provider.dart';
import 'package:mobile_document/router/router.dart';
import 'package:mobile_document/view/home/widget/document_in.dart';
import 'package:mobile_document/view/home/widget/document_out.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<HomeProvider>(
      builder: (context, api, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,

            title: Text(
              "ຕິດຕາມເອກະສານ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouterAPI.login);
                },
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 50,
                          width: size.width / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: api.search,
                            onFieldSubmitted: (value) {
                              api.searchIn();
                              api.searchOut();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: "ຄົ້ນຫາເອກະສານຂອງທ່ານ",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            api.searchIn();
                            api.searchOut();
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'ຄົ້ນຫາ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "ເອກະສານຂາເຂົ້າ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
                DocumentIn(),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "ເອກະສານຂາອອກ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
                DocumentOut(),
              ],
            ),
          ),
        );
      },
    );
  }
}
