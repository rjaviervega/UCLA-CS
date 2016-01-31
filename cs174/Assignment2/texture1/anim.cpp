////////////////////////////////////////////////////
// anim.cpp
// Example of texture mapping
////////////////////////////////////////////////////

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

#include "image.h"
#include "Ball.h"


GL_Image2D Img("img0048_2.bmp") ;
//GL_Image2D Img("wood.bmp") ;
//GL_Image2D Img("floor4.bmp") ;


BallData *Arcball = NULL ;
int Perspective = 1 ;
int Width = 640 ;
int Height = 480 ;
int Button = -1 ;

double DA = 0 ;
double TA = 0 ;

int Animate = 0 ;


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

//
// The eye point and look-at point.
//
double eye[3] = {1.5, 2.0, 25.0};
double ref[3] = {0.0, 0.0, 0.0};

//
// The four degrees of freedom.
// The angles are given in degrees, not radians.
//

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
//          and centered around the origin.
// 
// Don't change.
//////////////////////////////////////////////////////

void drawSphere(void)
{ 
	glutSolidSphere(1.0, 50, 50) ;
}

void initTexture(void)
{
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LEQUAL);

   
	glTexImage2D(GL_TEXTURE_2D, 0, 3, Img.m_width, 
        Img.m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, 
        Img.m_data);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER,
        GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, 
        GL_NEAREST);
    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
	
    glEnable(GL_TEXTURE_2D);
   
}


void drawTexturedPlane(void)
{
	/* ... other matrix manipulations ... */
	glMatrixMode(GL_MODELVIEW); /* back to modelview mode */
	
	glTexImage2D(GL_TEXTURE_2D, 0, 3, Img.m_width, 
        Img.m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, 
        Img.m_data);
	glMatrixMode(GL_TEXTURE); /* enter texture matrix mode */
	glPushMatrix() ;
	glRotatef(TA,0,0,1); 
	/* ... other matrix manipulations ... */
	
	glBegin(GL_QUADS) ;
	set_colour(0.5,0,0) ;
    glTexCoord2f(0.0, 0.0); glVertex3f(-1.0, -1.0, 0.0);
    glTexCoord2f(0.0, 1.0); glVertex3f(-1.0, 1.0, 0.0);
    glTexCoord2f(1.0, 1.0); glVertex3f(1.44121, 1.0, 0);
    glTexCoord2f(1.0, 0.0); glVertex3f(1.41421, -1.0,0);
    glEnd();

	glMatrixMode(GL_TEXTURE); /* enter texture matrix mode */
	glPopMatrix()  ;

	glMatrixMode(GL_MODELVIEW); /* back to modelview mode */
	glPopMatrix() ;

}

void drawTexturedPlane_1(void)
{
	/* ... other matrix manipulations ... */
	glMatrixMode(GL_MODELVIEW); /* back to modelview mode */
	
	glTexImage2D(GL_TEXTURE_2D, 0, 3, Img.m_width, 
        Img.m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, 
        Img.m_data);
	glMatrixMode(GL_TEXTURE); /* enter texture matrix mode */
	glPushMatrix() ;
//	glRotatef(DA,0,0,1); 
	/* ... other matrix manipulations ... */
	double t = 1-fabs(TA) ;
	glBegin(GL_QUADS) ;
	set_colour(0.5,0,0) ;
    glTexCoord2f(0.0+t, 0.0+t); glVertex3f(-1.0, -1.0, 0.0);
    glTexCoord2f(0.0+t, 1.0-t); glVertex3f(-1.0, 1.0, 0.0);
    glTexCoord2f(1.0-t, 1.0-t); glVertex3f(1.44121, 1.0, 0);
    glTexCoord2f(1.0-t, 0.0+t); glVertex3f(1.41421, -1.0,0);
    glEnd();

	glMatrixMode(GL_TEXTURE); /* enter texture matrix mode */
	glPopMatrix()  ;

	glMatrixMode(GL_MODELVIEW); /* back to modelview mode */
	glPopMatrix() ;

}

void drawTexturedPlane_2(void)
{
	/*  planes for texture coordinate generation  */
static GLfloat xequalzero[] = {1.0, 0.0, 0.0, 0.0};
static GLfloat yequalzero[] = {0.0, 1.0, 0.0, 0.0};
static GLfloat slanted[] = {1.0, 1.0, 1.0, 0.0};
static GLfloat *currentCoeff;
static GLenum currentPlane;
static GLint currentGenMode;

	glTexImage2D(GL_TEXTURE_2D, 0, 3, Img.m_width, 
        Img.m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, 
        Img.m_data);
	 glEnable(GL_TEXTURE_GEN_S);
	  glEnable(GL_TEXTURE_GEN_T);
	   glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
   currentCoeff = xequalzero;
 // currentCoeff = slanted ;
   currentGenMode = GL_OBJECT_LINEAR;
   currentPlane = GL_OBJECT_PLANE;
   glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, currentGenMode);
   glTexGenfv(GL_S, currentPlane, currentCoeff);
	glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, currentGenMode);
	currentCoeff = yequalzero;
