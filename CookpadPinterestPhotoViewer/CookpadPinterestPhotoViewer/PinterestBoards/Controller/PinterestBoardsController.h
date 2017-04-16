//
//  PinterestBoardsController.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinterestBoardsView.h"

@interface PinterestBoardsController : UIViewController <PinterestBoardsViewDelegate>

    @property(strong, nonatomic) IBOutlet PinterestBoardsView *viewPinterestBoards;

    @property(nonatomic, strong) UIRefreshControl *refreshControl;
@end
