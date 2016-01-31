#include "raytrace.h"


void invert_matrix (double A[4][4], double Ainv[4][4]);
void adjoint( double in[4][4], double out[4][4] );
double det4x4( double m[4][4] );
double det3x3( double a1, double a2, double a3, double b1, double b2, double b3, double c1, 
			  double c2, double c3 );
double det2x2( double a, double b, double c, double d);




/*------------------------------------------------------*/
/*
 * Invert a 4x4 matrix.  Changed slightly from Richard Carling's code
 * in "Graphics Gems I".
 */

#define SMALL_NUMBER    1.e-8
void invert_matrix (double A[4][4], double Ainv[4][4]) {
  int i, j;
  double det ;

  adjoint( A, Ainv );

  det = det4x4( A );

  if ( fabs( det ) < SMALL_NUMBER) {
    fprintf(stderr,"invert_matrix: matrix is singular!");
    return;
  }

  for (i=0; i<4; i++)
    for(j=0; j<4; j++)
      Ainv[i][j] = Ainv[i][j] / det;
}

void adjoint( double in[4][4], double out[4][4] ) {
  double a1, a2, a3, a4, b1, b2, b3, b4;
  double c1, c2, c3, c4, d1, d2, d3, d4;


  a1 = in[0][0]; b1 = in[0][1]; 
  c1 = in[0][2]; d1 = in[0][3];

  a2 = in[1][0]; b2 = in[1][1]; 
  c2 = in[1][2]; d2 = in[1][3];

  a3 = in[2][0]; b3 = in[2][1];
  c3 = in[2][2]; d3 = in[2][3];

  a4 = in[3][0]; b4 = in[3][1]; 
  c4 = in[3][2]; d4 = in[3][3];

  out[0][0]  =   det3x3( b2, b3, b4, c2, c3, c4, d2, d3, d4);
  out[1][0]  = - det3x3( a2, a3, a4, c2, c3, c4, d2, d3, d4);
  out[2][0]  =   det3x3( a2, a3, a4, b2, b3, b4, d2, d3, d4);
  out[3][0]  = - det3x3( a2, a3, a4, b2, b3, b4, c2, c3, c4);
        
  out[0][1]  = - det3x3( b1, b3, b4, c1, c3, c4, d1, d3, d4);
  out[1][1]  =   det3x3( a1, a3, a4, c1, c3, c4, d1, d3, d4);
  out[2][1]  = - det3x3( a1, a3, a4, b1, b3, b4, d1, d3, d4);
  out[3][1]  =   det3x3( a1, a3, a4, b1, b3, b4, c1, c3, c4);
        
  out[0][2]  =   det3x3( b1, b2, b4, c1, c2, c4, d1, d2, d4);
  out[1][2]  = - det3x3( a1, a2, a4, c1, c2, c4, d1, d2, d4);
  out[2][2]  =   det3x3( a1, a2, a4, b1, b2, b4, d1, d2, d4);
  out[3][2]  = - det3x3( a1, a2, a4, b1, b2, b4, c1, c2, c4);
        
  out[0][3]  = - det3x3( b1, b2, b3, c1, c2, c3, d1, d2, d3);
  out[1][3]  =   det3x3( a1, a2, a3, c1, c2, c3, d1, d2, d3);
  out[2][3]  = - det3x3( a1, a2, a3, b1, b2, b3, d1, d2, d3);
  out[3][3]  =   det3x3( a1, a2, a3, b1, b2, b3, c1, c2, c3);
}

double det4x4( double m[4][4] ) 
{
  double ans;
  double a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4;
 

  a1 = m[0][0]; b1 = m[0][1]; 
  c1 = m[0][2]; d1 = m[0][3];

  a2 = m[1][0]; b2 = m[1][1]; 
  c2 = m[1][2]; d2 = m[1][3];

  a3 = m[2][0]; b3 = m[2][1]; 
  c3 = m[2][2]; d3 = m[2][3];

  a4 = m[3][0]; b4 = m[3][1]; 
  c4 = m[3][2]; d4 = m[3][3];

  ans = a1 * det3x3( b2, b3, b4, c2, c3, c4, d2, d3, d4)
    - b1 * det3x3( a2, a3, a4, c2, c3, c4, d2, d3, d4)
    + c1 * det3x3( a2, a3, a4, b2, b3, b4, d2, d3, d4)
    - d1 * det3x3( a2, a3, a4, b2, b3, b4, c2, c3, c4);
  return ans;
}

//double det3x3( a1, a2, a3, b1, b2, b3, c1, c2, c3 )
  //   double a1, a2, a3, b1, b2, b3, c1, c2, c3;
double det3x3( double a1, double a2, double a3, double b1, double b2, double b3, double c1, 
			  double c2, double c3 )
{
  double ans;

  ans = a1 * det2x2( b2, b3, c2, c3 )
    - b1 * det2x2( a2, a3, c2, c3 )
    + c1 * det2x2( a2, a3, b2, b3 );
  return ans;
}

//double det2x2( a, b, c, d)
  //   double a, b, c, d; 
double det2x2( double a, double b, double c, double d)
{
  double ans;
  ans = a * d - b * c;
  return ans;
}
