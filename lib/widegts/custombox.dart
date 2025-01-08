import 'package:flutter/material.dart';

class ReusableWalletCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount1;
  final String amount2;
  final Color subtitleColor;
  final bool showButtons;
  final String? button1Text;
  final String? button2Text;
  final VoidCallback? onButton1Tap;
  final VoidCallback? onButton2Tap;
  final VoidCallback? onMore;

  const ReusableWalletCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount1,
    required this.amount2,
    this.subtitleColor = Colors.grey,
    this.showButtons = true,
    this.button1Text,
    this.button2Text,
    this.onButton1Tap,
    this.onButton2Tap,
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWalletInfoCard(context),
        if (showButtons) _buildActionButtons(context),
      ],
    );
  }

  Widget _buildWalletInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.indigo,
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  amount2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onButton1Tap,
                    child: Text(
                      button1Text ?? "Withdraw",
                      style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: onButton2Tap,
                    child: Text(
                      button2Text ?? "Transfer",
                      style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: onMore,
            child: Container(
              padding: const EdgeInsets.only(left: 6, top: 6),
              height: 50,
              color: Colors.grey[200],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo),
                ),
                child: const Center(
                  child: Text(
                    "More",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
