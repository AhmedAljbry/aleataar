import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> with SingleTickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _message = "";
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    // Simulate a delay for loading the page
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  List<String>image=
  [
    "https://cdn.salla.sa/mrnpK/d7599f7f-234c-42b1-9bb2-9a605924e0bb-861.81277860327x1000-BzbmGJr95bcZx6n2pUnVMH7qllupxiUqKpT7ftHM.jpg"
  ];
  List<String>name=
  [
    "كريم العطار"
  ];

  int index=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("زيت العطار", style: TextStyle(color: Colors.white)),
        ),],

        backgroundColor: Colors.green[900],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Card for product verification
            Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(
                      "image/a.jpg",
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "العطار",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "استمتع بحركة مرنة وخالية من الألم! الحل الأمثل لتخفيف آلام المفاصل والتهابات العظام ,وللعصاب.\n\nتحقّق من أصالة المنتج بإدخال الكود أدناه.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "أدخل الكود للتحقق من المنتج",
                          hintText: "يرجى إدخال الرقم المكون من 12 خانة",
                          prefixIcon: Icon(Icons.verified, color: Colors.amber),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: validateCard,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _checkAndUseCard(_controller.text.trim());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.green[900],
                      ),
                      child: Text("تحقق", style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                    SizedBox(height: 16),
                    Text(
                      _message,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _message.startsWith("✅") ? Colors.green : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Card for certificate
            // Card for certificate
            // Card for certificate with fixed size
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "المنتجات",
                  style: TextStyle(
                    fontSize: 24, // حجم أكبر لعنوان المنتجات
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10), // مسافة بين العنوان والـ ListView
                Container(
                  height: 330, // تحديد ارتفاع ثابت
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: index, // عدد المنتجات
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // تعديل البادينج ليناسب الشاشة
                        child: Container(
                          width: 250, // عرض ثابت للعنصر
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(2, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // صورة المنتج
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.network(
                                  image[index],
                                  height: 180, // ارتفاع ثابت للصورة
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // محتوى المنتج مع خلفية أنيقة
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100], // الخلفية مع الشفافية
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // اسم المنتج
                                    Text(
                                      name[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[900], // تغيير لون النص إلى الأبيض
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),

                                    // وصف المنتج
                                    Text(
                                      "زيت طبيعي 100% لعلاج الأعصاب والمفاصل! 🏵️✨ "
                                          "يخفف الألم، يحسن الدورة الدموية، ويمنحك راحة تدوم طويلاً. "
                                          "جرّبه الآن واستمتع بحياة بلا آلام! 🔥",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey, // لون النص رمادي
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),










            // Grid for pro
          ],
        ),
      ),












    );
  }


  Future<void> _checkAndUseCard(String number) async {
    try {
      // أولاً: تحقق من حالة التشغيل من lamsatdawaclose
      DocumentSnapshot<Map<String, dynamic>> configDoc = await FirebaseFirestore.instance
          .collection('aleataarclose')
          .doc('7') // رقم القسم 7
          .get();

      if (configDoc.exists && configDoc.data() != null) {
        bool isOpen = configDoc.data()?['v'] ?? false;

        if (!isOpen) {
          setState(() {
            _message = "❌ خطأ في قاعدة البيانات! يرجى التواصل مع المطور.";
          });
          return; // إيقاف الدالة هنا إذا v = false
        }
      }

      // --- إذا كانت الخدمة شغالة v = true يكمل هنا ---
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
          .collection('aleataarids')
          .doc(number)
          .get();

      if (doc.exists && doc.data() != null) {
        var data = doc.data();
        DateTime usageDate = DateTime.now();

        setState(() {
          _message =
          "✅ المنتج أصلي 100% من مصدر موثوق.\n"
              "تاريخ الإدخال: '${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}'\n"
              "تاريخ الاستخدام: ${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}\n\n"
              "نحن ممتنون لاهتمامكم وحرصكم على التأكد من جودة منتجاتنا.\n"
              "نحن دائمًا هنا لخدمتكم، ونتطلع إلى تقديم أفضل تجربة لكم.\n"
              "شكرًا لثقتكم بنا!";
        });

        // نقل الكود إلى مجموعة الأكواد المستخدمة
        await FirebaseFirestore.instance
            .collection('aleataarids_used_codes')
            .doc(number)
            .set({
          'id': data?['id'] ?? 'غير محدد',
          'timestamp': data?['timestamp'] ?? 'غير محدد',
          'usage_date': usageDate.toString(),
        });

        // حذف الكود من lamsaids
        await FirebaseFirestore.instance
            .collection('aleataarids')
            .doc(number)
            .delete();
      } else {
        // تحقق من إذا كان الكود مستخدم من قبل
        DocumentSnapshot<Map<String, dynamic>> usedDoc =
        await FirebaseFirestore.instance
            .collection('aleataarids_used_codes')
            .doc(number)
            .get();

        setState(() {
          _message = usedDoc.exists
              ? "❌ الكود قد تم استخدامه من قبل!"
              : "❌ الكود غير موجود!";
        });
      }
    } catch (e) {
      setState(() {
        _message = "❌ حدث خطأ أثناء البحث عن الكود!";
      });
    }
  }
  String? validateCard(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى إدخال الرقم";
    } else if (value.length != 12) {
      return "الرقم يجب أن يكون 12 خانة";
    }
    return null;
  }

}
