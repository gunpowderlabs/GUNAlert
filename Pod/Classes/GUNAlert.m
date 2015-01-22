//
//  GUNAlert.m
//  Pods
//
//  Created by Michal Taszycki on 22/01/15.
//
//

#import <UIKit/UIKit.h>

#import "GUNAlert.h"

@interface GUNAlert() <UIAlertViewDelegate>
@property (readonly, weak, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UIAlertView *alertView;
@property (strong, nonatomic) NSArray* handlers;
@property (strong, nonatomic) NSArray* actionHandlers;
@end

@implementation GUNAlert

- (id) initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        _viewController = viewController;
    }
    return self;
}

- (void)cancelAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                 cancelTitle:(NSString *)cancelTitle
               cancelHandler:(GUNAlertHandler)cancelHandler {
    NSArray *handlers = @[cancelHandler];
    NSArray *titles = @[cancelTitle];
    [self alertWithTitle:title message:message titles:titles handlers:handlers];
}

- (void)cancelOkAlertWithTitle:(NSString *)title
                       message:(NSString *)message
                   cancelTitle:(NSString *)cancelTitle
                 cancelHandler:(GUNAlertHandler)cancelHandler
                       okTitle:(NSString *)okTitle
                     okHandler:(GUNAlertHandler)okHandler {
    NSArray *handlers = @[cancelHandler, okHandler];
    NSArray *titles = @[cancelTitle, okTitle];
    [self alertWithTitle:title message:message titles:titles handlers:handlers];
}

-(void)alertWithTitle:(NSString *)title
         message:(NSString *)message
    titles:(NSArray *)titles
  handlers:(NSArray *)handlers {
    if (titles.count != handlers.count) {
        [NSException raise:@"Invalid arguments" format:@"Titles count has to match handlers count."];
    }
    if (titles.count < 1) {
        [NSException raise:@"Invalid arguments" format:@"Titles count has to be greater or equal to 1."];
    }
    if (NSClassFromString(@"UIAlertController")) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:title
                                              message:message
                                              preferredStyle:UIAlertControllerStyleAlert];
        for (NSUInteger i=0; i<titles.count; ++i) {
            NSString *actionTitle = (NSString *)titles[i];
            void (^actionHandler)(UIAlertAction *action) = ^(UIAlertAction *action)
            {
                void (^handler)(void) = handlers[i];
                handler();
            };

            UIAlertAction *action = [UIAlertAction
                                           actionWithTitle:actionTitle
                                           style:UIAlertActionStyleDefault
                                           handler: actionHandler];
            [alertController addAction:action];
        }
        [self.viewController presentViewController:alertController animated:YES completion:nil];
    } else {
        self.handlers = handlers;
        NSString *cancelButtonTitle = [titles firstObject];
        self.alertView = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles: nil];
        for (NSUInteger i=1; i<titles.count; ++i) {
            NSString *buttonTitle = titles[i];
            [self.alertView addButtonWithTitle: buttonTitle];
        }
        [self.alertView show];

    }
}



- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (!self.handlers) {
        [NSException raise:@"Handlers are undefined." format:@"Tried to call handlers[%ldl] while handlers were undefined", buttonIndex];
    }
    if (buttonIndex > self.handlers.count) {
        [NSException raise:@"Not enough handlers defined" format:@"Tried to call handlers[%ldl] while handlers.count == %lul", buttonIndex, self.handlers.count];
    }
    void (^handler)(void) = self.handlers[buttonIndex];
    handler();
}




@end
