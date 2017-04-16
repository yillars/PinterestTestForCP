//
//  PinterestGridController+Server.m
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <PinterestSDK/PDKClient.h>
#import <PinterestSDK/PDKResponseObject.h>
#import "PinterestGridController+Server.h"
#import "PinObject.h"
#import "BoardImageObject.h"

@implementation PinterestGridController(Server)

  - ( void )getPinterestBoardById:( NSString * )boardId success:( void (^) (NSArray *) )success failure:( void (^) () )failure; {

      [[PDKClient sharedInstance] getBoardPins:boardId fields:[NSSet setWithArray:@[ @"image", @"color", @"note" ]] withSuccess:^(PDKResponseObject *responseObject) {

          NSMutableArray *pins = [NSMutableArray new];

          if ( responseObject.parsedJSONDictionary.allValues.count ) {
              if ( [responseObject.parsedJSONDictionary valueForKeyPath:@"data"] ) {
                  NSArray *data = responseObject.parsedJSONDictionary[ @"data" ];

                  [data enumerateObjectsUsingBlock:^(NSDictionary *pinObjectAsDictionary, NSUInteger idx, BOOL *stop) {

                      PinObject *pinObject = [PinObject new];
                      pinObject.id    = pinObjectAsDictionary[ @"id" ] ?: @"";
                      pinObject.note  = pinObjectAsDictionary[ @"note" ] ?: @"";
                      pinObject.color = pinObjectAsDictionary[ @"color" ] ?: @"";

                      if ( [pinObjectAsDictionary valueForKeyPath:@"image"] ) {
                          NSDictionary *imageDictionary = pinObjectAsDictionary[ @"image" ];

                          if ( [imageDictionary valueForKeyPath:@"original"] ) {
                              NSDictionary     *thumbnail        = imageDictionary[ @"original" ];
                              BoardImageObject *boardImageObject = [BoardImageObject new];
                              boardImageObject.url    = thumbnail[ @"url" ] ?: @"";
                              boardImageObject.width  = [( thumbnail[ @"width" ] ?: @0 ) integerValue];
                              boardImageObject.height = [( thumbnail[ @"height" ] ?: @0 ) integerValue];
                              pinObject.image         = boardImageObject;

                          }
                      }

                      [pins addObject:pinObject];

                  }];
              }
          }

          success(pins);

      } andFailure:^(NSError *error) {

          failure();
      }];

  }

@end
