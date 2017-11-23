
#import "MidtransModule.h"
#import <MidtransKit/MidtransKit.h>
#import <React/RCTLog.h>

@implementation MidtransModule

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(checkOut:(NSDictionary*) optionConect
                  :(NSDictionary*) transRequest
                  : (NSDictionary*) itemDetails
                  : (NSDictionary*) creditCardOptions
                  : (NSDictionary*) mapUserDetail
                  : (NSDictionary*) optionColorTheme
                  : (NSDictionary*) optionFont
                  resolver:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject){
    
    [CONFIG setClientKey:[optionConect valueForKey:@"clientKey"]
             environment:MidtransServerEnvironmentSandbox
       merchantServerURL:[optionConect valueForKey:@"urlMerchant"]];
    
    MidtransItemDetail *itemDetail =
    [[MidtransItemDetail alloc] initWithItemID:[itemDetails valueForKey:@"id"]
                                          name:[itemDetails valueForKey:@"name"]
                                         price:[itemDetails valueForKey:@"price"]
                                      quantity:[itemDetails valueForKey:@"qty"]];
    
    MidtransCustomerDetails *customerDetail =
    [[MidtransCustomerDetails alloc] initWithFirstName:[mapUserDetail valueForKey:@"fullName"]
                                              lastName:[mapUserDetail valueForKey:@"lastname"]
                                                 email:[mapUserDetail valueForKey:@"email"]
                                                 phone:[mapUserDetail valueForKey:@"phoneNumber"]
                                       shippingAddress:[mapUserDetail valueForKey:@"address"]
                                        billingAddress:[mapUserDetail valueForKey:@"address"]];
    
    MidtransTransactionDetails *transactionDetail =
    [[MidtransTransactionDetails alloc] initWithOrderID:[transRequest valueForKey:@"transactionId"]
                                         andGrossAmount:[transRequest valueForKey:@"totalAmount"]];
    
    [[MidtransMerchantClient shared]
     requestTransactionTokenWithTransactionDetails:transactionDetail
     itemDetails:[NSArray arrayWithObjects:itemDetail, nil]
     customerDetails:customerDetail
     completion:^(MidtransTransactionTokenResponse *token, NSError *error)
     {
         if (token) {
             NSLog(@"%@", token);
         }
         else {
             NSLog(@"%s", "GAGAL");
         }
     }];
};

@end
  
