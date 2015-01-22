//
//  GUNAlert.h
//  Pods
//
//  Created by Michal Taszycki on 22/01/15.
//
//

#import <Foundation/Foundation.h>

typedef void (^GUNAlertHandler)(void);

@interface GUNAlert : NSObject
- (id) initWithViewController:(UIViewController *)viewController;
- (void)cancelAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                 cancelTitle:(NSString *)cancelTitle
               cancelHandler:(GUNAlertHandler)cancelHandler;
- (void)cancelOkAlertWithTitle:(NSString *)title
                       message:(NSString *)message
                   cancelTitle:(NSString *)cancelTitle
                 cancelHandler:(GUNAlertHandler)cancelHandler
                       okTitle:(NSString *)okTitle
                     okHandler:(GUNAlertHandler)okHandler;
-(void)alertWithTitle:(NSString *)title
              message:(NSString *)message
               titles:(NSArray *)titles
             handlers:(NSArray *)handlers;
@end
