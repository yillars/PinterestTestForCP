//
//  PinterestBoardsController.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestBoardsController.h"
#import "PinterestGridController.h"
#import "PinterestBoardsController+Server.h"
#import "BoardObject.h"

@interface PinterestBoardsController()

@end

@implementation PinterestBoardsController

  - ( void )viewDidLoad {
      [super viewDidLoad];

      self.refreshControl = [UIRefreshControl new];
      [self.refreshControl addTarget:self action:@selector(refreshBoards:) forControlEvents:UIControlEventValueChanged];
      [self.viewPinterestBoards.tblList addSubview:self.refreshControl];
      self.refreshControl.layer.zPosition -= 1;

      _viewPinterestBoards.delegate = self;

      [self getAllBoards];

  }

  - ( void )refreshBoards:( UIRefreshControl * )refreshControl; {

      [refreshControl endRefreshing];
      [self getAllBoards];
  }

  - ( void )getAllBoards; {

      [self getAuthenticatedUserBoardsWithSuccess:^(NSArray *boards) {
          [_viewPinterestBoards reloadWithData:boards];

      } failure:^{

      }];
  }

- ( IBAction)action_retry_load:( id )sender {
    
    [self getAllBoards];
    
}

  - ( IBAction)action_logout:( id )sender {

      [self logoutFromPinterestWithSuccess:^{
          [self.navigationController popViewControllerAnimated:YES];

      } failure:^{

      }];

  }

  - ( void )showPinsWithObject:( BoardObject * )selectedBoardObject; {

      UIStoryboard            *storyboard                        = [UIStoryboard storyboardWithName:@"PinterestGrid" bundle:nil];
      UINavigationController  *pinterestGridNavigationController = [storyboard instantiateInitialViewController];
      PinterestGridController *pinterestGridController           = pinterestGridNavigationController.viewControllers.lastObject;
      pinterestGridController.boardObject = selectedBoardObject;

      [self.navigationController presentViewController:pinterestGridNavigationController animated:YES completion:nil];

  }

  - ( void )didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];
      // Dispose of any resources that can be recreated.
  }

@end