//	currentCoeff = slanted ;
   glTexGenfv(GL_T, currentPlane, currentCoeff);
	
	glutSolidSphere(2.0,100,100) ;
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
//    PROC: glut_key_action()
//    DOES: this function gets caled for any keypresses
// 
// Don't change.
//////////////////////////////////////////////////////

void glut_key_action(unsigned char key, int x, int y)
{
	switch (key) {
		case 'q':
		case 27:
			exit(0); 
		case 's':
			save_image();
			break;
		case ' ':
			resetArcball() ;
			glutPostRedisplay() ;
			break ;
		case 'a': // togle animation
			Animate = 1 - Animate ;
			break ;
		case 't':
			glEnable(GL_TEXTURE_2D) ;
			break ;
		case 'T':
			glDisable(GL_TEXTURE_2D) ;
			break ;
		case 'd':
			 glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
			 break ;
		case 'm':
			  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
			  break ;
		case 'b':
			   glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_BLEND);
			   break ;
		case 'r':
			   glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
			   glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
			   break ;
		case 'c':
			   glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
			   glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
			   break ;
		case 'h':
		case '?':
			instructions();
			break;
	}
	glutPostRedisplay() ;
	
}

/////////////////////////////////////////
//	PROC:	save_image
//	DOES:	saves the current image to a ppm file
//
// Don't change
/////////////////////////////////////////

void save_image() {
  FILE *fp;
  STR fname;
  const int maxVal=255;
  register int y;
  unsigned char *pixels;

  strcpy(fname,"scene.ppm");
  printf("Saving image %s: %d x %d\n", fname,Width,Height);
  fp = fopen(fname,"wb");
  if (!fp) {
	printf("Unable to open file '%s'\n",fname);
	return;
  }
  fprintf(fp, "P6\n");
  fprintf(fp, "%d %d\n", Width, Height);
  fprintf(fp, "%d\n", maxVal);

  pixels = new unsigned char [3*Width];
  for ( y = Height-1; y>=0; y-- ) {
	glReadPixels(0,y,Width,1,GL_RGB,GL_UNSIGNED_BYTE, (GLvoid *) pixels);
	fwrite(pixels, 3, Width, fp);
  }
  fclose(fp);
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
    GLfloat position[] = { -3.0, 3.0, 3.0, 0.0 };
    
    GLfloat lmodel_ambient[] = { 0.2f, 0.2f, 0.2f, 1.0f };
    GLfloat local_view[] = { 0.0 };

       /**** set lighting parameters ****/
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse);
    glLightfv(GL_LIGHT0, GL_POSITION, position);
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, lmodel_ambient);
    glLightModelfv(GL_LIGHT_MODEL_LOCAL_VIEWER, local_view);

/*    glFrontFace (GL_CW); */
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_AUTO_NORMAL);
    glEnable(GL_NORMALIZE);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);

	initTexture() ;
	
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
  float specular = 0.4f;
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
    glMaterialf (GL_FRONT, GL_SHININESS, 0.5);
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
	glClearColor(1.0f,1.0f,1.0f,1.0f);   /* set the background colour */
	/* OK, now clear the screen with the background colour */
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_MODELVIEW) ;
	glLoadIdentity();


	 HMatrix arcball_rot;
	 Ball_Value(Arcball,arcball_rot);
	 glMultMatrixf((float *)arcball_rot);

	 drawTexturedPlane() ;


//	Ball_Draw(Arcball);

	glutSwapBuffers();
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
  
  glOrtho(-2.5,2.5,-2.5,2.5,-6,10) ;

}


void instructions() {
  printf("Press:\n");
  printf("  s to save the image\n");
  printf("  q to quit.\n");
}

void idleCB(void)
{
	if( Animate == 1 )
	{
		DA += 1 ;
		TA = 90*sin(DA*2*3.14) ;
		glutPostRedisplay() ;
	}
	return ;

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
  glutInitWindowSize(600,600);
  glutCreateWindow(argv[0]);

  myinit();

  glutIdleFunc(idleCB) ;
  glutReshapeFunc (myReshape);
  glutKeyboardFunc( glut_key_action );
  glutMouseFunc(myMouse) ;
  glutMotionFunc(myMotion) ;
  instructions();

  glutDisplayFunc(display);
  glutMainLoop();
  return 0;         // never reached
}
