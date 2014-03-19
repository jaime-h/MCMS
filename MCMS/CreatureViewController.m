//
//  CreatureViewController.m
//  MCMS
//
//  Created by Jaime Hernandez on 3/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"


@interface CreatureViewController ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameDescriptionTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameDescriptionTextLabel;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.name.text = self.creature.name;
    self.nameDescriptionTextLabel.text = self.creature.description;
    
    // Description not showing up here within label - fix!!
    
    NSLog(@"%@", self.nameDescriptionTextField.text);
    NSLog(@"%@", self.nameDescriptionTextLabel.text);

    
    self.nameTextField.alpha = 0.0;
}

- (IBAction)onEditButtonPressed:(id)sender
{
    self.name.alpha          = 0.0;
    self.nameTextField.alpha = 1.0;

    
    self.nameTextField.text = self.creature.name;
    self.nameDescriptionTextField.text = self.creature.description;

}
- (IBAction)onSaveButtonPressed:(id)sender
{

    self.creature.name = self.nameTextField.text;
    self.creature.description = self.nameDescriptionTextField.text;
    
    [self.nameTextField resignFirstResponder];
    self.nameTextField.text = @"";
}


@end
