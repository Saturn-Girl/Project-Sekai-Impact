// For Microsoft Windows and Linux shared libraries (.dll / .so)
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// For Microsoft Windows
#ifdef _WIN32
    #include <windows.h>
    // Define EXPORT for creating DLLs
    #define EXPORT __declspec(dllexport)
#else
    // For Linux and others
    #include <unistd.h>
    #define EXPORT 
#endif

// Custom println using standard C I/O
void println(const char* str) {
    printf("%s\n", str);
}

// CalculateZ ported to C logic
EXPORT void CalculateZ(double x, double y) {
    double z = sqrt(x * x + y * y);
    
    // In C, we use printf with format specifiers instead of std::to_string
    printf("[ INFO ] calculated z: %f\n", z);
}