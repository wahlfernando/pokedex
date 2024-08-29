// package com.example.pokedex

// import android.os.Bundle
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.plugin.common.MethodChannel

// class MainActivity: FlutterActivity() {
//     private val CHANNEL = "pokedex/native"

//     override fun onCreate(savedInstanceState: Bundle?) {
//         super.onCreate(savedInstanceState)

//         MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler {
//             call, result ->
//             if (call.method == "getPokemonCount") {
//                 val count = getPokemonCount()
//                 result.success(count)
//             } else {
//                 result.notImplemented()
//             }
//         }
//     }

//     private fun getPokemonCount(): Int {
//         return 151
//     }
// }
package br.com.faw.flutterpokedex

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
