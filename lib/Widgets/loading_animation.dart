import 'package:flutter/material.dart';

// creates a dialog loading anmimation, this has upsides and downsides.
//upside: it is easy and responsive.
//con you have to push context at some point and that looks bizarre.
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
      child: SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.3
              : MediaQuery.of(context).size.width * 0.3,
          child: Column(
              // max = the height of the sizedbox in this case.
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text("loading")])));
}
