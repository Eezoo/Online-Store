import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  final VoidCallback onFinish;
  const GetStartedScreen({super.key, required this.onFinish});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_GetStartedPage> _pages = const [
    _GetStartedPage(
      title: 'أكاسيا... خبرة 20 عامًا',
      description:
          'اسم يعرفه الجميع في خدمة الطلاب والمؤسسات منذ أكثر من عقدين. نلبي جميع احتياجاتك من اللوازم والمعدات المكتبية بجودة وثقة.',
      image: AssetImage('assets/images/qualaty.png'),
    ),
    _GetStartedPage(
      title: 'كل ما تحتاجه في مكان واحد',
      description:
          'نوفر لك تشكيلة واسعة من الأدوات المكتبية، القرطاسية، والمستلزمات التعليمية بأسعار تنافسية وخدمة سريعة.',
      image: AssetImage('assets/images/shop.png'),
    ),
    _GetStartedPage(
      title: 'سهولة الطلب والتوصيل',
      description:
          'تسوق بسهولة، تابع طلباتك لحظة بلحظة، واستمتع بتجربة شراء مميزة تلبي احتياجاتك أينما كنت.',
      image: AssetImage('assets/images/inone.png'),
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      widget.onFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _pages.length,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 16),
                        width: _currentPage == index ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF356ABF)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF356ABF), // لون الخلفية
                  foregroundColor: Colors.white, // لون النص
                  minimumSize: const Size(180, 48), // الحجم الأدنى
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // الحواف المستديرة
                  ),
                  elevation: 4, // الظل
                ),
                onPressed: _nextPage,
                child: Text(
                  _currentPage == _pages.length - 1 ? 'ابدأ الآن' : 'التالي',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GetStartedPage extends StatelessWidget {
  final String title;
  final String description;
  final ImageProvider image;
  const _GetStartedPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
            width: 320,
          ),
          const SizedBox(height: 32),
          Text(title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(description,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
