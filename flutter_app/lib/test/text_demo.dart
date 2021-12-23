import 'package:flutter/widgets.dart';

class TextOverflowDemo extends StatelessWidget {
  const TextOverflowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Row(
          children: [
            Text("dkdkdkdkkkdkdkkdkdkdkdkdkdkkdText1"),
            Flexible(
                child: Text(
              "dkdkdkdkkkdkdkkdkdkdkdkdkdkkdText2",
              overflow: TextOverflow.ellipsis,
            )),
          ],
        )
    );
  }
}
