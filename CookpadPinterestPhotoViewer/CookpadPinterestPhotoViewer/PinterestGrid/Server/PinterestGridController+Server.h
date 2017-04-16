//
//  PinterestGridController+Server.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import "PinterestGridController.h"

@interface PinterestGridController (Server)

    - ( void )getPinterestBoardById:( NSString * )boardId success:( void (^) (NSArray *) )success failure:( void (^) () )failure;
@end
