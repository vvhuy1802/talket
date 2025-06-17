import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:talket/presentation/module/chat/providers/auth_providers.dart';
import 'package:talket/presentation/module/chat/providers/states/auth_state.dart';
import 'package:talket/presentation/module/chat/widgets/app_bar_chat.dart';
import 'package:talket/presentation/module/chat/widgets/chat_item.dart';

import '../../../domain/model/conversion/conversion_args.dart';
import '../../navigation/routes.gr.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(authStateNotifierProvider);
    ref.listen(
      authStateNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        } else if (next is Success) {
          debugPrint("${next.data?.toJson()}");
        }
      }),
    );
    return Scaffold(
      appBar: AppBarChat(
        title: "Chat",
        onLeftPressed: () {
          ref.read(authStateNotifierProvider.notifier).loginUser(
                "vuhuy6471@gmail.com",
                "Huydakia12@",
              );
        },
      ),
      body: SafeArea(
        child: Stack(children: [
          Padding(
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
          state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ]),
      ),
    );
  }
}
