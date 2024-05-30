import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../view_screen/dash_board.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class PreviewFinalPage extends StatefulWidget {
  const PreviewFinalPage({super.key});

  @override
  State<PreviewFinalPage> createState() => _PreviewFinalPageState();
}

class _PreviewFinalPageState extends State<PreviewFinalPage> {
  final List<String> farmingOptions1 = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];
  final List<String> farmingOptions2 = [
    "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?",
    "কালো মাটি সরানো হয়েছে?",
    "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?",
    "ব্লিচিং ব্যবহার করা হয়েছে?",
    "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?",
    "অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?",
    "রাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?",
    "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা",
  ];
  final List<String> farmingOptions3 = [
    "সংলগ্ন খাল",
    "নদী",
    "ভূগর্ভস্থ পানি",
    "বৃষ্টির পানি",
  ];
  final List<String> farmingOptions4 = [
    "খামার তৈরি বা মিক্সড খাদ্য",
    "স্থানীয় ফিড মিল",
    "কোম্পানী কর্তৃক বাজারজাতকৃত খাদ্য",
  ];
  final List<String> farmingOptions5 = [
    "হ্যাচারি এসপিএফ",
    "হ্যাচারি নন এসপিএফ",
    "প্রাকৃতিক",
    "প্রাকৃতিক এবং হ্যাচারি উভয়ই",
  ];
  final List<String> option = ['হ্যাঁ', "না"];

  final List<String> farmingOptions6 = [
    "পিএইচ",
    "লবণাক্ততা",
    "অক্সিজেন",
    "নাইট্রাইট",
    "নাইট্রেট",
    "অ্যামোনিয়া",
    "অন্যান্য",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTitle(title: "মাছের খামার এবং কৃষি ব্যবস্থা"),
                      SizedBox(height: 20),
                      Text("চাষের ধরন/বিভাগঃ "),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: farmingOptions1.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity: ListTileControlAffinity.leading,
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
                      Consumer<FarmingOptionsProvider>(
                          builder: (context, provider, child) {
                        return TitleWithField(
                          readOnly: true,
                          title1: "চাষযোগ্য মোট জমির পরিমান",
                          title2: "শতাংশ",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .landArea,
                        );
                      }),
                      SizedBox(height: 50),
                      CustomTitle(title: "পুকুর প্রস্তুতি"),
                      SizedBox(height: 20),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: farmingOptions2.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(farmingOptions2[index]),
                                value: provider.selectedOptions2[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption2(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTitle(title: "পানির উৎস"),
                      SizedBox(height: 20),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: farmingOptions3.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions3[index]),
                                value: provider.selectedOptions3[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption3(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("লবণাক্ততা:"),
                      const SizedBox(
                        height: 10,
                      ),
                      TitleWithField(
                          title1: "পানিতে লবণাক্ততার পরিমান?",
                          title2: " ",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .saltAmount),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTitle(title: "ব্যবহৃত ফিডের ধরন"),
                      SizedBox(height: 20),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: farmingOptions4.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions4[index]),
                                value: provider.selectedOptions4[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption3(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TitleWithField(
                          title1: "আপনি দিনে কতবার খাবার খাওয়ান",
                          title2: "বার",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .feedAmount),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTitle(title: "PL/ Juvenile এর উৎস"),
                      SizedBox(height: 20),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: farmingOptions5.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions5[index]),
                                value: provider.selectedOptions5[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption5(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TitleWithField(
                          title1: "বাগদা রেণু মজুদ",
                          title2: "প্রতি বিঘা",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .bagdaAmount),
                      TitleWithField(
                          title1: "গলদা রেণু মজুদ",
                          title2: "প্রতি বিঘা",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .galdaAmount),
                      TitleWithField(
                          title1: "বলদা পিছ",
                          title2: "প্রতি বিঘা",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .bagdaPAmount),
                      TitleWithField(
                          title1: "সাদা মাছ",
                          title2: "সাদা মাছ",
                          textFieldValue:
                              Provider.of<FarmingOptionsProvider>(context)
                                  .galdaPAmount),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "***বিশেষ দ্রষ্টব্যঃ  ১ বিঘা = ৩৩ শতাংশ",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTitle(
                          title: "মাছের স্বাস্থ্য এবং পানির গুণাগুণ পরীক্ষা"),
                      SizedBox(height: 20),
                      Text("আপনি কি মাছ/চিংড়ি বৃদ্ধির হার পরীক্ষা করেন?"),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: option.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(option[index]),
                                value: provider.selectedOptions6[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption6(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "আপনি পানির গুনাগুনের নিচের কোন টেস্টগুলো করেন এবং রেকর্ড রাখেন?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: farmingOptions6.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                enabled: false,
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions6[index]),
                                value: provider.selectedOptions7[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption7(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomeButton(
                        title: "সাবমিট করুন",
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()),
                          );
                        },
                      ),
                    ]))));
  }
}
