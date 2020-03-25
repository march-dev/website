// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../scaffold.dart';
import '../widgets/section.dart';

class PluginsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverSection(
        backgroundColor: Colors.white,
        titleBuilder: (context, isMobile) => SliverSection.titleWith(
            text: 'PLUGINS', isMobile: isMobile, color: Colors.black),
        builder: (context, isMobile) => Column(
          children: <Widget>[
            Wrap(
              spacing: 48,
              runSpacing: 48,
              children: <Widget>[
                Placeholder(
                  fallbackWidth: 300,
                  fallbackHeight: 300,
                ),
              ],
            ),
          ],
        ),
      );
}
