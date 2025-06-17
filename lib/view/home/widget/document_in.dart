import 'package:flutter/material.dart';
import 'package:mobile_document/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DocumentIn extends StatefulWidget {
  const DocumentIn({super.key});

  @override
  State<DocumentIn> createState() => _DocumentInState();
}

class _DocumentInState extends State<DocumentIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<HomeProvider>(
      builder: (context, api, child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: api.document_in.length,
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
                          Text("ລະຫັດເອກະສານ: ${api.document_in[index]['numberID']}",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("ຫົວຂໍ້: ${api.document_in[index]['title']}",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("ເບີຕິດຕໍ່: ${api.document_in[index]['phoneNumber']}",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("ສະຖານະ: ${api.document_in[index]['status']}",style: TextStyle(fontWeight: FontWeight.bold)),
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
