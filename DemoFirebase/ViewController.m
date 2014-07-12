//
//  ViewController.m
//  DemoFirebase
//
//  Created by Rafa Paradela on 10/07/14.
//  Copyright (c) 2014 rafaparadela. All rights reserved.
//

#import <Firebase/Firebase.h>
#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) Firebase * myRootRef;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupFirebaseOberver];
}


- (Firebase *)myRootRef
{
    if (_myRootRef == nil)
    {
        _myRootRef = [[Firebase alloc] initWithUrl:@"https://brilliant-fire-5884.firebaseio.com/"];
        
    }
    return _myRootRef;
}


- (IBAction)myTextFieldDidChange:(id)sender {
    [self.myRootRef setValue:self.myTextField.text];
}



- (void)setupFirebaseOberver{
    [self.myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        if(snapshot.value != [NSNull null]) {
            self.myLabel.text = snapshot.value;
        }
    }];
}



@end
