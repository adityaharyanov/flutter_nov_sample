import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/router/navigator.dart';

class WrappedBottomSheet extends StatelessWidget with BaseNavigator {
  final String? title;
  final Widget? content;
  WrappedBottomSheet({this.title, this.content, super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: Wrap(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(
                    // A normal IconButton
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      pop();
                    }),
                Flexible(
                  // A Flexible widget that will make its child flexible
                  child: Text(
                    title ?? "", // A very long text
                    overflow:
                        TextOverflow.ellipsis, // handles overflowing of text
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: content,
          )
        ],
      ),
    );
  }
}
