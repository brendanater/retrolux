//
//  PerformanceTests.swift
//  RetroluxReflector
//
//  Created by Bryan Henderson on 3/30/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation
import Retrolux
import XCTest

class PerformanceTests: XCTestCase {
    class Nested: Reflection {
        var a1 = 0; var a2 = 0; var a3 = 0; var a4 = 0; var a5 = 0; var a6 = 0; var a7 = 0; var a8 = 0; var a9 = 0; var a10 = 0; var a11 = 0; var a12 = 0; var a13 = 0; var a14 = 0; var a15 = 0; var a16 = 0; var a17 = 0; var a18 = 0; var a19 = 0; var a20 = 0; var a21 = 0; var a22 = 0; var a23 = 0; var a24 = 0; var a25 = 0; var a26 = 0; var a27 = 0; var a28 = 0; var a29 = 0; var a30 = 0; var a31 = 0; var a32 = 0; var a33 = 0; var a34 = 0; var a35 = 0; var a36 = 0; var a37 = 0; var a38 = 0; var a39 = 0; var a40 = 0; var a41 = 0; var a42 = 0; var a43 = 0; var a44 = 0; var a45 = 0; var a46 = 0; var a47 = 0; var a48 = 0; var a49 = 0; var a50 = 0; var a51 = 0; var a52 = 0; var a53 = 0; var a54 = 0; var a55 = 0; var a56 = 0; var a57 = 0; var a58 = 0; var a59 = 0; var a60 = 0; var a61 = 0; var a62 = 0; var a63 = 0; var a64 = 0; var a65 = 0; var a66 = 0; var a67 = 0; var a68 = 0; var a69 = 0; var a70 = 0; var a71 = 0; var a72 = 0; var a73 = 0; var a74 = 0; var a75 = 0; var a76 = 0; var a77 = 0; var a78 = 0; var a79 = 0; var a80 = 0; var a81 = 0; var a82 = 0; var a83 = 0; var a84 = 0; var a85 = 0; var a86 = 0; var a87 = 0; var a88 = 0; var a89 = 0; var a90 = 0; var a91 = 0; var a92 = 0; var a93 = 0; var a94 = 0; var a95 = 0; var a96 = 0; var a97 = 0; var a98 = 0; var a99 = 0; var a100 = 0;
        
        var a101 = ""; var a102 = ""; var a103 = ""; var a104 = ""; var a105 = ""; var a106 = ""; var a107 = ""; var a108 = ""; var a109 = ""; var a110 = ""; var a111 = ""; var a112 = ""; var a113 = ""; var a114 = ""; var a115 = ""; var a116 = ""; var a117 = ""; var a118 = ""; var a119 = ""; var a120 = ""; var a121 = ""; var a122 = ""; var a123 = ""; var a124 = ""; var a125 = ""; var a126 = ""; var a127 = ""; var a128 = ""; var a129 = ""; var a130 = ""; var a131 = ""; var a132 = ""; var a133 = ""; var a134 = ""; var a135 = ""; var a136 = ""; var a137 = ""; var a138 = ""; var a139 = ""; var a140 = ""; var a141 = ""; var a142 = ""; var a143 = ""; var a144 = ""; var a145 = ""; var a146 = ""; var a147 = ""; var a148 = ""; var a149 = ""; var a150 = ""; var a151 = ""; var a152 = ""; var a153 = ""; var a154 = ""; var a155 = ""; var a156 = ""; var a157 = ""; var a158 = ""; var a159 = ""; var a160 = ""; var a161 = ""; var a162 = ""; var a163 = ""; var a164 = ""; var a165 = ""; var a166 = ""; var a167 = ""; var a168 = ""; var a169 = ""; var a170 = ""; var a171 = ""; var a172 = ""; var a173 = ""; var a174 = ""; var a175 = ""; var a176 = ""; var a177 = ""; var a178 = ""; var a179 = ""; var a180 = ""; var a181 = ""; var a182 = ""; var a183 = ""; var a184 = ""; var a185 = ""; var a186 = ""; var a187 = ""; var a188 = ""; var a189 = ""; var a190 = ""; var a191 = ""; var a192 = ""; var a193 = ""; var a194 = ""; var a195 = ""; var a196 = ""; var a197 = ""; var a198 = ""; var a199 = ""; var a200 = "";
        
