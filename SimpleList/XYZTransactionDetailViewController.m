#import "XYZTransactionDetailViewController.h"

@interface XYZTransactionDetailViewController () {
  XYZTransaction *_transaction;
  IBOutlet UILabel *_dateLabel;
  UIView *_borderView;
}

@end

@implementation XYZTransactionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
  _dateLabel.text = _transaction.date.description;
}

- (void)displayTransaction:(XYZTransaction *)transaction {
  _transaction = [transaction copy];
  _dateLabel.text = _transaction.date.description;
}

@end
