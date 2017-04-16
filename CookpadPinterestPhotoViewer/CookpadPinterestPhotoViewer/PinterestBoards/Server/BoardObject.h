//
// Created by SERDAR YILLAR on 16/04/2017.
// Copyright (c) 2017 Cookpad Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BoardImageObject;

@interface BoardObject : NSObject

    @property(nonatomic, copy) NSString           *id;
    @property(nonatomic, copy) NSString           *Description;
    @property(nonatomic, copy) NSString           *name;
    @property(nonatomic, strong) BoardImageObject *image;
@end
