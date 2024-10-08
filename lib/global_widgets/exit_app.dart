import 'package:flutter/material.dart';
import 'package:happy_hour/core/colors.dart';

class ExitAppDialog extends StatefulWidget {
  const ExitAppDialog(
      {Key? key,
      this.description,
      this.leftButtonText,
      this.rightButtonText,
      this.onAgreeTap})
      : super(key: key);

  final String? description, leftButtonText, rightButtonText;
  final Function? onAgreeTap;

  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<ExitAppDialog> {
  @override
  Widget build(BuildContext context) {
    return NewDialog(widget: widget);
  }
}

class NewDialog extends StatelessWidget {
  const NewDialog({
    Key? key,
    this.widget,
  }) : super(key: key);

  final ExitAppDialog? widget;

  @override
  Widget build(BuildContext context) {
    const Widget _spacingWidget = SizedBox(
      width: 4,
    );
    const Widget _largeSpacingWidget = SizedBox(
      height: 20,
    );
    final Widget _headerWidget = Row(
      children: const <Widget>[
        _spacingWidget,
        // Icon(
        //   Icons.help_outline,
        //   color: Colors.white,
        // ),
        _spacingWidget,
        Text(
          'Exit Application',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );

    final Widget _messageWidget = Text(
      widget!.description!,
      style: Theme.of(context).textTheme.titleSmall,
    );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  color: primary),
              child: _headerWidget),
          _largeSpacingWidget,
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: _messageWidget,
          ),
          _largeSpacingWidget,
          Divider(
            color: Theme.of(context).iconTheme.color,
            height: 0.4,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(widget!.leftButtonText!,
                    style: Theme.of(context).textTheme.labelLarge),
              )),
              Container(
                  height: 50,
                  width: 0.4,
                  color: Theme.of(context).iconTheme.color),
              Expanded(
                child: MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: () {
                    widget!.onAgreeTap!();
                  },
                  child: Text(
                    widget!.rightButtonText!,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: primary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
