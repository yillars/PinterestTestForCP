//
//  PinterestLoginView.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestLoginView.h"

@implementation PinterestLoginView

  - ( void )changePinterestButtonType:( PinterestButtonType )buttonType; {

      switch ( buttonType ) {
          case PinterestButtonType_Loading: {

              _btnPinterestAuthenticate.enabled = NO;
              [_btnPinterestAuthenticate setTitle:@"" forState:UIControlStateNormal];
              [_activityIndicator startAnimating];
          }
              break;

          case PinterestButtonType_LoggedIn: {

              _btnPinterestAuthenticate.enabled = YES;
              [_btnPinterestAuthenticate setTitle:@"Show Boards" forState:UIControlStateNormal];
              [_activityIndicator stopAnimating];
          }
              break;
          case PinterestButtonType_Authenticate: {

              _btnPinterestAuthenticate.enabled = YES;
              [_activityIndicator stopAnimating];
              [_btnPinterestAuthenticate setTitle:@"Please Authenticate" forState:UIControlStateNormal];

          }
              break;
          case PinterestButtonType_Failed: {
              _btnPinterestAuthenticate.enabled = YES;
              [_activityIndicator stopAnimating];
              [_btnPinterestAuthenticate setTitle:@"Retry Authenticate" forState:UIControlStateNormal];
          }
              break;

      }

      self.currentButtonType = buttonType;

  }
@end
