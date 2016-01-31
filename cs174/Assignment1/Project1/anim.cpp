// vega 003-110-717


////////////////////////////////////////////////////
// anim.cpp
// Template code for drawing an articulated figure.
// CS 174A Fall 2004
////////////////////////////////////////////////////


/*

Student Name: Roberto Javier Vega
SID: 003-110-717
Date: 10/25/2004

	Assignment #1
	=============

	This program implements a visual copy of the sample anim.exe given 
	to the class. 

	The program performs the animation of the object using variables
	that count the time elapsed to calculate the new position of the
	object. 

	There are 3 basic types of animations:
		1- Fish Body
		2- Fish Tail
		3- Sea Weed

	Temporay vaibles declared bellow are used to set each one of the
	visual motions.


	The drawing of the objects is composed of 2 funtions:
		- Draw_Sea_Weed
		- Draw_Fish

	Each one of the is used to draw the respective object.

	The sea weed fucntion is used 3 times on the picture
	at different coordinates to create the illusion of syncronic
	motion.

*/

#ifdef WIN32
#include <windows.h>
#endif


#include <GL/gl.h>
#include <GL/glu.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef WIN32
#include <GL/glut.h>
#endif

#ifdef WIN32
#include "GL/glut.h"
#endif

#include "Ball.h"
#include "FrameSaver.h"
#include "Timer.h"

FrameSaver FrSaver ;
Timer TM ;

BallData *Arcball = NULL ;
int Perspective = 1 ;
int Width = 480 ;
int Height = 480 ;
int Button = -1 ;

int Animate = 0 ;
int Recording = 0 ;

void resetArcball() ;
void save_image();
void instructions();
void set_colour(float r, float g, float b) ;

const int STRLEN = 100;
typedef char STR[STRLEN];

#define PI 3.1415926535897
#define X 0
#define Y 1
#define Z 2

                                                                                                                                                                                                                                                                                                                                             // The eye point and look-at point.
//
double eye[3] = {0, 0.0, 50.0};
double ref[3] = {0.0, 0.0, 0.0};

double TIME = 0.0 ;

// Vars to store direction changes
int Direction = 1;
int Direction2 = 1;
int Direction3 = 1;

int Time_Count = 0;
int Time_Count2 = 0;
float Count;
int Count3;
float Time_2 = 0;			// Counting temp vars

float weed_angle = 0;		// Angle of rotation
float weed_pos = 0;			// Position of Weed 
float tale_angle = 0;		// tail angle of rotation

void Draw_Moving_Sea_Weed(float init_x, float init_y, float x, float y);
void Draw_Fish();

/////////////////////////////////////////////////////
//    PROC: drawCylinder()
//    DOES: this function 
//			render a solid cylinder  oriented along the Z axis. Both bases are of radius 1. 
//			The bases of the cylinder are placed at Z = 0, and at Z = 1.
//	 
//          
// Don't change.
//////////////////////////////////////////////////////
void drawCylinder(void)
{
	static GLUquadricObj *cyl = NULL ;
	if( cyl == NULL )
	{
		cyl = gluNewQuadric() ;
	}
	if( cyl == NULL )
	{
		fprintf(stderr,"Cannot allocate cylinder.\n") ;
		return ;
	}
	gluQuadricDrawStyle(cyl,GLU_FILL) ;
	gluQuadricNormals(cyl,GLU_SMOOTH) ;
	gluCylinder(cyl,1.0,1.0,1.0,10,10) ;
	
}

//////////////////////////////////////////////////////
//    PROC: drawCone()
//    DOES: this function 
//			render a solid cone oriented along the Z axis with base radius 1. 
//			The base of the cone is placed at Z = 0, and the top at Z = 1. 
//         
// Don't change.
//////////////////////////////////////////////////////
void drawCone(void)
{
	glutSolidCone(1,1,20,20) ;
}


//////////////////////////////////////////////////////
//    PROC: drawCube()
//    DOES: this function draws a cube with dimensions 1,1,1
//          centered around the origin.
// 
// Don't change.
//////////////////////////////////////////////////////

void drawCube(void)
{
	glutSolidCube(1.0) ;
}


//////////////////////////////////////////////////////
//    PROC: drawSphere()
//    DOES: this function draws a sphere with radius 1
//          centered around the origin.
// 
// Don't change.
//////////////////////////////////////////////////////

void drawSphere(void)
{ 
	glutSolidSphere(1.0, 50, 50) ;
}


