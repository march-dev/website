// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:responsive_layout_builder/responsive_layout_builder.dart';

import '../helpers/theme.constants.dart';

double getTitleSize(bool isMobile) => isMobile ? kTitleSmall : kTitleLarge;

typedef Widget ResponsiveWidgetBuilder(BuildContext context, bool isMobile);

class Section extends StatelessWidget {
  const Section({
    Key key,
    @required this.titleBuilder,
    @required this.builder,
    this.backgroundColor,
  }) : super(key: key);

  final ResponsiveWidgetBuilder titleBuilder;
  final ResponsiveWidgetBuilder builder;
  final Color backgroundColor;

  static Widget titleWith({
    @required String text,
    @required bool isMobile,
    Color color,
  }) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getTitleSize(isMobile),
          color: color ?? Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) => ResponsiveLayoutBuilder(
        portraitSizes: ScreenSizeSettings.portrait(),
        landscapeSizes: ScreenSizeSettings.portrait(),
        builder: (context, screen) {
          final isMobile = screen.size == LayoutSize.mobile;

          return Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(child: titleBuilder(context, isMobile)),
                  const SizedBox(height: 16),
                  builder(context, isMobile),
                ],
              ),
            ),
          );
        },
      );
}

class SliverSection extends StatelessWidget {
  const SliverSection({
    Key key,
    @required this.titleBuilder,
    @required this.builder,
    this.backgroundColor,
  }) : super(key: key);

  final ResponsiveWidgetBuilder titleBuilder;
  final ResponsiveWidgetBuilder builder;
  final Color backgroundColor;

  static Widget titleWith({
    @required String text,
    @required bool isMobile,
    Color color,
  }) =>
      Section.titleWith(text: text, isMobile: isMobile, color: color);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Section(
          titleBuilder: (context, isMobile) => titleBuilder(context, isMobile),
          builder: (context, isMobile) => builder(context, isMobile),
          backgroundColor: backgroundColor,
        ),
      );
}
