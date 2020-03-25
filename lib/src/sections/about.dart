// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../scaffold.dart';
import '../widgets/section.dart';

class AboutSection extends StatelessWidget {
  static const double kMaxWidth = 300;

  Widget _buildBulletListItem({
    @required String text,
    bool showBullet = true,
    TextStyle style,
  }) =>
      Container(
        constraints: BoxConstraints(
          minWidth: 100,
          maxWidth: kMaxWidth,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${showBullet == true ? '•' : ' '} ',
              textAlign: TextAlign.justify,
              style: style ??
                  TextStyle(
                    fontSize: kBody1,
                    color: Colors.black,
                  ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: style ??
                    TextStyle(
                      fontSize: kBody1,
                      color: Colors.black,
                    ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => SliverSection(
        backgroundColor: Colors.white,
        titleBuilder: (context, isMobile) => SliverSection.titleWith(
          text: 'ABOUT',
          isMobile: isMobile,
          color: Colors.black,
        ),
        builder: (context, isMobile) => Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Text(
              'WHAT WE DO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: kBody2,
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
                    FlutterLogo(size: kMaxWidth),
                    const SizedBox(height: 8),
                    _buildBulletListItem(
                      text: 'We create plugins for Dart and Flutter '
                          'to let YOU be more EFFICIENT.',
                    ),
                    const SizedBox(height: 8),
                    _buildBulletListItem(
                      text: 'Write less, do more!',
                      showBullet: false,
                      style: TextStyle(
                        fontSize: kBody2,
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
                    _buildBulletListItem(
                      text: 'We create cross-platform applications '
                          'that conform to any user\'s needs.',
                    ),
                    const SizedBox(height: 8),
                    _buildBulletListItem(
                      text: 'Done with passion for YOU!',
                      showBullet: false,
                      style: TextStyle(
                        fontSize: kBody2,
                        color: kAccentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FlutterLogo(size: kMaxWidth),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
