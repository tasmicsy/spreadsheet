import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(

      onPressed: (){
        Share.share(
            """
広東語の発音をひらがな表記に！
iOS版→ https://apple.co/3eJfskB 
Android版→ https://play.google.com/store/apps/details?id=com.catonknees.conversion&hl=ja&gl=US
                            """
        );
      },
      icon: Icon(Icons.ios_share_outlined,),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      showDialog(context: context, builder: (context){
        return SimpleDialog(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://catonknees.com/privacy-policy-tc/")) ;
              }, child: Text("プライバシーポリシー", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://www.freeprivacypolicy.com/live/fee39dae-6962-4722-a07d-1e71c92801d7"));
              }, child: Text("利用規約", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse('mailto:info@catonknees.com?subject=お問い合せ&body=お問合せ内容を書いてください。'));
              }, child: Text("お問合せ", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                launchUrl(Uri.parse("https://catonknees.com/"));
              }, child: Text("ホームページ", style: TextStyle(fontSize: 15.h),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: TextButton(onPressed: (){
                Share.share("""
広東語の発音をひらがな表記に！
iOS版→ https://apple.co/3eJfskB 
Android版→ https://play.google.com/store/apps/details?id=com.catonknees.conversion&hl=ja&gl=US
                            """);
              }, child: Text("シェアする", style: TextStyle(fontSize: 15.h),)),
            ),
          ],

        );
      });
    },

        icon: Icon(Icons.dehaze, ));
  }
}