// start or end interaction
void myMouse(int button, int state, int x, int y)
{
	Button = button ;
	if( Button == GLUT_LEFT_BUTTON && state == GLUT_DOWN )
	{
		HVect arcball_coords;
		arcball_coords.x = 2.0*(float)x/(float)Width-1.0;
		arcball_coords.y = -2.0*(float)y/(float)Height+1.0;
		Ball_Mouse(Arcball, arcball_coords) ;
		Ball_Update(Arcball);
		Ball_BeginDrag(Arcball);

	}
	if( Button == GLUT_LEFT_BUTTON && state == GLUT_UP )
	{
		Ball_EndDrag(Arcball);
		Button = -1 ;
	}
	
	// Tell the system to redraw the window
	glutPostRedisplay() ;
}

// interaction (mouse motion)
void myMotion(int x, int y)
{
	if( Button == GLUT_LEFT_BUTTON )
	{
		HVect arcball_coords;
		arcball_coords.x = 2.0*(float)x/(float)Width - 1.0 ;
		arcball_coords.y = -2.0*(float)y/(float)Height + 1.0 ;
		Ball_Mouse(Arcball,arcball_coords);
		Ball_Update(Arcball);
		glutPostRedisplay() ;
	}
}

void resetArcball()
{
	Ball_Init(Arcball);
	Ball_Place(Arcball,qOne,0.75);
}


//////////////////////////////////////////////////////
//    PROC: myKey()
//    DOES: this function gets caled for any keypresses
// 
//////////////////////////////////////////////////////

void myKey(unsigned char key, int x, int y)
{
	float time ;
	switch (key) {
		case 'q':
		case 27:
			exit(0); 
		case 's':
			FrSaver.DumpPPM(Width,Height) ;
			break;
		case 'r':
			resetArcball() ;
			glutPostRedisplay() ;
			break ;
		case 'a': // togle animation
			Animate = 1 - Animate ;
			// reset the timer to point the current time		
			time = TM.GetElapsedTime() ;
			TM.Reset() ;
			// printf("Elapsed time %f\n", time) ;
			break ;
		case '0':
			//reset your object
			Direction = 1;
			Direction2 = 1;
			Direction3 = 1;

			Time_Count = 0;
			Time_Count2 = 0;
			Count = 0;
			Count3 = 0;
			Time_2 = 0;			// Counting temp vars

			weed_angle = 0;		// Angle of rotation
			weed_pos = 0;			// Position of Weed 
			tale_angle = 0;		// tail angle of rotation
			break ;
		case 'm':
			if( Recording == 1 )
			{
				printf("Frame recording disabled.\n") ;
				Recording = 0 ;
			}
			else
			{
				printf("Frame recording enabled.\n") ;
				Recording = 1  ;
			}
			FrSaver.Toggle(Width);
			break ;
		case 'h':
		case '?':
			instructions();
			break;
	}
	glutPostRedisplay() ;
	
}


/*********************************************************
    PROC: myinit()
    DOES: performs most of the OpenGL intialization
     -- change these with care, if you must.
**********************************************************/

void myinit(void)
{
    GLfloat ambient[] = { 0.2, 0.2, 0.2, 1.0 };
    GLfloat diffuse[] = { 1.0, 1.0, 1.0, 1.0 };
    GLfloat specular[] = { 1.0, 1.0, 1.0, 1.0 };
    //GLfloat position[] = { -3.0, 3.0, 3.0, 0.0 };
	GLfloat position[] = { 0.0, 0.0, 3.0, 1.0 };
    
    GLfloat lmodel_ambient[] = { 0.2f, 0.2f, 0.2f, 1.0f };
    GLfloat local_view[] = { 0.0 };

       /**** set lighting parameters ****/
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse);
    glLightfv(GL_LIGHT0, GL_POSITION, position);
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, lmodel_ambient);
    glLightModelfv(GL_LIGHT_MODEL_LOCAL_VIEWER, local_view);
	glLightModeli(GL_LIGHT_MODEL_TWO_SIDE,GL_TRUE) ;

/*    glFrontFace (GL_CW); */
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_AUTO_NORMAL);
    glEnable(GL_NORMALIZE);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);

	glPixelStorei(GL_PACK_ALIGNMENT,1) ;
	glPixelStorei(GL_UNPACK_ALIGNMENT,1) ;
	glShadeModel(GL_SMOOTH) ;

	Arcball = new BallData ;
	Ball_Init(Arcball);
	Ball_Place(Arcball,qOne,0.75);


}

