import 'package:flutter/material.dart';
import 'package:wallet/widegts/card.dart';
import 'package:wallet/widegts/custombox.dart';

class CardAndWalletsScreen extends StatelessWidget {
  const CardAndWalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card & Wallets',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBoxx(
              imagePath: 'assets/lifelinecard.png',
              cardStatus: 'Inactive',
              cardStatusColor: Colors.red,
              guideText: 'Learn More',
              onGuidePressed: () {},
            ),
            const SizedBox(height: 16),
            buildActivationSection(context),
            _buildWalletSection(context),
          ],
        ),
      ),
    );
  }

  Widget buildActivationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activate your LifelineCard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '₹ 3499/-  Lifetime',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '₹ 9999/Year',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Offer Ends Soon!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Activate Now'),
                  ),
                ],
              ),
              Image.asset(
                'assets/man.png',
                height: 140,
              ),
            ],
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          const Text(
            'Our Features',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Text(
                      'CP EMI Limit: ₹74425',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Text(
                      'CP EMI Limit: ₹74425',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildFeatureItem("assets/udhar.png", 'Udhar'),
                  buildFeatureItem(
                    "assets/emi.png",
                    'CP EMI',
                  ),
                  buildFeatureItem(
                    "assets/funds.png",
                    'Business Funds',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFeatureItem(
    String imagePath,
    String title,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildWalletSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Wallets",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ReusableWalletCard(
          title: "Lifeline Card Wallet",
          subtitle: "Upcoming EMI/Udhar",
          amount1: "4356",
          amount2: "4356",
          showButtons: true,
          onButton1Tap: () {},
          onButton2Tap: () {},
          onMore: () {},
        ),
        const SizedBox(height: 20),
        ReusableWalletCard(
            title: "Lifeline Coin",
            subtitle: "Lifeline Magic Coin",
            amount1: "4356",
            amount2: "600",
            subtitleColor: Colors.indigo,
            showButtons: true,
            button1Text: "11th Sep 2023",
            button2Text: " ",
            onButton1Tap: () {},
            onButton2Tap: () {},
            onMore: () {}),
        const SizedBox(height: 20),
        ReusableWalletCard(
          title: "Cashback Coin",
          subtitle: "Add credit coin",
          amount1: "4356",
          amount2: "",
          subtitleColor: Colors.red,
          showButtons: true,
          button1Text: "11th Sep 2023",
          button2Text: " ",
          onMore: () {},
        ),
      ],
    );
  }
}
