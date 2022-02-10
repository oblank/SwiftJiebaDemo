//
//  ViewController.swift
//  SwiftJiebaDemo
//
//  Created by Qiwihui on 1/15/19.
//  Copyright © 2019 Qiwihui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var idf = [Double]()
    var vocabulary = [String:Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let classfier = Classifier()
        let words = classfier.tokenize("小明硕士毕业于中国科学院计算所，后在日本京都大学深造")
        print(words)
        
        classfier.tags("小明硕士毕业于中国科学院计算所，后在日本京都大学深造")
        classfier.tags("晚上想吃烧烤、喝点小酒，上次吃的花胶鸡味道不错。花了120.04元，2个人，还是有点贵明天就要过年了，后天就要工作今天来的人好少啊秦时明月汉时关万里长征人未还但使龙城飞将在不叫胡马度阴山")
        classfier.textRank("晚上想吃烧烤、喝点小酒，上次吃的花胶鸡味道不错。花了120.04元，2个人，还是有点贵明天就要过年了，后天就要工作今天来的人好少啊秦时明月汉时关万里长征人未还但使龙城飞将在不叫胡马度阴山")
        
        // words
        // ["小明", "硕士", "毕业", "于", "中国科学院", "计算所", "，", "后", "在", "日本", "京都大学", "深造"]
    }
}

