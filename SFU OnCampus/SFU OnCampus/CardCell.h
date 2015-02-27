//
//  CardCell.h
//  test
//
//  Created by Kevin Grant on 2/25/15.
//  Copyright (c) 2015 Kevin Grant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UITableViewCell

// Updates the labels for five day forecast
- (void)updateForecastLabels:(UILabel*) dayLabel labelHigh:(UILabel*) highLabel labelLow:(UILabel*) lowLabel image:(UIImageView*) imageDay withDictionary:(NSDictionary*) d;

// UI View
@property (weak, nonatomic) IBOutlet UIView *cardView;

// SFU Burnaby Label
@property (weak, nonatomic) IBOutlet UILabel *location;

// Description of current weather, current wind, and precipitation
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *windAndPrecip;
@property (weak, nonatomic) IBOutlet UILabel *precipitation;

// Large weather icon and current temperature
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *temperature;

#pragma mark day labels
// Day name labels for five day forecast
@property (weak, nonatomic) IBOutlet UILabel *dayOne;
@property (weak, nonatomic) IBOutlet UILabel *dayTwo;
@property (weak, nonatomic) IBOutlet UILabel *dayThree;
@property (weak, nonatomic) IBOutlet UILabel *dayFour;
@property (weak, nonatomic) IBOutlet UILabel *dayFive;

// Weather icons for five day forecast
@property (weak, nonatomic) IBOutlet UIImageView *iconDayOne;
@property (weak, nonatomic) IBOutlet UIImageView *iconDayTwo;
@property (weak, nonatomic) IBOutlet UIImageView *iconDayThree;
@property (weak, nonatomic) IBOutlet UIImageView *iconDayFour;
@property (weak, nonatomic) IBOutlet UIImageView *iconDayFive;

// Temperature High labels for five day forecast
@property (weak, nonatomic) IBOutlet UILabel *dayOneHigh;
@property (weak, nonatomic) IBOutlet UILabel *dayTwoHigh;
@property (weak, nonatomic) IBOutlet UILabel *dayThreeHigh;
@property (weak, nonatomic) IBOutlet UILabel *dayFourHigh;
@property (weak, nonatomic) IBOutlet UILabel *dayFiveHigh;

// Temperature lows for five day forecast
@property (weak, nonatomic) IBOutlet UILabel *dayOneLow;
@property (weak, nonatomic) IBOutlet UILabel *dayTwoLow;
@property (weak, nonatomic) IBOutlet UILabel *dayThreeLow;
@property (weak, nonatomic) IBOutlet UILabel *dayFourLow;
@property (weak, nonatomic) IBOutlet UILabel *dayFiveLow;

// Hourly forecast button
@property (weak, nonatomic) IBOutlet UIButton *hourlyForecastButton;

@end