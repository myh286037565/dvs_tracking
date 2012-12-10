#ifndef FILTER_H
#define FILTER_H

#include "map.h"

class Filter
{
public:
    Filter(int size, float var);
    ~Filter();
    Map<float>* smoothen(Map<float> buffer);

    static const float PI;

private:
    //operations on kernel
    float get(int x, int y);
    void set(int x, int y, float value);
    void generateKernel();
    float convolute();
    bool outOfBounds(Map<float> *buffer, int x, int y);

    int kernelSize;
    float variance;
    float *kernel;

};

#endif // FILTER_H