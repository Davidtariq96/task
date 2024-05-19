import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? exportCvsTap;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function()? onTapPrefixIcon;
  final bool createOffer;
  final bool showPrefixIcon;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final int? maxLength;
  final bool? connectBorder;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText, errorText;

  // final bool readOnly,obscureText;
  final bool? enabled, isDense;
  final String? hintText, initialValue;
  const SearchField(
      {Key? key,
        this.controller,
        this.focusNode,
        this.keyboardType,
        this.onChanged,
        this.validator,
        this.onTap,
        this.onSaved,
        this.borderRadius,
        this.prefixIcon,
        this.suffixIcon,
        this.labelText,
        this.maxLength,
        this.connectBorder,
        this.errorBorderColor,
        this.focusBorderColor,
        this.inputFormatters,
        this.helperText,
        this.errorText,
        this.enabled,
        this.isDense,
        this.hintText,
        this.initialValue,
        this.createOffer = false,
        this.exportCvsTap,
        this.onTapPrefixIcon,
        this.showPrefixIcon = false})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}
class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width *0.6,
      decoration: BoxDecoration(
          color: const Color(0XFFEAEBF1),
          borderRadius: BorderRadius.circular(48)),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        validator: widget.validator,
        onTap: widget.onTap,
        enabled: widget.enabled,
        // readOnly: readOnly,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        // obscureText: obscureText,
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
          const EdgeInsets.symmetric( horizontal: 60),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.showPrefixIcon
              ? const Icon(Icons.search)
              : SizedBox(),
          isDense: widget.isDense,
          errorText: widget.errorText,
          hintStyle: GoogleFonts.ptSerif(color: Colors.black,),
          helperStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffE6E7E9)),
          ),
          labelText: '',
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide:
              BorderSide(color: widget.errorBorderColor ?? Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
              borderSide: BorderSide(
                  color: widget.focusBorderColor ??  Colors.transparent)),
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
      ),
    );
  }
}