//
//  PinterestGridView.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "PinterestGridCell.h"
#import "PinObject.h"
#import "PinterestGridView.h"
#import "BoardImageObject.h"
#import "CustomCollectionLayout.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@implementation PinterestGridView

  - ( void )awakeFromNib; {
      [super awakeFromNib];

      _colList.hidden       = YES;
      _viewEmptyPage.hidden = YES;
  }

  - ( NSInteger )collectionView:( UICollectionView * )collectionView numberOfItemsInSection:( NSInteger )section; {
      return self.collectionData.count;
  }

  - ( __kindof UICollectionViewCell * )collectionView:( UICollectionView * )collectionView cellForItemAtIndexPath:( NSIndexPath * )indexPath; {

      PinterestGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PinterestGridCell" forIndexPath:indexPath];

      PinObject *pinObject = self.collectionData[ (NSUInteger) indexPath.row ];
      cell.backgroundColor          = [UIColor whiteColor];
      cell.imgPin.layer.borderWidth = 0.2f;
      cell.imgPin.layer.borderColor = [UIColor lightGrayColor].CGColor;
      cell.lblDescription.text      = pinObject.note;

      [cell.imgPin setImageWithURL:[NSURL URLWithString:pinObject.image.url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
          if ( error ) {
              cell.imgPin.image = [UIImage imageNamed:@"cookpad_logo"];
          }
          if ( image ) {
              cell.imgPin.image = image;
          }
      } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

      return cell;
  }

  - ( void )collectionView:( UICollectionView * )collectionView didSelectItemAtIndexPath:( NSIndexPath * )indexPath; {

      [collectionView deselectItemAtIndexPath:indexPath animated:YES];
      [_delegate showDetailWithIndex:indexPath.row data:_collectionData];
  }

  - ( CGFloat )collectionView:( UICollectionView * )collectionView layout:( CustomCollectionLayout * )collectionViewLayout heightForItemAtIndexPath:( NSIndexPath * )indexPath {
      PinObject *pinObject = self.collectionData[ (NSUInteger) indexPath.row ];

      return ( ( ( ( [UIScreen mainScreen].bounds.size.width / 2 ) - 20 ) * pinObject.image.height ) / pinObject.image.width ) + 80/*Pin Note Space*/;

  }

  - ( void )reloadWithData:( NSMutableArray * )pins; {

      if ( pins.count ) {
          self.collectionData = pins;
          [_colList reloadData];
          _colList.hidden       = NO;
          _viewEmptyPage.hidden = YES;
      } else {
          _colList.hidden       = YES;
          _viewEmptyPage.hidden = NO;
      }

  }

@end
