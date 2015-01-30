# GUNAlert

<!--
[![CI Status](http://img.shields.io/travis/gunpowderlabs/GUNAlert.svg?style=flat)](https://travis-ci.org/Michał Taszycki/GUNAlert)
[![Version](https://img.shields.io/cocoapods/v/GUNAlert.svg?style=flat)](http://cocoadocs.org/docsets/GUNAlert)
[![License](https://img.shields.io/cocoapods/l/GUNAlert.svg?style=flat)](http://cocoadocs.org/docsets/GUNAlert)
[![Platform](https://img.shields.io/cocoapods/p/GUNAlert.svg?style=flat)](http://cocoadocs.org/docsets/GUNAlert)
-->

GUNAlert is a simple wrapper around UIAlertView and UIAlertController. For applications that need to keep backward compatibility with iOS versions < 8.
It is designed as a simple drop in solution for most common use cases.

## Usage

### Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Setup

Before using alerts you will need to instantiate <code>GUNAlert</code> class and make sure it's reference will not disappear until the alert is handled.
Here's an example:

In your <code>UIViewController</code> create an instance of <code>GUNAlert</code> class and assign it as a <code>strong</code> property.

``` ObjectiveC

@interface MyViewController ()
@property (strong, nonatomic) GUNAlert *alert;
@end

@implementation GUNViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.alert = [[GUNAlert alloc] initWithViewController: self];
}
@end
```

In most cases you will want to inform user about a fact and acknowledge it or make a decision. To facilitate this <code>GUNAlert</code> provides two helper methods:

### Showing a 'Cancel' alert
To instantiate 'Cancel' alert or in other words alert with one action use the following method:

``` ObjectiveC
    
[self.alert cancelAlertWithTitle:@"Success!"
                         message:@"You've just won a lottery."
                     cancelTitle:@"Yay!"
                   cancelHandler:^{
                       [self transferLargeSumOfMoney];
                   }];
```

### Showing a 'Cancel & Ok' alert
To instantiate 'Cancel & Ok' alert or in other words alert with two actions use the following method:

``` ObjectiveC
    
[self.alert cancelOkAlertWithTitle:@"Your meal is ready!"
                           message:@"Do you want something to drink?"
                       cancelTitle:@"Not really"
                     cancelHandler:^{
                         [self prepareOrder];
                     }
                           okTitle:@"Sure I do"
                             okHandler:^{
                                 [self addDrinkToOrder];
                                 [self prepareOrder];
                             }];
```

### Showing an alert with more than 2 actions

First prepare an array with titles for each action.

``` ObjectiveC

NSArray *titles = @[
  @"Yes",
  @"No",
  @"Maybe"
];
```

Then prepare an array of handlers for each action. Both arrays must have the same number of elements.

``` ObjectiveC

NSArray *handlers = @[
  ^{
    [self makeACall]
  },
  ^{
  },
  ^{
    if (arc4random_uniform(2)) {
      [self makeACall]
    };
  },
];
```

Finally use both arrays in the following method:

``` ObjectiveC

[self.alert alertWithTitle:@"Hey I've just met you"
                   message:@"Call me"
                    titles:titles
                  handlers:handlers];
```



## Requirements

Tested in iOS 7.1 and iOS 8

## Installation

### With CocoaPods

GUNAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "GUNAlert"

### By Hand

Copy GUNAlert.h and GUNAlert.m to your project and modify according to your preference.

## Author

Michał Taszycki, michal.taszycki@getbase.com

## License

GUNAlert is available under the MIT license. See the LICENSE file for more info.

