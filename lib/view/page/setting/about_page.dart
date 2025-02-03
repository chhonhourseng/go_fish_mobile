import 'package:app/export.dart';

class AboutPage extends StatefulWidget {
  static const String route = '/AboutPage';

  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.about.r),
      ),
      body: AppListViewBuilder(padding: app.screenPadding, children: [
        Text(
            'The Agora eCommerce app is a beacon of innovation in the realm of online retail. Designed with a vision to revolutionize the digital shopping experience, Agora offers a seamless platform where users can discover a myriad of products tailored to their preferences. With a focus on simplicity and user-centric design, Agora ensures a hassle-free shopping journey for every customer.',
            style: context.textTheme.bodySmall),
        Text(
            'At Agora, we believe in the power of technology to bridge the gap between consumers and quality products. Our app features a wide range of categories, from fashion and electronics to home essentials and beyond, catering to diverse needs. With a robust infrastructure and secure payment gateways, Agora guarantees a safe and reliable shopping environment.',
            style: context.textTheme.bodySmall),
        Text(
            'Embracing the essence of community and collaboration, Agora fosters a dynamic marketplace where vendors can showcase their craftsmanship and reach a global audience. We are committed to nurturing a vibrant ecosystem that values transparency, authenticity, and customer satisfaction.',
            style: context.textTheme.bodySmall),
        Text(
            'Experience the future of online shopping with Agora - where every purchase tells a story. Join us on this journey of discovery, convenience, and endless possibilities.',
            style: context.textTheme.bodySmall),
      ].separator((i) => 20.sh())),
    );
  }
}
