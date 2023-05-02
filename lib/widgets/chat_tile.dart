import 'package:flutter/material.dart';
import '../../models/message_model.dart';
import '../../models/product_model.dart';
import '../../pages/detail_chat_page.dart';
import '../theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailChatPage(
            productModel: UninitilizedProductModel(),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image_shop_logo.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '${messageModel.message}',
                        overflow: TextOverflow.ellipsis,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(
              thickness: 1,
              color: Color(0xFF2B2939),
            )
          ],
        ),
      ),
    );
  }
}
