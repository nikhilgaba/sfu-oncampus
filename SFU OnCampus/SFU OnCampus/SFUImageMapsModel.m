//
//  SFUImageMapsModel.m
//  Multi Storyboard
//
//  Created by Abram Wiebe on 2015-03-15.
//  Copyright (c) 2015 Simon Fraser University. All rights reserved.
//

#import "SFUImageMapsModel.h"

@interface SFUImageMapsModel()
{
    @private
    NSArray* a;
}

@end

@implementation SFUImageMapsModel


-(SFUImageMapsModel*)init
{
    NSBundle* b = [NSBundle mainBundle]
    ;
    a = [NSArray arrayWithContentsOfFile:[b pathForResource:@"floorplans" ofType:@"plist"]];
    return self;
}

-(NSString*)nameOfBuildingAtIndex:(NSUInteger)i
{
    NSDictionary* d = [a objectAtIndex:i];
    return [d objectForKey:@"displayName"];
}

-(NSUInteger)numberOfBuildings
{
    return [a count];
}


-(NSUInteger)numberOfFloorsForBuildingAtIndex:(NSUInteger)i
{
    return [[[a objectAtIndex:i] objectForKey:@"pages"]count];
}

-(NSString*)nameOfImageForBuildingAtIndex:(NSUInteger)i onFloorWithIndex:(NSUInteger)j
{
    @try{
    NSDictionary* d = (NSDictionary*)[a objectAtIndex:i];
    NSArray* ps = [d objectForKey:@"pages"];
    NSDictionary* p = [ps objectAtIndex:j];
    if(p == nil)return nil;
    return [@"maps/" stringByAppendingString:[p objectForKey:@"image"]];
    }@catch(NSException* e)
    {
        return nil;
    }
}
-(NSString*)nameOfFloorInBuildingWithIndex:(NSUInteger)i onFloorWithIndex:(NSUInteger)j
{
    NSDictionary* d = [a objectAtIndex:i];
    NSArray* ps = [d objectForKey:@"pages"];
    return [[ps objectAtIndex:j] objectForKey:@"name"];
}
-(NSUInteger)floorCountForBuldingWithIndex:(NSUInteger)i
{
    NSDictionary* d = [a objectAtIndex:i];
    NSArray* ps = [d objectForKey:@"pages"];
    return [ps count];
}

-(NSString*)shortCodeForBuildingAtIndex:(NSUInteger)i;
{
    NSDictionary* d = (NSDictionary*)[a objectAtIndex:i];
    return [d objectForKey:@"shortcode"];
}


@end
