//
//  PhotoViewerCell.h
//  CookpadPhotoViewer
//
//  Created by SERDAR YILLAR on 13/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewerCell : UICollectionViewCell <UIScrollViewDelegate>

    @property (weak, nonatomic) IBOutlet UIImageView *imgFullSize;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

    @property(nonatomic) CGFloat currentScale;
    - ( void )resetZoom;
    - ( void )loadImage:( NSURL * )url;
@end
