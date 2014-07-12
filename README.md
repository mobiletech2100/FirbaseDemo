FirebaseDemo
============

###Installation
Add line at **Podfile**:

```
pod 'Firebase', '~> 1.1'
```


###Start up app

Import framework at **ViewController**:

```
#import <Firebase/Firebase.h>
```

Add properties:

```
@property (strong, nonatomic) Firebase * myRootRef;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
```

*lazy loading* for `myRootRef` init:

```
- (Firebase *)myRootRef
{
    if (_myRootRef == nil)
    {
        _myRootRef = [[Firebase alloc] initWithUrl:@"https://brilliant-fire-5884.firebaseio.com/"];
    }
    return _myRootRef;
}
```

New `IBAction` of `myTextField` for event *Editing Changed* :

```
- (IBAction)myTextFieldDidChange:(id)sender {
    [self.myRootRef setValue:self.myTextField.text];
}
```

Setup the observer:

```
- (void)setupFirebaseOberver{
    [self.myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        if(snapshot.value != [NSNull null]) {
            self.myLabel.text = snapshot.value;
        }
    }];
}
```

Add `[self setupFirebaseOberver];` at `viewDidLoad` method.

![](http://res.cloudinary.com/rafaparadela/image/upload/v1405184682/demoFirebase_xzljhl.gif)

[Video](https://www.youtube.com/watch?v=vc5ltZhtk8k).





