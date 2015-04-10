##Chapter 2 C++ Basics ##
###2.1 Variables and assignments###
1. Give the declaration for two variables called feet and inches. Both variables are of type int and both are to be initialized to zero in the declaration. Use both initialization alternatives.
    ``` cpp
    int feet = 0, inches = 0;
    int feet(0), inches(0);
    ```

2. Give the declaration for two variables called count and distance. count is of type int and is initialized to zero. distance is of type double and is initialized to 1.5.
    ``` cpp
        int count = 0;
        double distance = 1.5;
        int count (0);
        double distance (1.5);
    ```

3. Give a C++ statement that will change the value of the variable sum to the sum of the values in the variables n1 and n2. The variables are all of type int.
    ``` cpp
        int sum = n1 + n2;
    ```

4. give a C++ statement that will increase the value of the variable length by 8.3. The variable length is of type double.
    ``` cpp
        length += 8.3;
    ```

5. Give a C++ statement that will change the value of the variable product to its old value multiplied by the value of the variable n. The variables are all of type int.
    ``` cpp
        product *= n;
    ```

6. Write a program that contains statements that output the value of five or six variables that have been declared, but not initialized. Compile and run the program. What is the output? Explain.
    ``` cpp
        #include <iostream>
        using namespace std;
    
        int main(int argc, char const *argv[]) {
            int a, b, c, d;
            cout << a << " " << b << " " << c << " " << d << " ";
            // 32767 1854144566 32767 1406933680
            return 0;
        }
    
    ```
    The output will depends on the system.

7. Give good variable names for each of the following:
    a. A variable to hold the speed of an automobile
    b. A variable to hold the pay rate for an hourly employee
    c. A variable to hold the highest score in an exam

    ``` cpp
        double speed;
        double pay_rate;
        double highest_score;
    ```
