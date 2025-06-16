import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:talket/presentation/module/chat/widgets/app_bar_chat.dart';
import 'package:talket/presentation/module/chat/widgets/chat_item.dart';
import 'package:talket/presentation/navigation/routes.gr.dart';

import '../../../domain/model/conversion/conversion_args.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarChat(),
      body: SafeArea(
        child: Padding(
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
                      child: ChatItem(
                        onTap: () {
                          AutoRouter.of(context).push(ConversionRoute(
                              args: ConversionArgs(
                                  from: 'Huy', to: 'Minh Khanh')));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
