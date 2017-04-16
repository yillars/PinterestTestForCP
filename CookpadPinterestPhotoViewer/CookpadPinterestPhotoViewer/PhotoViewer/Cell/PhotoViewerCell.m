//
//  PhotoViewerCell.m
//  CookpadPhotoViewer
//
//  Created by SERDAR YILLAR on 13/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIImageView+HighlightedWebCache.h>
#import "PhotoViewerCell.h"

@implementation PhotoViewerCell

  - ( void )awakeFromNib; {

      [super awakeFromNib];

      self.scrollView.delegate         = self;
      self.scrollView.minimumZoomScale = 1.0;
      self.scrollView.maximumZoomScale = 5.0;

  }

  - ( UIView * )viewForZoomingInScrollView:( UIScrollView * )scrollView {
      return self.imgFullSize;
  }

  - ( void )resetZoom; {

  }

  - ( void )loadImage:( NSURL * )url; {

      [self.imgFullSize sd_setHighlightedImageWithURL:url options:SDWebImageContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize) {

      } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
          _imgFullSize.image = image;
          [self.scrollView setZoomScale:1.0f];
          self.scrollView.contentSize = CGSizeMake(_imgFullSize.frame.size.width, _imgFullSize.frame.size.height);

      }];

  }
@end
