import 'package:flutter/material.dart';
import 'widgets/button.dart';
import 'widgets/currency_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Total Balance',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        text: 'Transfer',
                        bgColor: Color(0xFFF1B33B),
                        textColor: Colors.black),
                    Button(
                        text: 'Request',
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'view All',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '55 622',
                    icon: Icons.attach_money,
                    isInverted: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
