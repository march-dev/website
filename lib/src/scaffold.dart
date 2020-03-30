// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:responsive_layout_builder/responsive_layout_builder.dart';

import 'sections/sections.dart';
import 'helpers/image.constants.dart';
import 'helpers/theme.constants.dart';

const Color kAccentColor = Color(0xff34d1b6);
const Color kMainThemeColor = Color(0xff2e05e9);

class WebSiteScaffold extends StatefulWidget {
  @override
  _WebSiteScaffoldState createState() => _WebSiteScaffoldState();
}

class _WebSiteScaffoldState extends State<WebSiteScaffold> {
  final _contactKey = GlobalKey();
  final _pluginKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _appsKey = GlobalKey();

  void _scrollTo(GlobalKey key) => Scrollable.ensureVisible(
        key.currentContext,
        duration: const Duration(seconds: 2),
      );

  List<Widget> _buildAppBar(bool isMobile) => [
        SliverToBoxAdapter(
          child: SizedOverflowBox(
            size: Size(double.infinity, 0.1),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: kMainThemeColor,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedOverflowBox(
            size: Size(double.infinity, 0.1),
            child: Container(
              height: 4,
              color: kMainThemeColor,
            ),
          ),
        ),
        SliverAppBar(
          elevation: 0,
          pinned: false,
          backgroundColor: kMainThemeColor,
          actions: isMobile
              ? <Widget>[]
              : <Widget>[
                  FlatButton(
                    onPressed: () => _scrollTo(_aboutKey),
                    textColor: Colors.white,
                    child: Text('ABOUT'),
                  ),
                  FlatButton(
                    onPressed: () => _scrollTo(_appsKey),
                    textColor: Colors.white,
                    child: Text('APPS'),
                  ),
                  FlatButton(
                    onPressed: () => _scrollTo(_pluginKey),
                    textColor: Colors.white,
                    child: Text('PLUGINS'),
                  ),
                  FlatButton(
                    onPressed: () => _scrollTo(_contactKey),
                    textColor: Colors.white,
                    child: Text('CONTACT'),
                  ),
                ],
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(17)),
                child: CircleAvatar(
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
        ),
      ];

  @override
  Widget build(BuildContext context) => ResponsiveLayoutBuilder(
        portraitSizes: ScreenSizeSettings.portrait(),
        landscapeSizes: ScreenSizeSettings.portrait(),
        builder: (context, screen) {
          final bool isMobile = screen.size == LayoutSize.mobile;

          return Scaffold(
            body: Scrollbar(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  ..._buildAppBar(isMobile),
                  SliverToBoxAdapter(
                    child: SizedOverflowBox(
                      size: Size(double.infinity, 0.1),
                      child: Container(
                        height: 4,
                        color: kMainThemeColor,
                      ),
                    ),
                  ),
                  IntroSection(learnMore: () => _scrollTo(_aboutKey)),
                  AboutSection(key: _aboutKey),
                  AppsSection(key: _appsKey),
                  PluginsSection(key: _pluginKey),
                  ContactSection(key: _contactKey),
                ],
              ),
            ),
          );
        },
      );
}
