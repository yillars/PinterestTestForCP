//
//  CustomLayout.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "CustomLayout.h"

@implementation CustomLayout

  - (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
  {
      UICollectionViewLayoutAttributes* currentItemAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
      NSInteger numberOfItemsPerLine = floor([self collectionViewContentSize].width / [self itemSize].width);

      if (indexPath.item % numberOfItemsPerLine != 0)
      {
          NSInteger cellIndexInLine = (indexPath.item % numberOfItemsPerLine);

          CGRect itemFrame = [currentItemAttributes frame];
          itemFrame.origin.x = ([self itemSize].width * cellIndexInLine) + ([self minimumInteritemSpacing] * cellIndexInLine);
          currentItemAttributes.frame = itemFrame;
      }

      return currentItemAttributes;
  }

@end