/*********************************************************
    PROC: set_colour();
    DOES: sets all material properties to the given colour
    -- don't change
**********************************************************/

void set_colour(float r, float g, float b)
{
  float ambient = 0.2f;
  float diffuse = 0.7f;
  float specular = 1.4f;
  GLfloat mat[4];
      /**** set ambient lighting parameters ****/
    mat[0] = ambient*r;
    mat[1] = ambient*g;
    mat[2] = ambient*b;
    mat[3] = 1.0;
    glMaterialfv (GL_FRONT, GL_AMBIENT, mat);

      /**** set diffuse lighting parameters ******/
    mat[0] = diffuse*r;
    mat[1] = diffuse*g;
    mat[2] = diffuse*b;
    mat[3] = 1.0;
    glMaterialfv (GL_FRONT, GL_DIFFUSE, mat);

      /**** set specular lighting parameters *****/
    mat[0] = specular*r;
    mat[1] = specular*g;
    mat[2] = specular*b;
    mat[3] = 1.0;
    glMaterialfv (GL_FRONT, GL_SPECULAR, mat);
    glMaterialf (GL_FRONT, GL_SHININESS, 1);
}


/*********************************************************
**********************************************************
**********************************************************

    PROC: display()
    DOES: this gets called by the event handler to draw
          the scene, so this is where you need to build
	  your ROBOT --  
      
        MAKE YOUR CHANGES AND ADDITIONS HERE

    Add other procedures if you like.

**********************************************************
**********************************************************
**********************************************************/
void display(void)
{
	glViewport(0, 0, Width, Height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	//glFrustum(-5,5,-5,5,4,100);
	glOrtho(-6,6,-6,6,-500,500) ;

	glMatrixMode(GL_MODELVIEW) ;
	glLoadIdentity();

	eye[Z] = 8 ;
	gluLookAt (eye[X], eye[Y], eye[Z], ref[X], ref[Y], ref[Z], 0.0,1.0,0.0);

	HMatrix arcball_rot;
	Ball_Value(Arcball,arcball_rot);
	glMultMatrixf((float *)arcball_rot);
	glClearColor(0.1f,0.1f,1.0f,1.0f);  
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	// Start Drawing on the Screen:

	// Draw Floor - Scaled Cube
	set_colour(0.2,0.2,0.08) ;
	glPushMatrix() ; 
	glTranslatef(0, -2.6, 0);
	glScalef(20, 0.5, 20);			// Scale cube to make flor like image
	drawCube() ;
	glPopMatrix() ;

	// Draw Rocks -- Big
	set_colour(0.3,0.3,0.3) ;
	glPushMatrix();
	glScalef(0.5,0.5,0.5);
	glTranslatef(0,-3.71,0);
	drawSphere();
	glPopMatrix();

	// -- Small on the left
	set_colour(0.3,0.3,0.3) ;
	glPushMatrix();
	glScalef(0.26,0.26,0.26);
	glTranslatef(-3,-8.05,0);
	drawSphere();
	glPopMatrix();


	if( Animate == 1 )
	{
		// Set angle for rotation of See weed
		if ( weed_pos > 0.04 || weed_pos < -0.06 ) {
			Time_Count = 0;
			// Determines the direction of motion
			Direction = Direction * -1;		
		}									
		else {
			Time_Count++;
		}

		if ( Direction > 0 ) {
			weed_angle = weed_angle + TIME * 12;
			//weed_pos = weed_pos - 0.01;
			weed_pos = weed_pos - TIME/20;
		}
		else  {
			weed_angle = weed_angle - TIME * 12;
			//weed_pos = weed_pos + 0.01;
			weed_pos = weed_pos + TIME/20;
		}

		// Set angle for rotation of Fish Tale
		if ( Time_Count2 == 3 ) {
			Time_Count2 = 0;
			Direction2 = Direction2 * -1;
		}
		else {
			Time_Count2++;
		}
		if ( Direction2 > 0 ) {
			if ( tale_angle < 1 )
			tale_angle = tale_angle + TIME * 10;
		}
		else  {
			if ( tale_angle > -1 )
				tale_angle = tale_angle - TIME * 10;
		}
	}

		
	// Sead Weed on top of Rock
	Draw_Moving_Sea_Weed(0, -4.25, 0, 0); 			// Center Weed
	Draw_Moving_Sea_Weed(-5, -6.25, -0.5, -0.5); 	// Left Side Weed
	Draw_Moving_Sea_Weed(5, -6.25, 0.5, -0.5);		// Right Side Weed

	// Draw fish
	Draw_Fish();

	glutSwapBuffers();

	if( Recording == 1) FrSaver.DumpPPM(Width,Height) ;


}


void Draw_Fish()
{

	float Time3;

	// Function Matrix
	glPushMatrix();


	// Select Up and Down Direction
	if( Animate == 1 )
	{
		if ( Count > 0.6 ) Direction3 = -1;
		if ( Count < -1.2 ) Direction3 = 1;

		if ( Direction3 == -1 ) Count = Count - TIME;
		if ( Direction3 == 1 )  Count = Count + TIME;
	}


	// Set the position of the fish translation 
	glTranslatef( 0, Count, 0 );			// Up and Down

	
	if( Animate == 1 )
	{
		Time_2 = Time_2 + TIME;
	}
	glRotatef( 30 * Time_2, 0, -1, 0);				// Circular Motion

	glTranslatef ( 3, 0, 0);

	// Head
	set_colour(0.5,0.5,0.5) ;
	glPushMatrix();
	glScalef( 0.5, 0.5, 0.5);
	drawCone();
	glPopMatrix();
	//

	// Body
	glPushMatrix();
	glRotatef(180, 0, 1, 0);
	set_colour(0.5,0.15,0.15) ;
	glScalef( 0.5, 0.5, 2);
	drawCone();
	glPopMatrix();
	//

	//Eyes

	// Right Ball
	set_colour(1,1,1);			//White Part of Eye
	glPushMatrix();
	glTranslatef(0.2, 0.2, 0.2);
	glScalef( 0.1, 0.1, 0.1);
	drawSphere();
	glPopMatrix();

	// Left Ball
	glPushMatrix();
	glTranslatef(-0.2, 0.2, 0.2);
	glScalef(0.1,0.1,0.1);
	drawSphere();
	glPopMatrix();

	// Pups
	set_colour(0,0,0);			//Set Color = Black
	glPushMatrix();
	glTranslatef(0.2,0.2,0.35);
	glScalef(0.03,0.03,0.03);
	drawSphere();
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.2, 0.2, 0.35);
	glScalef(0.03,0.03,0.03);
	drawSphere();
	glPopMatrix();
	// Done Eyes and Body


	//Fish Tail
	//Gray Ball
	set_colour(.5,.5,.5);
	glPushMatrix();
	glTranslatef(0, 0, -2);
	glScalef(0.15,0.15,0.15);
	drawSphere();
	glPopMatrix();

	// Create motion of Fish


	// Cones Top
	set_colour(0.5,0.15,0.15) ;
	glPushMatrix();
	glTranslatef( 0, 0, -2);
	glRotatef( tale_angle * 10, 0, 1, 0);
	glRotatef(-135, 1, 0, 0);
	glScalef( 0.15, 0.15, 1);
	drawCone();
	glPopMatrix();

	// Bottom
	set_colour(0.5,0.15,0.15) ;
	glPushMatrix();
	glTranslatef( 0, 0, -2);
	glRotatef( tale_angle * 10, 0, 1, 0);
	glRotatef(135, 1, 0, 0);
	glScalef( 0.15, 0.15, 1);
	drawCone();
	glPopMatrix();
	//

	// Function Matrix
	glPopMatrix();
}

