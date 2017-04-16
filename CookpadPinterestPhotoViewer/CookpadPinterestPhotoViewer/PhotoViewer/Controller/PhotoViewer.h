//
//  PhotoViewer.h
//  CookpadPhotoViewer
//
//  Created by SERDAR YILLAR on 13/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewer : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnsH_photoDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblPage;

@property (weak, nonatomic) IBOutlet UILabel             *lblPhotoDescription;
    @property(weak, nonatomic) IBOutlet UICollectionView *colList;
    @property(nonatomic, strong) NSMutableArray          *dataSource;
    @property(nonatomic) NSInteger                       startIndex;
    @property(nonatomic) BOOL                            hideDescriptions;
@end
