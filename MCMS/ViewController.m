//
//  ViewController.m
//  MCMS
//
//  Created by Jaime Hernandez on 3/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITabBarControllerDelegate, UITableViewDataSource>

{
    NSMutableArray *creatures;
}

@property (strong, nonatomic) IBOutlet UITextField *magicalCreatureTextField;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MagicalCreature *moe      = [MagicalCreature new];
    moe.name                  = @"Moe";
    moe.description           = @"I'm the Pretty One";
    
    MagicalCreature *curly    = [MagicalCreature new];
    curly.name                = @"Curly";
    curly.description         = @"I'm the cute One!";
    
    MagicalCreature *shemp    = [MagicalCreature new];
    shemp.name                = @"Shemp";
    shemp.description         = @"I hate Larry!";
    
    creatures = [NSMutableArray arrayWithObjects:moe, curly, shemp, nil];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [creatures count];
}

- (IBAction)onAddButtonPressed:(id)sender
{
    // Add new magicalCreatures
    
    MagicalCreature *tempCreature = [MagicalCreature new];
    tempCreature.name = self.magicalCreatureTextField.text;
    
    [creatures addObject:tempCreature];
    
    // Refresh the display table, dismiss keyboard and set text field to nil..
    
    [self.myTableView reloadData];
    [self.magicalCreatureTextField resignFirstResponder];
    
    self.magicalCreatureTextField.text = @"";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // set up view
    
    
    MagicalCreature *magicCreature = [creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureName"];
    cell.textLabel.text = magicCreature.name;
    cell.detailTextLabel.text = magicCreature.description;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    // pass data to next storyboard via segue
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
    MagicalCreature *magicalCreature = [creatures objectAtIndex:indexPath.row];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature = magicalCreature;
    
}

- (IBAction)unWindFromCreatureVCtoViewController:(UIStoryboardSegue *)sender
{
    // This is the target to get back from the other story board -- CreatureViewController
    
    CreatureViewController *fromSegue;
    fromSegue = [sender sourceViewController];
    
    [self.myTableView reloadData];
    
}
@end
