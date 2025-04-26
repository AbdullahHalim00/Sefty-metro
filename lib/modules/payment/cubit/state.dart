import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../register/register_screen.dart';

abstract class PaymentStates {}

class PaymentInitialStates extends PaymentStates {}

class PaymentAuthLoadingStates extends PaymentStates {}

class PaymentAuthSuccessStates extends PaymentStates {

  void updateUserMoney() async {

    // استخدام معرف المستخدم كاسم للمستند
    final user = FirebaseAuth.instance.currentUser;
    final userDataRef = FirebaseFirestore.instance.collection("User's data").doc(user!.uid);

    // جلب البيانات الحالية
    final snapshot = await userDataRef.get();
    final data = snapshot.data() ?? {};

    // تحديث قيمة "My Money"
    final currentMoney = double.tryParse(data['My Money'] ?? '0') ?? 0;
    final price = double.tryParse(priceController.text) ?? 0;
    final newMoney = currentMoney + price;
    final updatedData = {...data, 'My Money': newMoney.toString()};

    // إضافة البيانات إلى المستند
    await userDataRef.set(updatedData);
    print("Payment Auth Success States");

  }
}

class PaymentAuthErrorStates extends PaymentStates {
  final String error;
  PaymentAuthErrorStates(this.error);
}

// for order id
class PaymentOrderIdLoadingStates extends PaymentStates {}

class PaymentOrderIdSuccessStates extends PaymentStates {}

class PaymentOrderIdErrorStates extends PaymentStates {
  final String error;
  PaymentOrderIdErrorStates(this.error);
}

// for request token
class PaymentRequestTokenLoadingStates extends PaymentStates {}

class PaymentRequestTokenSuccessStates extends PaymentStates {}

class PaymentRequestTokenErrorStates extends PaymentStates {
  final String error;
  PaymentRequestTokenErrorStates(this.error);
}

// for ref code
class PaymentRefCodeLoadingStates extends PaymentStates {}

class PaymentRefCodeSuccessStates extends PaymentStates {}

class PaymentRefCodeErrorStates extends PaymentStates {
  final String error;
  PaymentRefCodeErrorStates(this.error);
}
