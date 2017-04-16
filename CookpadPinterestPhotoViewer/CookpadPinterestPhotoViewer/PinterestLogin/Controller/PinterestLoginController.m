//
//  PinterestLoginController.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestLoginController.h"
#import "PinterestBoardsController.h"
#import "PinterestLoginController+Server.h"
#import <PinterestSDK/PDKClient.h>

@interface PinterestLoginController()

@end

@implementation PinterestLoginController

  - ( void )viewDidLoad {
      [super viewDidLoad];

  }

  - ( void )viewWillAppear:( BOOL )animated; {

      [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_Loading];
      self.loggedIn = NO;

      [self checkPinterestAuthenticateWithSuccess:^{

          [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_LoggedIn];
          self.loggedIn = YES;

      } failure:^{
          [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_Authenticate];
          self.loggedIn = NO;
      }];
  }

  - ( IBAction)action_authenticate_with_pinterest:( id )sender {

      if ( !self.loggedIn ) {
          [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_Loading];

          [self authenticateToPinterestWithSuccess:^{

              [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_LoggedIn];
              self.loggedIn = YES;

          } failure:^{

              [_viewPinterestLogin changePinterestButtonType:PinterestButtonType_Failed];
              self.loggedIn = NO;

          }];
      } else {

          UIStoryboard              *storyboard                = [UIStoryboard storyboardWithName:@"PinterestBoards" bundle:nil];
          PinterestBoardsController *pinterestBoardsController = [storyboard instantiateInitialViewController];
          [self.navigationController pushViewController:pinterestBoardsController animated:YES];

      }

  }

  - ( void )didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];

  }

@end
