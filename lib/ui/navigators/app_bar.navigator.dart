import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class AppBarNavigator {
  AppBar getAppBar(
    String title,
    String profileImage,
    BuildContext context,
    Function? onProfileTap,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          InkWell(
            onTap: () {
              if (onProfileTap != null) onProfileTap();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: whiteTypography)),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Image.network(
                  profileImage,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
