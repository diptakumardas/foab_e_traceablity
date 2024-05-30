
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/pp2.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class ProductionPage1 extends StatefulWidget {
  const ProductionPage1({super.key});

  @override
  State<ProductionPage1> createState() => _ProductionPage1State();
}

class _ProductionPage1State extends State<ProductionPage1> {
  final List<String> farmingOptions1 = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(title: "মাছের খামার এবং কৃষি ব্যবস্থা"),
                    SizedBox(height: 50),
                    const Text("চাষের ধরন/বিভাগঃ "),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: farmingOptions1.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions1[index]),
                                value: provider.selectedOptions1[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption1(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TitleWithField(
                        keyBoardType: TextInputType.number,
                        title1: "চাষযোগ্য মোট জমির পরিমান",
                        title2: "শতাংশ",
                        textFieldValue:
                            Provider.of<FarmingOptionsProvider>(context)
                                .landArea),
                    SizedBox(height: 50),
                    CustomeButton(
                      title: "পরবর্তী",
                      onClicked: () {
                        final provider = Provider.of<FarmingOptionsProvider>(
                            context,
                            listen: false);
                        if (provider.selectedOptions1.contains(true)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductionPage2()),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Warning"),
                                content:
                                    Text("Please select at least one option."),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ]),
            )));
  }
}
