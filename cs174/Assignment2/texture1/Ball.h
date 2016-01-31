/***** Ball.h *****/
#ifndef	_H_Ball
#define	_H_Ball

#ifndef	DLLENTRY
#ifdef WIN32
#define	DLLENTRY __declspec(dllexport)
#else
#define	DLLENTRY
#endif
#endif

#include <stdio.h>
#include "BallAux.h"

typedef	enum AxisSet{NoAxes, CameraAxes, BodyAxes, OtherAxes, NSets} AxisSet;
typedef	float *ConstraintSet;
typedef	struct {
    HVect center;
    double radius;
    Quat qNow, qDown, qDrag;
    HVect vNow,	vDown, vFrom, vTo, vrFrom, vrTo;
    HMatrix mNow, mDown;
    int	showResult, dragging;
    ConstraintSet sets[NSets];
    int	setSizes[NSets];
    AxisSet axisSet;
    int	axisIndex;
    HMatrix userAxes;
} BallData;

/* Public routines */
DLLENTRY void Ball_Init(BallData *ball,float *init_matrix=NULL);
DLLENTRY void Ball_Place(BallData *ball, HVect center, double radius);
DLLENTRY void Ball_Mouse(BallData *ball, HVect vNow);
void Ball_UseSet(BallData *ball, AxisSet axisSet);
void Ball_SetOtherAxes(BallData	*ball, HMatrix conAxis);
void Ball_ShowResult(BallData *ball);
void Ball_HideResult(BallData *ball);
DLLENTRY void Ball_Update(BallData *ball);
DLLENTRY void Ball_Value(BallData *ball, HMatrix mNow);
DLLENTRY void Ball_Quat(BallData *ball, float qNow[4]);
DLLENTRY void Ball_BeginDrag(BallData *ball);
DLLENTRY void Ball_BeginDragReset(BallData *ball);
DLLENTRY void Ball_EndDrag(BallData *ball);
void Ball_Draw(BallData	*ball);
/* Private routines */
void DrawAnyArc(HVect vFrom, HVect vTo);
void DrawHalfArc(HVect n);
void Ball_DrawConstraints(BallData *ball);
DLLENTRY void Ball_DrawDragArc(BallData	*ball);
void Ball_DrawResultArc(BallData *ball);
#endif
