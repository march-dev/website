// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';

import 'sections/sections.dart';
import 'helpers/theme.contants.dart';
import 'helpers/image.constants.dart';

const Color kAccentColor = Color(0xff34d1b6);
const Color kMainThemeColor = Color(0xff2e05e9);

const String _githubLink = 'https://github.com/marchdev-tk';
const String _dartpubLink = 'https://pub.dev/publishers/marchdev.tk/packages';

const String _email = 'eo.march.dev+support@gmail.com';

class WebSiteScaffold extends StatefulWidget {
  @override
  _WebSiteScaffoldState createState() => _WebSiteScaffoldState();
}

class _WebSiteScaffoldState extends State<WebSiteScaffold> {
  final _controller = ScrollController();

  Widget _buildAppBar(bool isMobile) => SliverAppBar(
        elevation: 0,
        pinned: false,
        backgroundColor: Colors.transparent,
        actions: isMobile
            ? <Widget>[]
            : <Widget>[
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
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: OverflowBox(
                maxWidth: 36,
                maxHeight: 36,
                child: Image.asset(
                  Images.logo,
                  gaplessPlayback: true,
                  height: 36,
                ),
              ),
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
                    fontSize: kBody2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildBottomBar(bool isMobile) => SliverToBoxAdapter(
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
                      IconButton(
                        onPressed: () => launch(_githubLink),
                        color: Colors.white,
                        hoverColor: kAccentColor.withOpacity(0.5),
                        icon: ImageIcon(AssetImage(Images.github)),
                      ),
                      IconButton(
                        onPressed: () => launch(_dartpubLink),
                        color: Colors.white,
                        hoverColor: kAccentColor.withOpacity(0.5),
                        icon: ImageIcon(AssetImage(Images.dartpub)),
                      ),
                    ],
                  ),
                  if (!isMobile)
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.white),
                    ),
                  FlatButton(
                    onPressed: () => launch('mailto:$_email'),
                    textColor: Colors.white,
                    hoverColor: kAccentColor.withOpacity(0.5),
                    child: const Text('Email Us: $_email'),
                  ),
                  if (!isMobile)
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.white),
                    ),
                  Text(
                    '© ${DateTime.now().year} by MARCH.DEV',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => ResponsiveLayoutBuilder(
        portraitSizes: ScreenSizeSettings.portrait(),
        landscapeSizes: ScreenSizeSettings.portrait(),
        builder: (context, screen) {
          final bool isMobile = screen.size == LayoutSize.mobile;

          return Scaffold(
            body: CustomScrollView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                _buildAppBar(isMobile),
                IntroSection(),
                AboutSection(),
                AppsSection(),
                PluginsSection(),
                ContactSection(),
                _buildBottomBar(isMobile),
              ],
            ),
          );
        },
      );
}
