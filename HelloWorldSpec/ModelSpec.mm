#import "Model.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ModelSpec)

describe(@"Model", ^{
    __block Model *model;

    describe(@"Model instance should not be nil", ^{
        it(@"Model instance", ^{
            Model* instance = [Model sharedInstance];
            instance should_not be_nil();

        });
    });
    describe(@"Add two strings", ^{
        it(@"Should add strings 123 & 456", ^{
 
            Model* instance = [Model sharedInstance];
            [instance addString:@"123" toString:@"456"];
           
            instance.result should equal(@"123456");
        });
        it(@"result should not be empty after adding strings", ^{
            
            Model* instance = [Model sharedInstance];
            [instance addString:@"123" toString:@"456"];
            instance.result should_not equal(@"");
        });
    });
});

SPEC_END
