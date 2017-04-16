//
//  PinterestBoardsController+Server.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <PinterestSDK/PDKClient.h>
#import <PinterestSDK/PDKResponseObject.h>
#import "PinterestBoardsController+Server.h"
#import "BoardObject.h"
#import "BoardImageObject.h"

@implementation PinterestBoardsController(Server)

  - ( void )getAuthenticatedUserBoardsWithSuccess:( void (^) (NSArray *) )success failure:( void (^) () )failure; {

      [[PDKClient sharedInstance] getAuthenticatedUserBoardsWithFields:[NSSet setWithArray:@[ @"id", @"image", @"description", @"name" ]] success:^(PDKResponseObject *responseObject) {

          NSMutableArray *boards = [NSMutableArray new];

          [responseObject.parsedJSONDictionary.allValues enumerateObjectsUsingBlock:^(NSArray *parsedDictionaryObject, NSUInteger idx, BOOL *stop) {

              [parsedDictionaryObject enumerateObjectsUsingBlock:^(NSDictionary *boardData, NSUInteger idx2, BOOL *stop2) {

                  BoardObject *boardObject = [BoardObject new];
                  boardObject.Description = boardData[ @"description" ] ?: @"";
                  boardObject.name        = boardData[ @"name" ] ?: @"";
                  boardObject.id          = boardData[ @"id" ] ?: @"";

                  if ( [boardData valueForKeyPath:@"image"] ) {
                      NSDictionary *imageDictionary = boardData[ @"image" ];

                      if ( [imageDictionary valueForKeyPath:@"60x60"] ) {
                          NSDictionary     *thumbnail        = imageDictionary[ @"60x60" ];
                          BoardImageObject *boardImageObject = [BoardImageObject new];
                          boardImageObject.url    = thumbnail[ @"url" ] ?: @"";
                          boardImageObject.width  = [( thumbnail[ @"width" ] ?: @0 ) integerValue];
                          boardImageObject.height = [( thumbnail[ @"height" ] ?: @0 ) integerValue];
                          boardObject.image       = boardImageObject;

                      }
                  }

                  [boards addObject:boardObject];

              }];

          }];

          success(boards);

      } andFailure:^(NSError *error) {
          failure();

      }];

  }

  - ( void )logoutFromPinterestWithSuccess:( void (^) () )success failure:( void (^) () )failure; {

      [PDKClient clearAuthorizedUser];
      success();

  }

@end
