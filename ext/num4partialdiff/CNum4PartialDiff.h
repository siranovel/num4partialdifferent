#ifndef _CNum4PartialDiff_H_
#define _CNum4PartialDiff_H_

/**************************************/
/* 構造体宣言                         */
/**************************************/
typedef struct _CNum4PartialDiff CNum4PartialDiff;

struct _CNum4PartialDiff
{
    double* (*FP_finiteDiffMethod)(int n, double *yi, double h, double *f);
};
/**************************************/
/* define宣言                         */
/**************************************/
/**************************************/
/* プロトタイプ宣言                   */
/**************************************/
double* CNum4PartialDiff_finiteDiffMethod(int n, double *yi, double h, double *f);
#endif
