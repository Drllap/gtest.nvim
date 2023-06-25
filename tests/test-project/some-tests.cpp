#include <gtest/gtest.h>
namespace some::ns::test {
    TEST(Suite1, Test1)
    {
        ASSERT_TRUE(false);
    }

    TEST(Suite1, Test2)
    {
        ASSERT_TRUE(true);
    }
}

TEST(Suite2, Test1)
{
    ASSERT_TRUE(false);
}

TEST(Suite2, Test2)
{
    ASSERT_TRUE(true);
}

namespace some::ns2::tt {
    class TestSuite3 : public ::testing::Test {};

    TEST_F(TestSuite3, Test1)
    {
    }

    TEST_F(TestSuite3, Test2)
    {
    }
}
