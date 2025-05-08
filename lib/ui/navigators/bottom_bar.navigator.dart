import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class BottomBarNavigator {
  BottomAppBar getBottomBar(
      BuildContext context, int currentTab, Function? onTabChange) {
    return BottomAppBar(
      height: 76,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: BorderDirectional(
                top: BorderSide(width: 1, color: redPrimary))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  if (onTabChange != null) onTabChange(0);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    currentTab == 0 ? Icons.grid_on : Icons.grid_on_outlined,
                    size: currentTab == 0 ? 32 : 28,
                    color: redPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (onTabChange != null) onTabChange(1);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    currentTab == 1 ? Icons.message : Icons.message_outlined,
                    size: currentTab == 1 ? 32 : 28,
                    color: redPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (onTabChange != null) onTabChange(2);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    currentTab == 2 ? Icons.tungsten : Icons.tungsten_outlined,
                    size: currentTab == 2 ? 32 : 28,
                    color: redPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (onTabChange != null) onTabChange(3);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    currentTab == 3 ? Icons.person_2 : Icons.person_2_outlined,
                    size: currentTab == 3 ? 32 : 28,
                    color: redPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
