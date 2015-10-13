//
//  Jamo.swift
//
//  Created by hyunsoo go on 2015. 10. 13..
//  Copyright © 2015년 YUNKO STUDIO. All rights reserved.
//


import Foundation

public class Jamo {
    
    // UTF-8 기준
    static let INDEX_HANGUL_START = 44032  // "가"
    static let INDEX_HANGUL_END = 55199    // "힣"
    
    static let CYCLE_CHO = 588
    static let CYCLE_JUNG = 28
    
    static let CHO = [
        "ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
        "ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"
    ]
    
    static let JUNG = [
        "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ","ㅕ", "ㅖ", "ㅗ", "ㅘ",
        "ㅙ", "ㅚ","ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ",
        "ㅣ"
    ]
    
    static let JONG = [
        "","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ",
        "ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ",
        "ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"
    ]
    
    static let JONG_DOUBLE = [
        "ㄳ":"ㄱㅅ","ㄵ":"ㄴㅈ","ㄶ":"ㄴㅎ","ㄺ":"ㄹㄱ","ㄻ":"ㄹㅁ",
        "ㄼ":"ㄹㅂ","ㄽ":"ㄹㅅ","ㄾ":"ㄹㅌ","ㄿ":"ㄹㅍ","ㅀ":"ㄹㅎ",
        "ㅄ":"ㅂㅅ"
    ]
    
    // 주어진 "단어"를 자모음으로 분해해서 리턴하는 함수
    class func getJamo(input: String) -> String {
        var jamo = ""
        let word = input.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let length = word.characters.count
        for var i=0; i < length; i++ {
            let scala = word.substringWithRange(Range<String.Index>(start: word.startIndex.advancedBy(i), end: word.startIndex.advancedBy(i+1))).unicodeScalars
            let n = Int(scala[scala.startIndex].value)
            jamo += getJamoFromOneSyllable(n)
        }
        return jamo
    }
    
    // 주어진 "코드의 음절"을 자모음으로 분해해서 리턴하는 함수
    class func getJamoFromOneSyllable(n: Int) -> String{
        if isHangul(n){
            let index = n - INDEX_HANGUL_START
            let cho = CHO[index / CYCLE_CHO]
            let jung = JUNG[(index % CYCLE_CHO) / CYCLE_JUNG]
            var jong = JONG[index % CYCLE_JUNG]
            if let disassembledJong = JONG_DOUBLE[jong] {
                jong = disassembledJong
            }
            return cho + jung + jong
        }else{
            return String(UnicodeScalar(n))
        }
    }
    
    // 주어진 "코드의 음절" 기준으로 한글여부를 판별하는 함수
    class func isHangul(n: Int) -> Bool {
        if n >= INDEX_HANGUL_START && n <= INDEX_HANGUL_END {
            return true
        }else{
            return false
        }
    }
}