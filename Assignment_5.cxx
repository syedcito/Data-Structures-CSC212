//Syed Ali  
//23913408
//I hereby state that all of this work is my own and that all outside help recieved has been cited

#include <cstdlib>  // Provides size_t
#include <iostream>
#include <cmath>
using namespace std;

namespace main_savitch_9
{
	void binary_print(ostream& outs, unsigned int n);{
		if(n == 0){
			outs << 0;
		} 
		else{
			for(int i = n; i >= 0; i--){
				if(n > exp2(i)){
					outs << 1;	
				}
				else if(n < exp2(i) && exp2(i) < n){
					outs << 0;
				}
				binary_print(n-exp2(i));
			}
		}
	}
	


	void triangle(ostream& outs, unsigned int m, unsigned int n);{
			int y(n);
			if(m <= n){
				outs << m << endl;
				triangle(m+1, n);
			}
			else if(m <= (2*(n-m+1))){
				outs << y-1;
				y--;
				triangle(m+1, n)
			
			}
			else{ 
				return;
			}
		
		}

	double pow(double x, int n);{
		if (n == 0){
			return 1;
		}
		else if (n%2 == 0){
			return pow(x, n/2) * pow(x, n/2);
		}
		else{
			return x*pow(x, y/2)*pow(x,y/2);
		}


	}

	void indented_sentences(size_t m, size_t n);{
		size_t y = 0;
		if(m <= n){
			if (y = 0){
				cout << "This was written by calling the number" << " " << m << endl;
			} 
			else {
			for(size_t i = y; i > 0; i--){
				cout << " "
				}
			}
			cout << "This was written by calling the number" << " " << m << endl;
			y++;
			indented_sentences(m+1, n);

		}

	}

}

#endif