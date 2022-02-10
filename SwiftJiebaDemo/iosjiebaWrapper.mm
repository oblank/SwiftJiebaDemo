//
//  iosjiebaWrapper.m
//  SwiftJiebaDemo
//
//  Created by Qiwihui on 1/15/19.
//  Copyright © 2019 Qiwihui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iosjiebaWrapper.h"
#include "Segmentor.h"

@implementation JiebaWrapper

- (void) objcJiebaInit: (NSString *) dictPath forPath: (NSString *) hmmPath forIdfPath: (NSString *) idfPath forStopWordPath: (NSString *) stopWordPath forDictPath: (NSString *) userDictPath {
    const char *cDictPath = [dictPath UTF8String];
    const char *cHmmPath = [hmmPath UTF8String];
    const char *cIdfPath = [idfPath UTF8String];
    const char *cStopWordPath = [stopWordPath UTF8String];
    const char *cUserDictPath = [userDictPath UTF8String];
    
    JiebaInit(cDictPath, cHmmPath, cIdfPath, cStopWordPath, cUserDictPath);
}

- (void) objcJiebaCut: (NSString *) sentence toWords: (NSMutableArray *) words {
    
    const char* cSentence = [sentence UTF8String];
    
    std::vector<std::string> wordsList;
    for (int i = 0; i < [words count];i++)
    {
        wordsList.push_back(wordsList[i]);
    }
    JiebaCut(cSentence, wordsList);
    
    [words removeAllObjects];
    std::for_each(wordsList.begin(), wordsList.end(), [&words](std::string str) {
        id nsstr = [NSString stringWithUTF8String:str.c_str()];
        [words addObject:nsstr];
    });
}

- (void) objcJiebaExtractTags: (NSString *) sentence toWords: (NSMutableArray *) words {
    const char* cSentence = [sentence UTF8String];
    
    std::vector<std::pair<std::string, double>> wordsList;
    
//    for (int i = 0; i < [words count];i++)
//    {
//        wordsList.push_back(wordsList[i]);
//    }
    JiebaExtractTags(cSentence, 5, wordsList);
    print(wordsList);
    
//    [words removeAllObjects];
//    std::for_each(wordsList.begin(), wordsList.end(), [&words](std::string str) {
//        id nsstr = [NSString stringWithUTF8String:str.c_str()];
//        [words addObject:nsstr];
//    });
}

- (void) objcJiebaTextRank: (NSString *) sentence toWords: (NSMutableArray *) words {
    const char* cSentence = [sentence UTF8String];
    
    std::vector<std::pair<std::string, double>> wordsList;
    
//    for (int i = 0; i < [words count];i++)
//    {
//        wordsList.push_back(wordsList[i]);
//    }
    JiebaTextRank(cSentence, 5, wordsList);
    print(wordsList);
    
//    [words removeAllObjects];
//    std::for_each(wordsList.begin(), wordsList.end(), [&words](std::string str) {
//        id nsstr = [NSString stringWithUTF8String:str.c_str()];
//        [words addObject:nsstr];
//    });
}

@end
