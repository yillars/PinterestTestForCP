//
//  PinterestGridView.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestGridViewDelegate

    - ( void )showDetailWithIndex:( NSInteger )index data:( NSMutableArray * )data;
@end

@interface PinterestGridView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *viewEmptyPage;
    @property(weak, nonatomic) IBOutlet UICollectionView *colList;
    @property(nonatomic) id <PinterestGridViewDelegate>          delegate;
    @property(nonatomic, strong) NSMutableArray                 *collectionData;
    - ( void )reloadWithData:( NSMutableArray * )pins;
@end
