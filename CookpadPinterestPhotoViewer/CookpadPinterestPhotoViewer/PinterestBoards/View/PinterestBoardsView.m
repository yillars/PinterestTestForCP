//
//  PinterestBoardsView.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>
#import "PinterestBoardsView.h"
#import "PinterestBoardsCell.h"
#import "BoardObject.h"
#import "BoardImageObject.h"

@implementation PinterestBoardsView

  - ( void )awakeFromNib; {

      [super awakeFromNib];
      _tblList.hidden       = YES;
      _viewErrorPage.hidden = YES;
  }

  - ( NSInteger )tableView:( UITableView * )tableView numberOfRowsInSection:( NSInteger )section; {
      return self.tableData.count;
  }

  - ( UITableViewCell * )tableView:( UITableView * )tableView cellForRowAtIndexPath:( NSIndexPath * )indexPath; {

      PinterestBoardsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PinterestBoardsCell"];

      BoardObject *boardObject = self.tableData[ (NSUInteger) indexPath.row ];

      [cell.imgThumbnail setImageWithURL:[NSURL URLWithString:boardObject.image.url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
          if ( error ) {
              cell.imgThumbnail.image = [UIImage imageNamed:@"cookpad_logo"];
          }
          if ( image ) {
              cell.imgThumbnail.image = image;
          }
      } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

      cell.lblBoardName.text        = boardObject.name.length ? boardObject.name : @"Unnamed Board";
      cell.lblBoardDescription.text = boardObject.Description.length ? boardObject.Description : @"No Description";

      [cell.imgThumbnail.layer setBorderColor:[[UIColor redColor] CGColor]];
      [cell.imgThumbnail.layer setBorderWidth:1.0];

      return cell;
  }

  - ( void )tableView:( UITableView * )tableView didSelectRowAtIndexPath:( NSIndexPath * )indexPath; {

      [tableView deselectRowAtIndexPath:indexPath animated:YES];

      BoardObject *boardObject = self.tableData[ (NSUInteger) indexPath.row ];
      [_delegate showPinsWithObject:boardObject];

  }

  - ( void )reloadWithData:( NSArray * )boards; {

      if ( boards.count ) {
          _tblList.hidden       = NO;
          _viewErrorPage.hidden = YES;
          self.tableData        = boards;
          [_tblList reloadData];
      } else {
          _tblList.hidden       = YES;
          _viewErrorPage.hidden = NO;
      }

  }
@end
