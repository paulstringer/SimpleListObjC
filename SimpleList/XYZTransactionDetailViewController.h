#import <UIKit/UIKit.h>
#import "XYZTransaction.h"

@interface XYZTransactionDetailViewController : UIViewController
@property (copy) void (^deleteBlock) (void);
- (void)displayTransaction:(XYZTransaction *) transaction;
@end
