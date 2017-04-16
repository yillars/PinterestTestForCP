//
//  PinterestGridController.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestGridController.h"
#import "PinterestGridController+Server.h"
#import "BoardObject.h"
#import "PinObject.h"
#import "PhotoViewer.h"

@interface PinterestGridController()

@end

@implementation PinterestGridController

  - ( void )viewDidLoad {
      [super viewDidLoad];

      self.title                  = _boardObject.name;
      _viewPinterestGrid.delegate = self;

      [self getAllPins];

  }

  - ( IBAction)retry_load:( id )sender {
      [self getAllPins];
  }

  - ( void )getAllPins; {
      [self getPinterestBoardById:_boardObject.id success:^(NSArray *boardPins) {

          [_viewPinterestGrid reloadWithData:boardPins.mutableCopy];

      } failure:^{
          [_viewPinterestGrid reloadWithData:@[].mutableCopy];
      }];
  }

  - ( void )showDetailWithIndex:( NSInteger )index data:( NSMutableArray * )data; {

      UIStoryboard *storyboard  = [UIStoryboard storyboardWithName:@"PhotoViewer" bundle:nil];
      PhotoViewer  *photoViewer = [storyboard instantiateInitialViewController];
      photoViewer.dataSource           = data;
      photoViewer.startIndex           = index;
      photoViewer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

      [self.navigationController presentViewController:photoViewer animated:YES completion:nil];

  }

  - ( IBAction)action_close_board:( id )sender {

      [self dismissViewControllerAnimated:YES completion:nil];
  }

  - ( void )didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];

  }

@end
