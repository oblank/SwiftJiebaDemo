//
//  Segmentor.h
//  iosjieba
//
//  Created by yanyiwu on 14/12/24.
//  Copyright (c) 2014年 yanyiwu. All rights reserved.
//

#ifndef __iosjieba__Segmentor__
#define __iosjieba__Segmentor__

#include <stdio.h>

#include "cppjieba/MixSegment.hpp"
#include "cppjieba/KeywordExtractor.hpp"
#include "cppjieba/TextRankExtractor.hpp"
#include <string>
#include <vector>

extern cppjieba::MixSegment * globalSegmentor;
extern cppjieba::KeywordExtractor * globalKeywordExtractor;
extern cppjieba::TextRankExtractor * globalTextRankExtractor;

void JiebaInit(const std::string& dictPath, const std::string& hmmPath, const std::string& idfPath, const std::string& stopWordPath, const std::string& userDictPath);


void JiebaCut(const std::string& sentence, std::vector<std::string>& words);

void JiebaExtractTags(const std::string& sentence, std::size_t topN, std::vector<std::pair<std::string, double>>& keywords);

void JiebaTextRank(const std::string& sentence, std::size_t topN, std::vector<std::pair<std::string, double>>& keywords);

#endif /* defined(__iosjieba__Segmentor__) */