        var a201: Nested?; var a202: Nested?; var a203: Nested?; var a204: Nested?; var a205: Nested?; var a206: Nested?; var a207: Nested?; var a208: Nested?; var a209: Nested?; var a210: Nested?; var a211: Nested?; var a212: Nested?; var a213: Nested?; var a214: Nested?; var a215: Nested?; var a216: Nested?; var a217: Nested?; var a218: Nested?; var a219: Nested?; var a220: Nested?; var a221: Nested?; var a222: Nested?; var a223: Nested?; var a224: Nested?; var a225: Nested?; var a226: Nested?; var a227: Nested?; var a228: Nested?; var a229: Nested?; var a230: Nested?; var a231: Nested?; var a232: Nested?; var a233: Nested?; var a234: Nested?; var a235: Nested?; var a236: Nested?; var a237: Nested?; var a238: Nested?; var a239: Nested?; var a240: Nested?; var a241: Nested?; var a242: Nested?; var a243: Nested?; var a244: Nested?; var a245: Nested?; var a246: Nested?; var a247: Nested?; var a248: Nested?; var a249: Nested?; var a250: Nested?; var a251: Nested?; var a252: Nested?; var a253: Nested?; var a254: Nested?; var a255: Nested?; var a256: Nested?; var a257: Nested?; var a258: Nested?; var a259: Nested?; var a260: Nested?; var a261: Nested?; var a262: Nested?; var a263: Nested?; var a264: Nested?; var a265: Nested?; var a266: Nested?; var a267: Nested?; var a268: Nested?; var a269: Nested?; var a270: Nested?; var a271: Nested?; var a272: Nested?; var a273: Nested?; var a274: Nested?; var a275: Nested?; var a276: Nested?; var a277: Nested?; var a278: Nested?; var a279: Nested?; var a280: Nested?; var a281: Nested?; var a282: Nested?; var a283: Nested?; var a284: Nested?; var a285: Nested?; var a286: Nested?; var a287: Nested?; var a288: Nested?; var a289: Nested?; var a290: Nested?; var a291: Nested?; var a292: Nested?; var a293: Nested?; var a294: Nested?; var a295: Nested?; var a296: Nested?; var a297: Nested?; var a298: Nested?; var a299: Nested?; var a300: Nested?;
    }
    
    class LargeClass: Nested {
        var a301: Nested?; var a302: Nested?; var a303: Nested?; var a304: Nested?; var a305: Nested?; var a306: Nested?; var a307: Nested?; var a308: Nested?; var a309: Nested?; var a310: Nested?; var a311: Nested?; var a312: Nested?; var a313: Nested?; var a314: Nested?; var a315: Nested?; var a316: Nested?; var a317: Nested?; var a318: Nested?; var a319: Nested?; var a320: Nested?; var a321: Nested?; var a322: Nested?; var a323: Nested?; var a324: Nested?; var a325: Nested?; var a326: Nested?; var a327: Nested?; var a328: Nested?; var a329: Nested?; var a330: Nested?; var a331: Nested?; var a332: Nested?; var a333: Nested?; var a334: Nested?; var a335: Nested?; var a336: Nested?; var a337: Nested?; var a338: Nested?; var a339: Nested?; var a340: Nested?; var a341: Nested?; var a342: Nested?; var a343: Nested?; var a344: Nested?; var a345: Nested?; var a346: Nested?; var a347: Nested?; var a348: Nested?; var a349: Nested?; var a350: Nested?; var a351: Nested?; var a352: Nested?; var a353: Nested?; var a354: Nested?; var a355: Nested?; var a356: Nested?; var a357: Nested?; var a358: Nested?; var a359: Nested?; var a360: Nested?; var a361: Nested?; var a362: Nested?; var a363: Nested?; var a364: Nested?; var a365: Nested?; var a366: Nested?; var a367: Nested?; var a368: Nested?; var a369: Nested?; var a370: Nested?; var a371: Nested?; var a372: Nested?; var a373: Nested?; var a374: Nested?; var a375: Nested?; var a376: Nested?; var a377: Nested?; var a378: Nested?; var a379: Nested?; var a380: Nested?; var a381: Nested?; var a382: Nested?; var a383: Nested?; var a384: Nested?; var a385: Nested?; var a386: Nested?; var a387: Nested?; var a388: Nested?; var a389: Nested?; var a390: Nested?; var a391: Nested?; var a392: Nested?; var a393: Nested?; var a394: Nested?; var a395: Nested?; var a396: Nested?; var a397: Nested?; var a398: Nested?; var a399: Nested?; var a400: Nested?;
    }
    
    func testReflectPerformance() {
        measure {
            for _ in 1...20 {
                let reflector = Reflector()
                let instance = LargeClass()
                do {
                    _ = try reflector.reflect(instance)
                } catch {
                    XCTFail("Reflection failed with error: \(error)")
                }
            }
        }
    }
}