/*
	This function draws a set of 10 sea weeds with paramets where to start
	the sea weed X and Y possition and the distance between the sea weeds.

	The weeds are moved and redrawn using global values for setting the coordinates
	of the location and the new location with respect the previus sea weeds.

	The idea is to have this function call 3 times at diferent locations
	given the idea of similar motion with respect the adjacent sea weeds.
*/


void Draw_Moving_Sea_Weed(float init_x, float init_y, float x, float y)
{	
	// Draw Sea Weed -- Starting Points
	set_colour(0.15, 0.50, 0.15);

	// Weed 0
	glPushMatrix();
	glScalef(0.1, 0.25, 0.1);
	glTranslatef( init_x, init_y, 0);
	drawSphere();
	glPopMatrix();


	// Draw moving weed #1
	glPushMatrix();
	glTranslatef( weed_pos  + x, y, 0);
	glTranslatef(-0.044, -0.56, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef( 15, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #2
	glPushMatrix();
	glTranslatef( weed_pos * 2.2 + x, y, 0);
	glTranslatef(-0.17, -0.085, 0);
	glRotatef( weed_angle * 0.25, 0, 0, 1);
	glRotatef( 20, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #3
	glPushMatrix();
	glTranslatef( weed_pos * 2.8 + x, y, 0);
	glTranslatef(-0.234, 0.4, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef(-2, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #4
	glPushMatrix();
	glTranslatef( weed_pos * 3.4+ x, y, 0);
	glTranslatef(-0.18, 0.9, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef(-10, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #5
	glPushMatrix();
	glTranslatef( weed_pos * 3.6 + x, y, 0);
	glTranslatef(-0.18, 1.4, 0);
	glRotatef( weed_angle * 0.3, 0, 0, 1);
	glRotatef(10, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #6
	glPushMatrix();
	glTranslatef( weed_pos * 4 + x, y, 0);
	glTranslatef(-0.32, 1.84, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef(20, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #7
	glPushMatrix();
	glTranslatef( weed_pos * 5 + x, y, 0);
	glTranslatef(-0.4, 2.31, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef(-5, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #8
	glPushMatrix();
	glTranslatef( weed_pos * 6 + x, y, 0);
	glTranslatef(-0.35, 2.75, 0);
	glRotatef( weed_angle * 0.5, 0, 0, 1);
	glRotatef(-10, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();

	// Draw moving weed #9
	glPushMatrix();
	glTranslatef( weed_pos * 7 + x, y, 0);
	glTranslatef(-0.28, 3.25, 0);
	glRotatef( weed_angle * 0.9, 0, 0, 1);
	glRotatef(0, 0, 0, 1);		// Initial Rotation
	glScalef(0.1, 0.25, 0.1);
	drawSphere();
	glPopMatrix();
}


/**********************************************
    PROC: myReshape()
    DOES: handles the window being resized 
    
      -- don't change
**********************************************************/

void myReshape(int w, int h)
{
  Width = w;
  Height = h;

  glViewport(0, 0, w, h);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
     /*** this defines the field of view of the camera   ***/
     /*** Making the first 4 parameters larger will give ***/
     /*** a larger field of view, therefore making the   ***/
     /*** objects in the scene appear smaller            ***/
  // glFrustum(-1,1,-1,1,7,100);
  glOrtho(-6,6,-6,6,-500,500) ;
  //glOrtho(-6,6,-6,6,-500,500) ;
  //gluPerspective(20,(float) w/(float) h,1,100) ;
  //glFrustum(-1,1,-1,1,4,100);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
     /*** this sets the virtual camera          ***/
     /*** gluLookAt( x,y,z,   x,y,z   x,y,z );  ***/
     /***            camera  look-at camera-up  ***/
     /***            pos'n    point   vector    ***/
    
	 gluLookAt(eye[X],eye[Y],eye[Z],
	           ref[X],ref[Y],ref[Z], 0,1,0);
	 HMatrix arcball_rot;
	 Ball_Value(Arcball,arcball_rot);
	 glMultMatrixf((float *)arcball_rot);
}
void instructions() {
  printf("Press:\n");
  printf("  s to save the image\n");
  printf("  r to restore the original view.\n") ;
  printf("  0 to set it to the zero state.\n") ;
  printf("  a to toggle the animation.\n") ;
  printf("  m to toggle frame dumping.\n") ;
  printf("  q to quit.\n");
}

void idleCB(void)
{
	if( Animate == 1 )
	{
		 TM.Reset() ; // commenting out this will make the time run from 0
					// leaving 'Time' counts the time interval between successive calls to idleCB
		if( Recording == 0 )
			TIME = TM.GetElapsedTime() ;
		else
			TIME += 0.033 ; // save at 30 frames per second.
		printf("TIME %f\n", TIME) ;
		glutPostRedisplay() ; 
	}
}
/*********************************************************
     PROC: main()
     DOES: calls initialization, then hands over control
	   to the event handler, which calls 
	   display() whenever the screen needs to be redrawn
**********************************************************/

int main(int argc, char** argv) {
  
  glutInitDisplayMode (GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
  glutInitWindowPosition (0, 0);
  glutInitWindowSize(Width,Height);
  glutCreateWindow(argv[0]);

  myinit();

  glutIdleFunc(idleCB) ;
  glutReshapeFunc (myReshape);
  glutKeyboardFunc( myKey );
  glutMouseFunc(myMouse) ;
  glutMotionFunc(myMotion) ;
  instructions();

  glutDisplayFunc(display);
  glutMainLoop();

  TM.Reset() ;
  return 0;         // never reached
}




