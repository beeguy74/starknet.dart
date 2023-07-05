import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starknet_riverpod/starknet_riverpod.dart';
import 'package:starknet_riverpod/wallet_screens/protect_wallet_screen.dart';
import 'package:starknet_riverpod/widgets/wallet_type_icon.dart';

class RecoverWalletScreen extends HookConsumerWidget {
  const RecoverWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedPhrase = useState('');
    final wordsCount =
        seedPhrase.value == '' ? 0 : seedPhrase.value.trim().split(' ').length;
    final isButtonEnabled = wordsCount == 12;
    final accountType = useState(WalletType.openZeppelin);

    return Layout(
      appBar: AppBar(
        title: const Text('Recover Your Wallet'),
      ),
      children: [
        TextField(
          onChanged: (value) => seedPhrase.value = value,
          decoration: InputDecoration(
            labelText: 'Enter your seed phrase ($wordsCount / 12 words)',
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select your wallet type:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              SegmentedButton<WalletType>(
                showSelectedIcon: false,
                segments: const <ButtonSegment<WalletType>>[
                  ButtonSegment<WalletType>(
                      value: WalletType.openZeppelin,
                      icon: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: WalletTypeIcon(type: WalletType.openZeppelin),
                      )),
                  ButtonSegment<WalletType>(
                      value: WalletType.argent,
                      icon: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: WalletTypeIcon(type: WalletType.argent),
                      )),
                  ButtonSegment<WalletType>(
                      value: WalletType.braavos,
                      icon: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: WalletTypeIcon(type: WalletType.braavos),
                      )),
                ],
                selected: {accountType.value},
                onSelectionChanged: (value) => accountType.value = value.first,
              ),
            ],
          ),
        ),
        const Spacer(),
        PrimaryButton(
            onPressed: isButtonEnabled
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProtectWalletScreen(),
                      ),
                    );
                  }
                : null,
            child: const Text('Continue')),
      ],
    );
  }
}
