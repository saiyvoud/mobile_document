import 'package:flutter/material.dart';
import 'package:mobile_document/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DocumentOut extends StatefulWidget {
  const DocumentOut({super.key});

  @override
  State<DocumentOut> createState() => _DocumentOutState();
}

class _DocumentOutState extends State<DocumentOut> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<HomeProvider>(
      builder: (context, api, child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: api.document_out.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 120,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.indigo,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.file_copy,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ລະຫັດເອກະສານ: ${api.document_out[index]['numberID']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ຫົວຂໍ້: ${api.document_out[index]['title']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ເບີຕິດຕໍ່: ${api.document_out[index]['phoneNumber']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ສະຖານະ: ${api.document_out[index]['status']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
