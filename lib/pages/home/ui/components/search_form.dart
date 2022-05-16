import 'package:flutter/material.dart';
import 'package:shop_client/res/dimens.dart';
import 'package:shop_client/res/strings.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(DimensRes.defaultRadius)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
    required this.searchCallback,
  }) : super(key: key);

  final void Function(String query) searchCallback;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {
          searchCallback(value);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: StringsRes.searchHint,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: EdgeInsets.all(DimensRes.samllSpace),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
