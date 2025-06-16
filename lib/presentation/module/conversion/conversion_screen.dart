import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:talket/presentation/module/conversion/widgets/app_bar_conversion.dart';

import '../../../domain/model/conversion/conversion_args.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key, required this.args});

  static const routeName = '/conversion';
  final ConversionArgs args;

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  late final ConversionArgs _args;

  @override
  void initState() {
    super.initState();
    _args = widget.args;
    debugPrint('From: ${_args.from}, To: ${_args.to}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarConversion(
        leading: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: Navigator.of(context).pop,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 4),
                Text("Back"),
              ],
            ),
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Minh Khanh Mobile",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              "last seen recently",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        trailing: CircleAvatar(
          child: Text("M"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 400),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Text("Hello")
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
