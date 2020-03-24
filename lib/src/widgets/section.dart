// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({
    Key key,
    @required this.title,
    @required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget title;
  final Widget child;
  final Color backgroundColor;

  static Widget titleWith({@required String text, Color color}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 48,
          color: color ?? Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(child: widget.title),
            const SizedBox(height: 16),
            widget.child,
          ],
        ),
      ),
    );
  }
}

class SliverSection extends StatelessWidget {
  const SliverSection({
    Key key,
    @required this.title,
    @required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget title;
  final Widget child;
  final Color backgroundColor;

  static Widget titleWith({@required String text, Color color}) =>
      Section.titleWith(text: text, color: color);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Section(
          title: title,
          child: child,
          backgroundColor: backgroundColor,
        ),
      );
}
