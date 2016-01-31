#ifndef FrameSaver_h 
#define FrameSaver_h

class FrameSaver {
public:
	FrameSaver() ;
		
	unsigned char *m_pixels;
	int m_record ;
	int m_frameCount ;
	int DumpPPM(int w, int h) ;
	void DumpPPM(FILE *fp,int w, int h) ;
	void StartRecord(int width) ;
	void Toggle(int width) ;
} ;


#endif