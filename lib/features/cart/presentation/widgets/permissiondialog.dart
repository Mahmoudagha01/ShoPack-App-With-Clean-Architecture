// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: [

            Icon(Icons.add_location_alt_rounded, color: Theme.of(context).primaryColor, size: 100),
            const SizedBox(height:15),

            const Text(
              'you_denied_location_permission', textAlign: TextAlign.center,
              
            ),
            const SizedBox(height: 15),

            Row(children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Theme.of(context).primaryColor)),
                    minimumSize: const Size(1, 50),
                  ),
                  child: const Text('no'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(child: TextButton(onPressed: () async {
              
                 await Geolocator.openAppSettings();
               
                Navigator.pop(context);
              }, child: const Text('yes')), 
              )
            ]),

          ]),
        ),
      ),
    );
  }
}
