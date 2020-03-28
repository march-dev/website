// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../scaffold.dart';
import '../widgets/section.dart';
import '../helpers/info.constants.dart';
import '../helpers/theme.constants.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  void _sendEmail() async {
    setState(() => _autovalidate = true);

    if (!_formKey.currentState.validate()) return;

    try {
      final Email email = Email(
        body: 'My name is ${_nameController.text}, '
            'and my subject is: ${_subjectController.text}',
        subject: _subjectController.text,
        recipients: [_emailController.text],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    } catch (e, s) {
      await _showErrorAlert(e, s);
    }
  }

  Future<void> _showErrorAlert(dynamic error, StackTrace stackTrace) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: <Widget>[
              Text(
                'Unable to send email!',
                style: TextStyle(fontSize: kBody1),
              ),
              const SizedBox(height: 8),
              Text(
                'Please send bug report, so we can fix it ASAP.',
                style: TextStyle(color: Colors.grey),
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
                try {
                  final Email _email = Email(
                    body: 'Error:\n$error\n\nStackTrace:\n$stackTrace',
                    subject: 'MARCH.DEV WEBSITE BUG REPORT',
                    recipients: [email],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(_email);
                } catch (e) {
                  // do nothing in this case
                }
              },
              textColor: Colors.grey,
              child: Text('SEND BUG REPORT'),
            ),
          ],
        ),
      );

  Widget _buildInput({
    String labelText,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) =>
      Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(48)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(48)),
              borderSide: BorderSide.none,
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => SliverSection(
        titleBuilder: (context, isMobile) => SliverSection.titleWith(
          text: 'BE IN',
          isMobile: isMobile,
        ),
        builder: (context, isMobile) => Column(
          children: <Widget>[
            SliverSection.titleWith(
              text: 'TOUCH',
              isMobile: isMobile,
              color: kAccentColor,
            ),
            const SizedBox(height: 48),
            Form(
              autovalidate: _autovalidate,
              key: _formKey,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildInput(
                            labelText: 'Name',
                            controller: _nameController,
                            validator: (_) =>
                                _.length >= 2 ? null : 'This field is required',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildInput(
                            labelText: 'Email',
                            controller: _emailController,
                            validator: (_) =>
                                RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                        .hasMatch(_)
                                    ? null
                                    : 'It\'s not an email',
                          ),
                        ),
                      ],
                    ),
                    _buildInput(
                      labelText: 'Subject',
                      controller: _subjectController,
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
                                  const BorderRadius.all(Radius.circular(48)),
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
            ),
            const SizedBox(height: 100),
          ],
        ),
      );
}
