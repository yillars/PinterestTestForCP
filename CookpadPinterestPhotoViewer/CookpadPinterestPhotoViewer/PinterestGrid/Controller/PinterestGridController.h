//
//  PinterestGridController.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinterestGridView.h"

@class BoardObject;

@interface PinterestGridController : UIViewController <PinterestGridViewDelegate>

    @property (strong, nonatomic) IBOutlet PinterestGridView *viewPinterestGrid;

    @property(nonatomic, strong) BoardObject *boardObject;
@end
