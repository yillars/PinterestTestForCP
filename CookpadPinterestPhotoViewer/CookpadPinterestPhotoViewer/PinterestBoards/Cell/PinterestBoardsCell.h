//
//  PinterestBoardsCell.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinterestBoardsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *lblBoardName;
@property (weak, nonatomic) IBOutlet UILabel *lblBoardDescription;

@end
