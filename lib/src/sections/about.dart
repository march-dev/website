// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../scaffold.dart';
import '../widgets/section.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverSection(
        backgroundColor: Colors.white,
        title: SliverSection.titleWith(text: 'ABOUT', color: Colors.black),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),
              Text(
                'WHAT WE DO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kAccentColor,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 48,
                runSpacing: 48,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlutterLogo(size: 300),
                      const SizedBox(height: 8),
                      Text(
                        '• We create cross-platform applications\n  that conform to any user\'s needs.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '  Done with passion for YOU!',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '• We create plugins for Dart and Flutter\n  to let YOU be more EFFICIENT.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '  Write less, do more!',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FlutterLogo(size: 300),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
