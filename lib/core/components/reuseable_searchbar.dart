// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/theme/theme.dart';

class ReUseAbleSearchWidgetWithFutureBuilder extends StatelessWidget {
  var onChanged;
  var width;
  ReUseAbleSearchWidgetWithFutureBuilder({
    super.key,
    required this.onChanged,
    this.width,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: EdgeInsets.only(left: 18),
                
                    width: width == null
                        ? MediaQuery.of(context).size.width / 1.1
                        : width,
                decoration: ShapeDecoration(
                
                  color: Themecolor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    
                  ),
                ),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: onChanged,
                  decoration:const InputDecoration(
                      hintText: 'Search',
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                     border: InputBorder.none, // Remove the border
                focusedBorder: InputBorder.none, // Remove the focused border
                enabledBorder: InputBorder.none, // Remove the enabled border
                errorBorder: InputBorder.none, // Remove the error border
                disabledBorder: InputBorder.none,
                      ),
                )),
          ],
        ));
  }
}
