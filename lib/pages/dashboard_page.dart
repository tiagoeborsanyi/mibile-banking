import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:mobile_banking/data_json/balance_json.dart';
import 'package:mobile_banking/pages/card_page.dart';
import 'package:mobile_banking/theme/color.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1661956601030-fdfb9c7e9e2f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=884&q=80'),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(AntDesign.search1),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * .25,
          decoration: const BoxDecoration(
            color: primary,
          ),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: size.width * .7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    balanceLists[index]['currency'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(.5),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    balanceLists[index]['amount'],
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                balanceLists[index]['description'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: white.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Add money",
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Exchange",
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 40, left: 20, right: 20),
                child: getAccountSection(),
              )),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Accounts",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                AntDesign.wallet,
                                color: primary,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "40832-810-7000-012345",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(thickness: .5),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            MaterialIcons.euro_symbol,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "18 199.24 EUR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(thickness: 1),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            MaterialCommunityIcons.currency_gbp,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "36.67 GBP",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cards",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 90,
                height: 22,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Ionicons.ios_add,
                      size: 16,
                      color: primary,
                    ),
                    Text(
                      "ADD CARD",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CardPage(),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(.25),
                      spreadRadius: 10,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                    AntDesign.creditcard,
                                    color: primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                "EUR *2330",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          const Text(
                            "8 199.24 EUR",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
