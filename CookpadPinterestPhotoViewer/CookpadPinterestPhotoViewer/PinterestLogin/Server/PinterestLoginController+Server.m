//
//  PinterestLoginController+Server.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <PinterestSDK/PDKClient.h>
#import "PinterestLoginController+Server.h"

@implementation PinterestLoginController(Server)

  - ( void )checkPinterestAuthenticateWithSuccess:( void (^) () )success failure:( void (^) () )failure; {

      [[PDKClient sharedInstance] silentlyAuthenticateWithSuccess:^(PDKResponseObject *responseObject) {
          success();
      } andFailure:^(NSError *error) {
          failure();
      }];

  }

  - ( void )authenticateToPinterestWithSuccess:( void (^) () )success failure:( void (^) () )failure; {

      [[PDKClient sharedInstance] authenticateWithPermissions:@[ PDKClientReadPublicPermissions, PDKClientReadRelationshipsPermissions ] withSuccess:^(PDKResponseObject *responseObject) {
          success();
      } andFailure:^(NSError *error) {
          failure();
      }];

  }
@end


