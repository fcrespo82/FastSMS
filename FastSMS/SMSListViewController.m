//
//  SMSListViewController.m
//  FastSMS
//
//  Created by Fernando Crespo on 02/12/12.
//  Copyright (c) 2012 Fernando Crespo. All rights reserved.
//

#import "SMSListViewController.h"

@interface SMSListViewController ()

@end

@implementation SMSListViewController

NSMutableArray *arrayItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)setNavigationBarWithColor:(UIColor *)color {
//    self.navigationController.navigationBar.tintColor = color;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Display an Edit button in the navigation bar.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // Initialize arrayItems
    if (!arrayItems) {
        arrayItems = [[NSMutableArray alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // Only one section since it's a simple SMS list
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *frontIdentifier = @"SMSTemplate";
    static NSString *backIdentifier = @"SMSBack";
    
	SMSCell *cell = (SMSCell *)[tableView dequeueReusableCellWithIdentifier:frontIdentifier forIndexPath:indexPath];
    
//    UITableViewCell *back = [tableView dequeueReusableCellWithIdentifier:backIdentifier forIndexPath:indexPath];

    NSDictionary *item = [arrayItems objectAtIndex:[indexPath item]];

    cell.SMSCellTitle.text = [item valueForKey:@"title"];
    cell.SMSCellText.text = [item valueForKey:@"value"];
    
    UIImage *defaultImage = [UIImage imageNamed:@"guy.jpeg"];
    cell.SMSCellImage.image = defaultImage;

    NSLog(@"%@", cell.subviews);
    
//    cell.backView = back;

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        NSMutableArray *tempArray = [arrayItems mutableCopy];
//        [tempArray removeObjectAtIndex:[indexPath item]];
//        arrayItems = [tempArray copy];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"test" message:@"add" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
//
//        [alert show];
//    }
//}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSMutableArray *tempArray = [arrayItems mutableCopy];
    id from = [tempArray objectAtIndex: [fromIndexPath item]];
    id to = [tempArray objectAtIndex: [toIndexPath item]];
    [tempArray removeObjectAtIndex: [toIndexPath item]];
    [tempArray insertObject:from atIndex: [toIndexPath item]];
    [tempArray removeObjectAtIndex: [fromIndexPath item]];
    [tempArray insertObject:to atIndex: [fromIndexPath item]];
    arrayItems = [tempArray copy];
    NSLog(@"array: %@", tempArray);
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewCellEditingStyleNone;
}

- (IBAction)addItem:(id)sender {
    NSDictionary *randomDict =  @{@"title":[NSString stringWithFormat:@"%d", rand()], @"value": @"Just a text to identify if the size and fontsize of this cell would br enought to acomodate large SMS texts."};
    [arrayItems addObject:randomDict];
    
    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:[arrayItems count]-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:insertIndexPath] withRowAnimation:UITableViewRowAnimationTop];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
