//
//  PinterestLoginController+Server.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestLoginController.h"

@interface PinterestLoginController (Server)

    - ( void )checkPinterestAuthenticateWithSuccess:( void (^) () )success failure:( void (^) () )failure;
    - ( void )authenticateToPinterestWithSuccess:( void (^) () )success failure:( void (^) () )failure;
@end
