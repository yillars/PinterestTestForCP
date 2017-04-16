//
// Created by SERDAR YILLAR on 16/04/2017.
// Copyright (c) 2017 Cookpad Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BoardImageObject;

@interface PinObject : NSObject

    @property(nonatomic, strong) BoardImageObject *image;
    @property(nonatomic, copy) NSString           *id;
    @property(nonatomic, copy) NSString           *note;
    @property(nonatomic, copy) NSString           *color;
@end
