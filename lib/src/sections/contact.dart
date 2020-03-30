// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../scaffold.dart';
import '../widgets/section.dart';
import '../helpers/info.constants.dart';
import '../helpers/image.constants.dart';
import '../helpers/theme.constants.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key key}) : super(key: key);

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  void _sendEmail() async {
    setState(() => _autovalidate = true);

    if (!_formKey.currentState.validate()) return;

    final mailTo = 'mailto:$email?subject=${_subjectController.text}&'
        'body=${_bodyController.text}';

    if (await canLaunch(mailTo)) {
      await launch(mailTo);
    } else {
      await _showErrorAlert(mailTo);
    }
  }

  Future<void> _showErrorAlert(String errorString) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Unable to send email!',
                style: TextStyle(
                  fontSize: kBody1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please send bug report, so we can fix it ASAP.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: Navigator.of(context).pop,
              textColor: Colors.grey,
              child: Text('CANCEL'),
            ),
            FlatButton(
              onPressed: () async {
                final mailTo =
                    'mailto:$email?subject=MARCH.DEV WEBSITE BUG REPORT&'
                    'body=Error:\n$errorString';

                if (await canLaunch(mailTo)) {
                  await launch(mailTo);
                }
              },
              textColor: kAccentColor,
              child: Text('SEND BUG REPORT'),
            ),
          ],
        ),
      );

  Widget _buildInput({
    String labelText,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    bool isBody = false,
  }) =>
      Container(
        height: isBody ? null : 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          validator: validator,
          controller: controller,
          minLines: isBody ? 3 : null,
          maxLines: isBody ? 3 : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              borderSide: BorderSide.none,
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: isBody ? 16 : 0,
            ),
          ),
        ),
      );

  Widget _buildForm() => Form(
        autovalidate: _autovalidate,
        key: _formKey,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: _buildInput(
                      labelText: 'Name',
                      controller: _nameController,
                      validator: (_) =>
                          _.length >= 2 ? null : 'This field is required',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: _buildInput(
                      labelText: 'Subject',
                      controller: _subjectController,
                      validator: (_) =>
                          _.isNotEmpty ? null : 'This field is required',
                    ),
                  ),
                ],
              ),
              _buildInput(
                labelText: 'Body',
                isBody: true,
                controller: _bodyController,
                validator: (_) =>
                    _.isNotEmpty ? null : 'This field is required',
              ),
              const SizedBox(height: 4),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: _sendEmail,
                      textColor: Colors.white,
                      color: kAccentColor,
                      padding: const EdgeInsets.fromLTRB(48, 14, 48, 14),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22)),
                      ),
                      child: Text(
                        'SEND',
                        style: TextStyle(fontSize: kBody1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildFooter(bool isMobile) => Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
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
                          onPressed: () => launch(githubLink),
                          color: Colors.white,
                          hoverColor: kAccentColor.withOpacity(0.5),
                          icon: ImageIcon(AssetImage(Images.github)),
                        ),
                        IconButton(
                          onPressed: () => launch(dartpubLink),
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
                      onPressed: () => launch('mailto:$email'),
                      textColor: Colors.white,
                      hoverColor: kAccentColor.withOpacity(0.5),
                      child: const Text(
                        'Email Us: $email',
                        textAlign: TextAlign.center,
                      ),
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
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => SliverSection(
        backgroundColor: kMainThemeColor,
        padding: const EdgeInsets.only(top: 16),
        titleBuilder: (context, isMobile) => Container(),
        builder: (context, isMobile) => Container(
          height: MediaQuery.of(context).size.height - 32,
          child: Column(
            children: <Widget>[
              SliverSection.titleWith(
                text: 'BE IN',
                isMobile: isMobile,
              ),
              const SizedBox(height: 16),
              SliverSection.titleWith(
                text: 'TOUCH',
                isMobile: isMobile,
                color: kAccentColor,
              ),
              if (!isMobile)
                const SizedBox(height: 48)
              else
                const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _buildForm(),
              ),
              const Spacer(),
              _buildFooter(isMobile),
              SizedOverflowBox(
                size: Size(double.infinity, 0.1),
                child: Container(
                  height: 4,
                  color: Colors.black,
                ),
              ),
              SizedOverflowBox(
                size: Size(double.infinity, 0.1),
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}
