#ifndef _IMAGE_H

#ifdef WIN32
#include <windows.h>
#endif

#include <GL/gl.h>
#include <GL/glu.h>


class GL_Image2D {
public:
  GL_Image2D() { m_hasAlpha = 0 ; m_pixelSize = 3 ; m_width = 0 ; 
					m_height = 0 ; m_data = NULL ;} ;
  GL_Image2D(char *fname) { Read(fname) ; } ;
  GL_Image2D(int width, int height ) ;
  ~GL_Image2D() { if (m_data) delete []m_data; m_data = NULL ;} ;

  int m_width ;
  int m_height ;
  char m_fname[132] ;

  GLubyte *m_data ;
  
  int m_hasAlpha ; // does it have alpha channel
  int m_pixelSize ; // pixel size in bytes

  int Read(char *fname) ;
  int ReadPPM(char *fname) ;
  int ReadBMP(char *fname) ;
  int Write( FILE *fp ){ return 0;} ;
  int Write( char *fname) { return 0;};

  int SetAlpha(double alpha) ;

  void Draw(GLdouble x = 0, GLdouble  y = 0, GLdouble  z = 0.0, GLdouble w = 1.0 ) ;
} ; 


#endif




