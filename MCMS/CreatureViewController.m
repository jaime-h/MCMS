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

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.name.text = self.creature.name;
    self.nameDescriptionTextField.text = self.creature.description;
    
    self.nameTextField.alpha = 0.0;
}

- (IBAction)onEditButtonPressed:(id)sender
{
    self.name.alpha          = 0.0;
    self.nameTextField.alpha = 1.0;
    
    self.nameTextField.text = self.creature.name;
}
- (IBAction)onSaveButtonPressed:(id)sender
{

    self.creature.name = self.nameTextField.text;
    self.creature.description = self.nameDescriptionTextField.text;
    
    [self.nameTextField resignFirstResponder];
    self.nameTextField.text = @"";
}


@end
