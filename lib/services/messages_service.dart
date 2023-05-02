import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../models/message_model.dart';
import '../../models/product_model.dart';
import '../../models/user_model.dart';

class MessagesService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Function streaming chat dari user by id
  Stream<List<MessageModel>> getMessagesByUserId(int userId) {
    try {
      return firebaseFirestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map(
        (QuerySnapshot snapshot) {
          var result = snapshot.docs.map<MessageModel>((DocumentSnapshot msg) {
            if (kDebugMode) {
              //untuk memastikan apakah kita benar untuk massage nya
              print(msg.data());
            }
            return MessageModel.fromJson(
              msg.data() as Map<String, dynamic>,
            );
          }).toList();

          // Mengurutkan message nya berdasarkan data yang paling lama
          result.sort(
            (MessageModel a, MessageModel b) =>
                a.createdAt!.compareTo(b.createdAt!),
          );

          return result;
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fungsi untuk melakukan chat
  Future<void> addMessages(UserModel user, bool isFromUser, String messages,
      ProductModel productModel) async {
    try {
      firebaseFirestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': messages,
        'productModel': productModel is UninitilizedProductModel
            ? {}
            : productModel.toJson(),
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      }).then((value) {
        if (kDebugMode) {
          print(
            'pesan berhasil dikirim',
          );
        }
      });
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
