#include <cstdio>
#include <cstdlib>
#include <cassert>

#include "hist.h"

#include "benchmark.h"
#include "halide_image.h"
#include "halide_image_io.h"

using namespace Halide::Tools;

int main(int argc, char **argv) {

    Image<unsigned char> input = load_image(argv[1]);
    Image<int> output(256);

    hist(input, output);

    // Timing code. Timing doesn't include copying the input data to
    // the gpu or copying the output back.
    double min_t = benchmark(1, 10, [&]() {
        hist(input, output);
    });
    printf("%g\n", min_t * 1e3);


    return 0;
}
