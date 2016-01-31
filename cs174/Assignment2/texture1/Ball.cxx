/***** Ball.c *****/
/* Ken Shoemake, 1993 */
/* Modified by Victor Ng, Jan. 1996 for	OpenGL */
#include <math.h>
#ifdef WIN32
#include <windows.h>
#endif
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdio.h>
#include "Ball.h"
#include "BallMath.h"

#ifndef	M_PI
#define	M_PI		3.14159265358979323846
#endif

#ifndef	WIN32
#ifndef	sinf
#define	sinf sin
#define	cosf cos
#endif
#endif

#define	FALSE 0
#define	TRUE 1

#define	LG_NSEGS 4
#define	NSEGS (1<<LG_NSEGS)
#define	RIMCOLOR()    glColor3f(0.0f, 1.0f, 1.0f);
#define	FARCOLOR()    glColor3f(0.8f, 0.5f, 0.0f);
#define	NEARCOLOR()   glColor3f(1.0f, 0.8f, 0.0f);
#define	DRAGCOLOR()   glColor3f(0.0f, 1.0f, 1.0f);
#define	RESCOLOR()    glColor3f(0.8f, 0.0f, 0.0f);

HMatrix	mId = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
float otherAxis[][4] = {{(float)-0.48, (float)0.80, (float)0.36, (float)1.0}};

/* Establish reasonable	initial	values for controller. */
void Ball_Init(BallData	*ball, float *init_matrix)
{
    int	i;
    ball->center = qOne;
    ball->radius = 1.0;
    ball->vDown	= ball->vNow = qOne;
    ball->qDown	= ball->qNow = qOne;
    for	(i=15; i>=0; i--) {
		if (init_matrix	== NULL) 
			((float *)ball->mNow)[i] = ((float *)ball->mDown)[i]	= ((float *)mId)[i];
		else 
			((float *)ball->mNow)[i] = ((float *)ball->mDown)[i]	= init_matrix[i];
		
	}

	// We must also set the qNow quaternion to correspond with the 
	// given initial rotation matrix.
	if (init_matrix) {
		Qt_ToQuat(ball->mNow,&(ball->qNow));
		ball->qDown = ball->qNow;
	}

	ball->showResult = ball->dragging =	FALSE;
    ball->axisSet = NoAxes;
    ball->sets[CameraAxes] = mId[X]; ball->setSizes[CameraAxes]	= 3;
    ball->sets[BodyAxes] = ball->mDown[X]; ball->setSizes[BodyAxes] = 3;
    ball->sets[OtherAxes] = otherAxis[X]; ball->setSizes[OtherAxes] = 1;
}

/* Set the center and size of the controller. */
void Ball_Place(BallData *ball,	HVect center, double radius)
{
    ball->center = center;
    ball->radius = radius;
}

/* Incorporate new mouse position. */
void Ball_Mouse(BallData *ball,	HVect vNow)
{
    ball->vNow = vNow;
}

/* Choose a constraint set, or none. */
void Ball_UseSet(BallData *ball, AxisSet axisSet)
{
    if (!ball->dragging) ball->axisSet = axisSet;
}

/* Set the OtherAxes for constraints. */
void Ball_SetOtherAxes(BallData	*ball, HMatrix conAxis)
{
     for (int i=0; i < 4; i++)
	 for (int j=0; j < 4; j++)
		ball->userAxes[i][j] = conAxis[i][j];
     ball->sets[OtherAxes] = ball->userAxes[X];
     ball->setSizes[OtherAxes] = 3;
}

/* Begin drawing arc for all drags combined. */
void Ball_ShowResult(BallData *ball)
{
    ball->showResult = TRUE;
}

/* Stop	drawing	arc for	all drags combined. */
void Ball_HideResult(BallData *ball)
{
    ball->showResult = FALSE;
}

/* Using vDown,	vNow, dragging,	and axisSet, compute rotation etc. */
void Ball_Update(BallData *ball)
{
    int	setSize	= ball->setSizes[ball->axisSet];
    HVect *set = (HVect	*)(ball->sets[ball->axisSet]);
    ball->vFrom	= MouseOnSphere(ball->vDown, ball->center, ball->radius);
    ball->vTo =	MouseOnSphere(ball->vNow, ball->center,	ball->radius);
    if (ball->dragging)	{
	if (ball->axisSet!=NoAxes) {
	    ball->vFrom	= ConstrainToAxis(ball->vFrom, set[ball->axisIndex]);
	    ball->vTo =	ConstrainToAxis(ball->vTo, set[ball->axisIndex]);
	}
	ball->qDrag = Qt_FromBallPoints(ball->vFrom, ball->vTo);
	ball->qNow = Qt_Mul(ball->qDrag, ball->qDown);
    } else {
	if (ball->axisSet!=NoAxes) {
	    ball->axisIndex = NearestConstraintAxis(ball->vTo, set, setSize);
	}
    }
    Qt_ToBallPoints(ball->qDown, &ball->vrFrom,	&ball->vrTo);
    Qt_ToMatrix(Qt_Conj(ball->qNow), ball->mNow); /* Gives transpose for GL. */
}

/* Return rotation matrix defined by controller	use. */
void Ball_Value(BallData *ball,	HMatrix	mNow)
{
    int	i;
    for	(i=15; i>=0; i--) ((float *)mNow)[i] = ((float *)ball->mNow)[i];
}

