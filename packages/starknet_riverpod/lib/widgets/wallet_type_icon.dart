import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starknet_riverpod/starknet_riverpod.dart';

class WalletTypeIcon extends StatelessWidget {
  final WalletType type;
  final double width;
  final BoxFit fit;
  final Color? color;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;

  const WalletTypeIcon({
    Key? key,
    required this.type,
    this.width = 20,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "packages/starknet_flutter/assets/images/wallets/${type.name}.svg",
      width: width,
      fit: fit,
      color: color,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
    );
  }
}
