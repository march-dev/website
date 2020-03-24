// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'sections/apps.dart';
import 'sections/intro.dart';
import 'sections/about.dart';
import 'sections/plugins.dart';
import 'sections/contact.dart';
import 'helpers/firebase.settings.dart';

const Color kAccentColor = Color(0xff34d1b6);
const Color kMainThemeColor = Color(0xff2e05e9);

class WebSiteScaffold extends StatefulWidget {
  @override
  _WebSiteScaffoldState createState() => _WebSiteScaffoldState();
}

class _WebSiteScaffoldState extends State<WebSiteScaffold> {
  final _controller = ScrollController();

  Widget _buildAppBar() => SliverAppBar(
        elevation: 0,
        pinned: false,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Text('ABOUT'),
          ),
          FlatButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Text('APPS'),
          ),
          FlatButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Text('PLUGINS'),
          ),
          FlatButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Text('CONTACT'),
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              getImageAsset('logo.png'),
              gaplessPlayback: true,
              height: 48,
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'THIS IS',
                  style: TextStyle(
                    fontSize: 10,
                    color: kAccentColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'MARCH.DEV',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildBottomBar() => SliverToBoxAdapter(
        child: Ink(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // github
                      IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        hoverColor: kAccentColor.withOpacity(0.5),
                        icon: Icon(Icons.adb),
                      ),
                      // pub.dev
                      IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        hoverColor: kAccentColor.withOpacity(0.5),
                        icon: Icon(Icons.adb),
                      ),
                    ],
                  ),
                  // TODO hide on mobile
                  const Text(
                    '|',
                    style: TextStyle(color: Colors.white),
                  ),
                  FlatButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    hoverColor: kAccentColor.withOpacity(0.5),
                    child: const Text('Email Us: eo.march.dev+support@gmail.com'),
                  ),
                  // TODO hide on mobile
                  const Text(
                    '|',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '© 2020 by MARCH.DEV',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          _buildAppBar(),
          IntroSection(),
          AboutSection(),
          AppsSection(),
          PluginsSection(),
          ContactSection(),
          _buildBottomBar(),
        ],
      ),
    );
  }
}
