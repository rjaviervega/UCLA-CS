#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "image.h"

unsigned short getShort(FILE *fp) //helper function
{ //BMP format uses little-endian integer types
  // get a 2-byte integer stored in little-endian form
		char ic;
		unsigned short ip;
		fread(&ic,1,1,fp) ; ip = ic;  //first byte is little one 
		fread(&ic,1,1,fp);  ip |= ((unsigned short)ic << 8); // or in high order byte
		return ip;
}
//<<<<<<<<<<<<<<<<<<<< getLong >>>>>>>>>>>>>>>>>>>
unsigned long getLong(FILE *fp) //helper function
{  //BMP format uses little-endian integer types
   // get a 4-byte integer stored in little-endian form
		unsigned long ip = 0;
		char ic = 0;
		unsigned char uc = ic;
		fread(&ic,1,1,fp); uc = ic; ip = uc;
		fread(&ic,1,1,fp); uc = ic; ip |=((unsigned long)uc << 8);
		fread(&ic,1,1,fp); uc = ic; ip |=((unsigned long)uc << 16);
		fread(&ic,1,1,fp); uc = ic; ip |=((unsigned long)uc << 24);
		return ip;
	}


int getHeaderPPM(FILE *fp, int *x, int *y) ;

GL_Image2D::GL_Image2D(int width, int  height)
{
    m_data = new GLubyte [width*height*3] ;
    if ( m_data == NULL )
    {
	fprintf(stderr, "GL_Image2D: Cannot allocate memory.") ;
	return ;
    }

    m_width = width ;
    m_height = height ;
}

int GL_Image2D::Read(char *fname)
{
   int res ;
   if( (res = ReadBMP(fname)) < 1 )
   {
	   res = ReadPPM(fname) ;
   }
   
   
   if (res > 0 )
	   strcpy(m_fname, fname) ;
   else
	   fprintf(stderr,"GL_Image2D::Read: unknown file format %s.", fname) ;
   return res ;
}

int GL_Image2D::ReadPPM(char *fname) 
{
	FILE *fp = fopen(fname, "r") ;

	if( fp == NULL )
	{
		fprintf(stderr, "ReadPPM: Cannot open %s.\n", fname) ;
		return 0 ;
	}
    // read the header

    int x,y ;
    if( getHeaderPPM(fp, &x, &y) == -1 )
    {
	fprintf(stderr,"loadPPM: Error reading file.") ;
	fclose(fp) ;
	return 0 ;
    }

    if( x * y > 10000000 )
    {
	fprintf(stderr,"GL_Image2D::ReadPPM: File too big.") ;
	fclose(fp) ;
	return 0 ;

    }

    // alocate image
    if((m_data = new GLubyte[x*y*3]) == NULL )
    {
	fprintf(stderr,"Not enough memory!\n") ;
	fclose(fp) ;
	return 0 ;
    }

    // read the image
    int	i,j;
    
    int count = 0 ;
    for( i = 0 ; i < x ; i++ )
    for( j = 0 ; j < y; j++)
    {

	if(feof(fp))	
	{
	    fprintf(stderr,"GL_Image2D::ReadPPM: unexpected end of file.") ;
		fclose(fp) ;
	    return 0 ;
	}
	else
	{
	    fread((void *) &m_data[count] , sizeof(GLubyte), 3, fp) ;
	    count += 3 ;
	}
    }
    
    m_width = x ;
    m_height = y ;
 
    return count ;
}


int getHeaderPPM(FILE *fp, int *x, int *y)
{ 
    char s[256] ;
    s[0] = '\0' ;

    fgets(s,100,fp) ;
    if( strncmp(s, "P6", 2) != 0 )
    {
	fprintf(stderr,"This file is not a P6.") ;
	return -1;
    }
    fgets(s,100,fp);
    if( sscanf(s, "%d %d", x, y) != 2 )
    {
	fprintf(stderr,"Wrong format expected <x> <y>.") ;
	return -1;
    }
    fgets(s,100,fp);
    int maxCol ;
    if( sscanf(s, "%d", &maxCol) != 1 )
    {
	fprintf(stderr,"Wrong format expected <maxCol>.") ;
	return -1;
    }
    return 1 ;
} 

void GL_Image2D::Draw(GLdouble x, GLdouble  y, GLdouble  z, GLdouble w)
{
    glRasterPos4d(x,y,z,w) ;
	if( m_pixelSize == 3)
		glDrawPixels(m_width,m_height,
			 GL_RGB,GL_UNSIGNED_BYTE,m_data);
	else if( m_pixelSize == 4 )
		glDrawPixels(m_width,m_height,
			 GL_RGBA,GL_UNSIGNED_BYTE,m_data);
	else
		fprintf(stderr, "Unsupported pixel size, must be 24 or 32.\n") ;
}


