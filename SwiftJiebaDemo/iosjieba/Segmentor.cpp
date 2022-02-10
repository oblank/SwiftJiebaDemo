//
//  Segmentor.cpp
//  iosjieba
//
//  Created by yanyiwu on 14/12/24.
//  Copyright (c) 2014年 yanyiwu. All rights reserved.
//

#include "Segmentor.h"
#include <iostream>

using namespace cppjieba;

cppjieba::MixSegment * globalSegmentor;
cppjieba::KeywordExtractor * globalKeywordExtractor;
cppjieba::TextRankExtractor * globalTextRankExtractor;

void JiebaInit(const string& dictPath, const string& hmmPath, const string& idfPath, const string& stopWordPath, const string& userDictPath)
{
    if(globalSegmentor == NULL) {
        globalSegmentor = new MixSegment(dictPath, hmmPath, userDictPath);
    }
    if(globalKeywordExtractor == NULL) {
        globalKeywordExtractor = new KeywordExtractor(dictPath, hmmPath, idfPath, stopWordPath, userDictPath);
    }
    if(globalTextRankExtractor == NULL) {
        globalTextRankExtractor = new TextRankExtractor(dictPath, hmmPath, stopWordPath, userDictPath);
    }
    cout << __FILE__ << __LINE__ << endl;
}

void JiebaCut(const string& sentence, vector<string>& words)
{
    assert(globalSegmentor);
    globalSegmentor->Cut(sentence, words);
    cout << __FILE__ << __LINE__ << endl;
    cout << words << endl;
}

void JiebaExtractTags(const std::string& sentence, std::size_t topN, vector<pair<string, double>>& keywords)
{
    assert(globalKeywordExtractor);
    globalKeywordExtractor->Extract(sentence, keywords, topN);
    cout << __FILE__ << __LINE__ << endl;
    cout << keywords << endl;
}

void JiebaTextRank(const std::string& sentence, std::size_t topN, std::vector<std::pair<std::string, double>>& keywords)
{
    assert(globalTextRankExtractor);
    globalTextRankExtractor->Extract(sentence, keywords, topN);
    cout << __FILE__ << __LINE__ << endl;
    cout << keywords << endl;
}
