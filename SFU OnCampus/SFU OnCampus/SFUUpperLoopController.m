//
//  SFUUpperLoopController.m
//  OnCampus
//
//  Created by Nikhil Gaba on 2015-03-14.
//  Copyright (c) 2015 Simon Fraser University. All rights reserved.
//

#import "SFUUpperLoopController.h"

@implementation SFUUpperLoopController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model=[[SFUTransitModel alloc] initWithPlist:self.loopName]; //initialize the model with plist
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    return self.objects.count;
    return [self.model sizeOfArray]; //number cells equals size of plist
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    
    //    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [self.model titleStringForIndex:indexPath.row]; //set the text to the title string
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIAlertView *messageAlert = [[UIAlertView alloc]
//                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//    // Display Alert Message
//    [messageAlert show];
//
//    //get url from model
//
//    if(!self.displayInApp)
//    {
//    // [UIApplication sharedApplication] openURL:<#(NSURL *)#>
//    }else
//    {
//        // segue to web view with url
//    }
//
//}
- (void)setDetailItem:(id)newDetailItem {
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //if ([[segue identifier] isEqualToString:@"showDetail"]) {
    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //NSString* URL=[self.model urlStringForIndex:indexPath.row];
    //NSDate *object = self.objects[indexPath.row];
    SFUTransitDisplayViewController *controller = (SFUTransitDisplayViewController *)[segue destinationViewController];
    controller.BusPath = [self.tableView indexPathForSelectedRow]; //send the bus number to the next scene
    controller.loopName=self.loopName; //send the loopname to the next scene
    
    //self.tableView indexPathForSelectedR
    
    
    //[controller displayPageForURL:[NSURL URLWithString:URL] inApp:YES];
    
    //controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //controller.navigationItem.leftItemsSupplementBackButton = YES;
    // }
}


@end
