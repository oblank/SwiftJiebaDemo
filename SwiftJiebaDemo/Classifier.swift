//
//  Classifier.swift
//  SwiftJiebaDemo
//
//  Created by Qiwihui on 1/15/19.
//  Copyright © 2019 Qiwihui. All rights reserved.
//

import Foundation
import CoreML

class Classifier {
    
    init() {
        let dictPath = Bundle.main.resourcePath!+"/iosjieba.bundle/dict/jieba.dict.small.utf8"
        let hmmPath = Bundle.main.resourcePath!+"/iosjieba.bundle/dict/hmm_model.utf8"
        let userDictPath = Bundle.main.resourcePath!+"/iosjieba.bundle/dict/user.dict.utf8"
        let idfPath = Bundle.main.resourcePath!+"/iosjieba.bundle/dict/idf.utf8"
        let stopWordPath = Bundle.main.resourcePath!+"/iosjieba.bundle/dict/stop_words.utf8"
        
        JiebaWrapper().objcJiebaInit(dictPath, forPath: hmmPath, forIdfPath: idfPath, forStopWordPath: stopWordPath, forDictPath: userDictPath);
    }
    
    func tokenize(_ message:String) -> [String] {
        print("tokenize...")
        let words = NSMutableArray()
        JiebaWrapper().objcJiebaCut(message, toWords: words)
        return words as! [String]
    }
    
    func tags(_ message:String) -> [String] {
        print("tag...")
        let words = NSMutableArray()
        JiebaWrapper().objcJiebaExtractTags(message, topN: 3, toWords: words)
        return words as! [String]
    }
    
    func textRank(_ message:String) -> [String] {
        print("textRank...")
        let words = NSMutableArray()
        JiebaWrapper().objcJiebaTextRank(message, topN: 3, toWords: words)
        return words as! [String]
    }
}
