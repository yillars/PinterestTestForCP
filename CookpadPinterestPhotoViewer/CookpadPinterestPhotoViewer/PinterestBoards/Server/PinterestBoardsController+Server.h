//
//  PinterestBoardsController+Server.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestBoardsController.h"

@interface PinterestBoardsController (Server)

    - ( void )getAuthenticatedUserBoardsWithSuccess:( void (^) (NSArray *) )success failure:( void (^) () )failure;
    - ( void )logoutFromPinterestWithSuccess:( void (^) () )success failure:( void (^) () )failure;
@end
