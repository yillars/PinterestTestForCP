//
//  PinterestBoardsView.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardObject;

@protocol PinterestBoardsViewDelegate

    - ( void )showPinsWithObject:( BoardObject * )selectedBoardObject;
@end

@interface PinterestBoardsView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *viewErrorPage;
    @property(weak, nonatomic) IBOutlet UITableView       *tblList;
    @property(nonatomic) id <PinterestBoardsViewDelegate> delegate;
    @property(nonatomic, strong) NSArray                  *tableData;
    - ( void )reloadWithData:( NSArray * )boards;
@end
