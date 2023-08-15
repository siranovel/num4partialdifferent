#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "CNum4PartialDiff.h"

static double* CNum4PartialDiff_doFiniteDiffMethod(int n, double *yi, double h, double *f);
static CNum4PartialDiff _cNum4PDE = {
    .FP_finiteDiffMethod = CNum4PartialDiff_doFiniteDiffMethod,
};
/**************************************/
/* InterFface部                       */
/**************************************/
/**************************************/
/* Class部                            */
/**************************************/
double* CNum4PartialDiff_finiteDiffMethod(int n, double *yi, double h, double *f)
{
    assert(f != 0);
    assert(yi != 0);
    assert( n > 0);

    return _cNum4PDE.FP_finiteDiffMethod(n, yi, h, f);
}
/**************************************/
/* 処理実行部                         */
/**************************************/
/*
 * 前進差分法
 */
static double* CNum4PartialDiff_doFiniteDiffMethod(int n, double *yi, double h, double *f)
{
    int i;
    double *yi_1 = malloc(sizeof(double) * n);

    assert(yi_1 != 0);
    // yi_1 = yi + h * f(xi, y)
    for (i = 0; i < n; i++) {
        yi_1[i] = yi[i] + h * f[i];
    }
    return yi_1;
}

