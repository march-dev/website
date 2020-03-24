// Copyright (c) 2020, the MarchDev project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const String _firebaseStoragePath =
    'https://firebasestorage.googleapis.com/v0/b/marchdev-tk.appspot.com/o';
const String _firebaseStorageToken = 'a0bbee80-fae2-4fd4-9eeb-aee8efe45a69';

String getImageAsset(String name) =>
    '$_firebaseStoragePath/$name?alt=media&token=$_firebaseStorageToken';
