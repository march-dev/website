// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../scaffold.dart';
import '../widgets/section.dart';
import '../helpers/firebase.settings.dart';

class IntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverSection(
        title: Column(
          children: <Widget>[
            Image.network(
              getImageAsset('logo.png'),
              gaplessPlayback: true,
              height: 128,
            ),
            const SizedBox(height: 32),
            Text(
              'MARCH.DEV',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 32),
              Text(
                'We are Reserch and Development Team. '
                'We are\ncommited to ease life and '
                'coding experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'for everyone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kAccentColor,
                ),
              ),
              const SizedBox(height: 48),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: kAccentColor,
                padding: const EdgeInsets.fromLTRB(48, 18, 48, 18),
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(48)),
                ),
                child: Text(
                  'LEARN MORE',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
}
