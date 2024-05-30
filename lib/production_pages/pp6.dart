
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/preview_final_page.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_title.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {

  final List<String> option = [
    'হ্যাঁ',
    "না"
  ];

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
    padding: EdgeInsets.all(16.0),
    child:
    SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTitle(title: "মাছের স্বাস্থ্য এবং পানির গুণাগুণ পরীক্ষা"),
        SizedBox(height: 50),
        const Text("আপনি কি মাছ/চিংড়ি বৃদ্ধির হার পরীক্ষা করেন?"),
        const SizedBox(
        height: 10,
        ),
          Container(
            height: MediaQuery.of(context).size.height * .13,
            width: MediaQuery.of(context).size.width,
            child: Consumer<FarmingOptionsProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: option.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      activeColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.leading,
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
          Container(
            height: MediaQuery.of(context).size.height * .50,
            width: MediaQuery.of(context).size.width,
            child: Consumer<FarmingOptionsProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: farmingOptions6.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      activeColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.leading,
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
          ),
          const SizedBox(
            height: 15,
          ),
        
          CustomeButton(
            title: "পরবর্তী",
            onClicked: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreviewFinalPage()),
              );
            },
          ),
        ]
        ),
      ),
    )
    )

    );
  }
}
