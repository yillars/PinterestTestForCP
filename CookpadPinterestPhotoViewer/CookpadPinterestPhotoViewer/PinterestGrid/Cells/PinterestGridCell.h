//
//  PinterestGridCell.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinterestGridCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgPin;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end