/* Return quaternion defined by controller use. */
void Ball_Quat(BallData *ball, float qNow[4])
{
	qNow[0] = ball->qNow.x;
	qNow[1] = ball->qNow.y;
	qNow[2] = ball->qNow.z;
	qNow[3] = ball->qNow.w;
}

/* Begin drag sequence.	*/
void Ball_BeginDrag(BallData *ball)
{
    ball->dragging = TRUE;
    ball->vDown	= ball->vNow;
}

/* Begin drag sequence.	*/
void Ball_BeginDragReset(BallData *ball)
{
    int	i;

    ball->dragging = TRUE;
    ball->vDown	= ball->vNow;

    // Set to Identity
    ball->qDown	= ball->qNow = qOne;
    for	(i=15; i>=0; i--)
       ((float *)ball->mNow)[i]	= ((float *)ball->mDown)[i] = ((float *)mId)[i];
}

/* Stop	drag sequence. */
void Ball_EndDrag(BallData *ball)
{
    int	i;
    ball->dragging = FALSE;
    ball->qDown	= ball->qNow;
    for	(i=15; i>=0; i--)
	((float	*)ball->mDown)[i] = ((float *)ball->mNow)[i];
}

/* Draw	the controller with all	its arcs. */
void Ball_Draw(BallData	*ball)
{
    float r = (float)ball->radius;
    float x = ball->center.x;
    float y = ball->center.y;

	glPushAttrib(GL_ENABLE_BIT);
	glDisable(GL_LIGHTING);

    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();

    // Must use	near and far clip planes at -1.0 and 1.0 or
    // risk clipping out the circle and	arcs drawn.
    glOrtho(-1.0,1.0,-1.0,1.0,-1.0,1.0);

    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    glScalef(r,r,r);
    glTranslatef(x/r,y/r,0.0); // Scale	for radius adjustment

    // Allows arcball constraints to be	shown properly over arcball
    glDisable(GL_DEPTH_TEST);

    RIMCOLOR();
    glBegin(GL_LINE_LOOP);
    for	(int i=0; i < 36; i++)
       glVertex3f(cosf((float)i*(float)(2.0*M_PI/36.0)),
		  sinf((float)i*(float)(2.0*M_PI/36.0)),0.0);
    glEnd();

    Ball_DrawResultArc(ball);
    Ball_DrawConstraints(ball);
    Ball_DrawDragArc(ball);

    glEnable(GL_DEPTH_TEST);

    glPopMatrix();
    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
	glPopAttrib();
    glMatrixMode(GL_MODELVIEW);
}

/* Draw	an arc defined by its ends. */
void DrawAnyArc(HVect vFrom, HVect vTo)
{
    int	i;
    HVect pts[NSEGS+1];
    double dot;
    pts[0] = vFrom;
    pts[1] = pts[NSEGS]	= vTo;
    for	(i=0; i<LG_NSEGS; i++) pts[1] =	V3_Bisect(pts[0], pts[1]);
    dot	= 2.0*V3_Dot(pts[0], pts[1]);
    for	(i=2; i<NSEGS; i++) {
	pts[i] = V3_Sub(V3_Scale(pts[i-1], (float)dot),	pts[i-2]);
    }
    glBegin(GL_LINE_STRIP);
    for	(i=0; i<=NSEGS;	i++) {
	   glColor3f((float)i/NSEGS,(float)i/NSEGS,(float)i/NSEGS);
	   glVertex3fv((float *)&pts[i]);
	}
    glEnd();
}

/* Draw	the arc	of a semi-circle defined by its	axis. */
void DrawHalfArc(HVect n)
{
    HVect p, m;
    p.z	= 0;
    if (n.z != 1.0) {
	p.x = n.y; p.y = -n.x;
	p = V3_Unit(p);
    } else {
	p.x = 0; p.y = 1;
    }
    m =	V3_Cross(p, n);
    DrawAnyArc(p, m);
    DrawAnyArc(m, V3_Negate(p));
}

/* Draw	all constraint arcs. */
void Ball_DrawConstraints(BallData *ball)
{
    ConstraintSet set;
    HVect axis;
    int	i, axisI, setSize = ball->setSizes[ball->axisSet];
    if (ball->axisSet==NoAxes) return;
    set	= ball->sets[ball->axisSet];
    for	(axisI=0; axisI<setSize; axisI++) {
	if (ball->axisIndex!=axisI) {
	    if (ball->dragging)	continue;
	    FARCOLOR();
	} else NEARCOLOR();
	axis = *(HVect *)&set[4*axisI];
	if (axis.z==1.0) {
	   glBegin(GL_LINE_LOOP);
	   for (i=0; i < 36; i++)
	      glVertex3f(cosf((float)i*float(2.0*M_PI/36.0)),sinf((float)i*(float)(2.0*M_PI/36.0)),0.0);
	   glEnd();
	} else {
	    DrawHalfArc(axis);
	}
    }
}

/* Draw	"rubber	band" arc during dragging. */
void Ball_DrawDragArc(BallData *ball)
{
    DRAGCOLOR();
    if (ball->dragging)	DrawAnyArc(ball->vFrom,	ball->vTo);
}

/* Draw	arc for	result of all drags. */
void Ball_DrawResultArc(BallData *ball)
{
    RESCOLOR();
    if (ball->showResult) DrawAnyArc(ball->vrFrom, ball->vrTo);
}
