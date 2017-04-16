//
//  PhotoViewer.m
//  CookpadPhotoViewer
//
//  Created by SERDAR YILLAR on 13/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "PhotoViewer.h"
#import "PhotoViewerCell.h"
#import "PinObject.h"
#import "BoardImageObject.h"

@interface PhotoViewer()

@end

@implementation PhotoViewer

  - ( void )viewDidLoad {
      [super viewDidLoad];

      UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
      swipeRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
      [self.view addGestureRecognizer:swipeRecognizer];

      _lblPage.layer.shadowColor     = _lblPhotoDescription.layer.shadowColor     = [[UIColor blackColor] CGColor];
      _lblPage.layer.shadowOffset    = _lblPhotoDescription.layer.shadowOffset    = CGSizeMake(4.0, 4.0);
      _lblPage.layer.shadowRadius    = _lblPhotoDescription.layer.shadowRadius    = 3.0;
      _lblPage.layer.shadowOpacity   = _lblPhotoDescription.layer.shadowOpacity   = 0.8;
      _lblPage.layer.masksToBounds   = _lblPhotoDescription.layer.masksToBounds   = NO;
      _lblPage.layer.shouldRasterize = _lblPhotoDescription.layer.shouldRasterize = YES;

  }

  - ( void )viewWillAppear:( BOOL )animated; {
      self.colList.alpha = 0;

      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

          [self.colList scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_startIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
          self.colList.alpha = 1;
      });

      _lblPage.text = [NSString stringWithFormat:@"%i/%i", _startIndex + 1, self.dataSource.count];

  }

  - ( void )touchesEnded:( NSSet * )touches withEvent:( UIEvent * )event {
      NSLog(@"touchesEnded");
  }

  - ( NSInteger )collectionView:( UICollectionView * )collectionView numberOfItemsInSection:( NSInteger )section; {
      return self.dataSource.count;
  }

  - ( __kindof UICollectionViewCell * )collectionView:( UICollectionView * )collectionView cellForItemAtIndexPath:( NSIndexPath * )indexPath; {

      PhotoViewerCell *cell      = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoViewerCell" forIndexPath:indexPath];
      PinObject       *pinObject = self.dataSource[ (NSUInteger) indexPath.row ];
      [cell loadImage:[[NSURL alloc] initWithString:pinObject.image.url]];

      return cell;
  }

  - ( void )scrollViewDidScroll:( UIScrollView * )scrollView {
      NSInteger currentIndex = (NSInteger) ( self.colList.contentOffset.x / self.colList.frame.size.width );
      if ( self.dataSource.count > currentIndex ) {
          PinObject *pinObject = self.dataSource[ (NSUInteger) currentIndex ];
          _lblPhotoDescription.text = pinObject.note;
          CGSize neededSize = [_lblPhotoDescription sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 32, CGFLOAT_MAX)];
          _cnsH_photoDescription.constant = neededSize.height;
      }

      _lblPage.text = [NSString stringWithFormat:@"%i/%i", currentIndex + 1, self.dataSource.count];

  }

  - ( CGSize )collectionView:( UICollectionView * )collectionView layout:( UICollectionViewLayout * )collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath * )indexPath {
      return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
  }

  - ( void )collectionView:( UICollectionView * )collectionView didSelectItemAtIndexPath:( NSIndexPath * )indexPath; {

      if ( self.hideDescriptions ) {
          _lblPhotoDescription.hidden = _lblPage.hidden = NO;
          self.hideDescriptions       = NO;
      } else {
          _lblPhotoDescription.hidden = _lblPage.hidden = YES;
          self.hideDescriptions       = YES;
      }

  }

  - ( void )swipeDown:( UIGestureRecognizer * )sender {
      [self action_close:nil];
  }

  - ( IBAction)action_close:( id )sender {
      [self dismissViewControllerAnimated:YES completion:nil];
  }

  - ( void )didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];

  }

@end
