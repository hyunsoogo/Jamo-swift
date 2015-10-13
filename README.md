# Jamo-swift
UTF-8 기준의 Swift용 한글 자모 분해 라이브러리

### Usage
let word = "값"

let jamo = Jamo.getJamo(word) 

// "ㄱㅏㅂㅅ"

### Caution
받침(종성)이 이중자음인 경우 두 개의 자음으로 분해함