int GL_Image2D::ReadBMP(char *fname)
{  // Read into memory an RGB image from an uncompressed BMP file.
	// return 0 on failure, 1 on success

	FILE *fp = fopen(fname, "rb") ;
	if( fp == NULL )
	{
		fprintf(stderr, "ReadBMP: Cannot Open file %s\n", fname) ;
		return 0 ;
	}
	int k, row, col, numPadBytes, nBytesInRow;
	// read the file header information
	char ch1, ch2;
	if( fread(&ch1,1,1,fp) != 1 )
	{
		fprintf(stderr, "ReadBMP: Cannot read first byte.\n") ;
		fclose(fp) ;
		return 0 ;
	}
	if( fread(&ch2,1,1,fp) != 1 )
	{
		fprintf(stderr, "ReadBMP: Cannot read second byte.\n") ;
		fclose(fp) ;
		return 0 ;
	}

	if( (ch1 != 'B') && (ch1 != 'M'))
	{
		fprintf(stderr, "ReadBMP: %s is not a BMP.", fname) ;
		fclose(fp) ;
		return 0 ;
	}
	
	unsigned long fileSize =      getLong(fp);
	unsigned short reserved1 =    getShort(fp);    // always 0
	unsigned short reserved2= 	getShort(fp);     // always 0 
	unsigned long offBits =		getLong(fp); // offset to image - unreliable
	unsigned long headerSize =     getLong(fp);     // always 40
	unsigned long numCols =		getLong(fp); // number of columns in image
	unsigned long numRows = 		getLong(fp); // number of rows in image
	unsigned short planes=    	getShort(fp);      // always 1 
	unsigned short bitsPerPixel=   getShort(fp);    //8 or 24; allow 24 here
	unsigned long compression =    getLong(fp);      // must be 0 for uncompressed 
	unsigned long imageSize = 	getLong(fp);       // total bytes in image 
	unsigned long xPels =    	getLong(fp);    // always 0 
	unsigned long yPels =    	getLong(fp);    // always 0 
	unsigned long numLUTentries = getLong(fp);    // 256 for 8 bit, otherwise 0 
	unsigned long impColors = 	getLong(fp);       // always 0 
	if(bitsPerPixel != 24) 
	{ // error - must be a 24 bit uncompressed image
		fprintf(stderr, "%s is not a 24 bit/pixelimage, or is compressed!\n", fname);
		fclose(fp); return 0;
	} 
	//add bytes at end of each row so total # is a multiple of 4
	// round up 3*numCols to next mult. of 4
	nBytesInRow = ((3 * numCols + 3)/4) * 4;
	numPadBytes = nBytesInRow - 3 * numCols; // need this many
	numPadBytes = 0 ; // added by Petros 04/18/03
	m_height = numRows; // set class's data members
	m_width = numCols;

	m_data = new GLubyte [numRows * numCols*3]; //make space for array
	if(!m_data)
	{
		fprintf(stderr, "ReadBMP: out of memory.\n") ;
		fclose(fp) ;
		return 0 ;
	}
	
	long count = 0;
	char dum;
	for(row = 0; row < m_height ; row++) // read pixel values
	{
		for(col = 0; col < m_width ; col++)
		{
			char c[3];
			fread(c,1,3,fp) ; //read 3 bytes
			m_data[count++] = c[2] ; //c[0]; //place them in colors
			m_data[count++] = c[1] ; //c[1] ;
			m_data[count++] = c[0] ; 
		}
   		for(k = 0; k < numPadBytes ; k++) //skip pad bytes at row's end
			fread(&dum, 1,1,fp);
	}
	fclose(fp);
	return count ; // success
}

int GL_Image2D::SetAlpha(double	alpha)
{
	int count = 0, i ;
	if( m_hasAlpha != 1 )
	{
	
		GLubyte *temp = new GLubyte[m_width*m_height*(m_pixelSize+1)] ;
		if( temp == NULL )
		{
			fprintf(stderr, "SetAlpha: cannot allocate memory.") ;
			return -1 ;
		}

		// copy the data
		count = 0 ;
		for( i = 0 ; i < m_width*m_height*m_pixelSize ; i+= m_pixelSize)
		{			
			for( int j = 0 ; j < m_pixelSize; j++ )
				temp[count++] = m_data[i+j] ;
			count++ ;
		}

		// swap
		delete []m_data ;
		m_data = temp ;

		// set the new size
		m_pixelSize++;
		m_hasAlpha = 1 ;
	}

	// set the alpha, first transform it to an 8 byte integer
	int alpha_int =  (int) 255*alpha ;
	for( count = 0 ; count < m_width*m_height*m_pixelSize ; count += m_pixelSize )
	{			
		m_data[count-1] = alpha_int ;
	
	}
	return 1 ;

}