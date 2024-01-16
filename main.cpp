#include "class_A.h"
#include "class_B.h"
#include <thread>
#include <unistd.h>
#include <memory>
class Test{
    public:
        Test(){
            a_ = std::make_shared<A>();
            b_ = std::make_shared<B>();
        }
        ~Test(){a_.reset();b_.reset();}
    void TestA(){
        while (true)
        {
            a_->TestForward();
            sleep(0.5);
        }
        
    }
    void TestB(){
        while (true)
        {
            b_->TestForward();
            sleep(0.5);

        }
        
    }
    private:
        std::shared_ptr<A> a_;
        std::shared_ptr<B> b_;
};
int main(int argv,char **argc)
{
    Test test;
    std::thread a_1(&Test::TestA,&test);
    std::thread b_1(&Test::TestB,&test);

    a_1.join();
    b_1.join();
    return 0;
}
