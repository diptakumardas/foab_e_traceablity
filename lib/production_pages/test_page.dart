
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/test_page_2.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class TestPage1 extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(title: "পুকুর প্রস্তুতি"),
            SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              child: Consumer<FarmingOptionsProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions2.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(farmingOptions2[index]),
                        value: provider.selectedOptions2[index],
                        onChanged: (bool? newValue) {
                          provider.toggleOption3(index);
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
                title1: "চাষযোগ্য মোট জমির পরিমান",
                title2: "শতাংশ",
                textFieldValue:
                    Provider.of<FarmingOptionsProvider>(context).landArea),
            SizedBox(height: 20),
            CustomeButton(
              title: "পরবর্তী",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
