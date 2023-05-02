import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/message_model.dart';
import '../../models/product_model.dart';
import '../../providers/auth_provider.dart';
import '../../services/messages_service.dart';
import '../../widgets/chat_bubble.dart';
import '../theme.dart';

// ignore: must_be_immutable
class DetailChatPage extends StatefulWidget {
  DetailChatPage({super.key, required this.productModel});

  ProductModel productModel;

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/image_shop_logo_online.png',
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productReview() {
      return Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.7,
        height: 94,
        margin: const EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '${widget.productModel.galleries![0].url}',
                width: 75,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.productModel.name!,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${widget.productModel.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.productModel = UninitilizedProductModel();
                });
              },
              child: Image.asset(
                'assets/button_close.png',
                width: 32,
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.productModel is UninitilizedProductModel
                ? const SizedBox()
                : productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message..',
                          hintStyle: subtitleTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                GestureDetector(
                  onTap: () {
                    MessagesService().addMessages(
                      authProvider.user!,
                      true,
                      messageController.text,
                      widget.productModel,
                    );

                    setState(() {
                      widget.productModel = UninitilizedProductModel();
                      messageController.text = '';
                    });
                  },
                  child: Image.asset(
                    'assets/button_send.png',
                    width: 55,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessagesService().getMessagesByUserId(authProvider.user!.id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: snapshot.data!
                    .map(
                      (MessageModel msg) => ChatBubble(
                        isSender: msg.isFromUser!,
                        text: msg.message!,
                        productModel: msg.productModel,
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
