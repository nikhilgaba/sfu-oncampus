//
//  SFUQRCaptureDelegate.h
//  OnCampus
//
//  Created by Abram Wiebe on 2015-03-19.
//  Copyright (c) 2015 Simon Fraser University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SFUQRCaptureDelegate <NSObject>

-(void)foundCodeWithStringRepresentation:(NSString*)s;

@end
