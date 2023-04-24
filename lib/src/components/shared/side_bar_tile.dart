import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../../utils/theme.dart';

class SideBarTile extends StatelessWidget {
  const SideBarTile(
      {Key? key,
      required this.title,
      required this.selected,
      required this.icon,
      required this.onTap})
      : super(key: key);

  final String title;
  final bool selected;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).brightness == Brightness.dark
                  ? MyColors.grey[800]
                  : Colors.white
              : null,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(right: 12, left: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        hoverColor: orange300.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: selected
                      ? MyColors.primary
                      : Theme.of(context).iconTheme.color),
              title != ''
                  ? const SizedBox(
                      width: 8,
                    )
                  : Container(),
              title != ''
                  ? Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: selected
                          //     ? Colors.black45
                          //     : Theme.of(context).brightness ==
                          //             Brightness.dark
                          //         ? Colors.white70
                          //         : Colors.black45
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
      // child: ListTile(
      //   dense: false,
      //   hoverColor: orange300.withOpacity(0.6),
      //   leading: Icon(icon,
      //       color: selected ? orange300 : Theme.of(context).iconTheme.color),
      //   title: Text(
      //     title,
      //     style: TextStyle(
      //         fontSize: 16,
      //         fontWeight: FontWeight.bold,
      //         color: selected
      //             ? orange300
      //             : Theme.of(context).brightness == Brightness.dark
      //                 ? Colors.white70
      //                 : Colors.black45),
      //   ),
      //   onTap: onTap,
      // ),
    );
  }
}
