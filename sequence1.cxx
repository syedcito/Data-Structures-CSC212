#include<cstdlib>
#include<iostream>
#include "sequence1.h"
using namespace std;

namespace main_savitch_3 {
	
	 sequence::sequence( ){
	 	used = 0;
	 	current_index = 0;
	 }

	 void sequence::start( ){
	 	current_index = 0;
	 	}

	 void sequence::advance( ){
	 	if(is_item()){
	 		current_index++; 
	 	}
	 }

	 void sequence::insert(const value_type& entry) {
        assert(size()<CAPACITY);
        size_type i;
        if(!is_item()){
            current_index = 0;
        }
        for(i = used; i > current_index; --i){
            data[i] = data[i-1];
        }
        data[current_index] = entry;
        used++;
    }

    void sequence::attach(const value_type& entry) {
        assert(size()<CAPACITY);
        size_type i;
        for(i = used; i > current_index; --i){
            if(i == current_index+1){
                current_index++;
            }
            data[i] = data[i-1];
        }
        data[current_index] = entry;
        ++used;
    }

    void sequence::remove_current() {
        size_type i;
        assert(is_item());
        for(i = current_index+1; i<used; ++i)
        {
            data[i-1] = data[i];
        }
        --used;
    }
	 
	 sequence::size_type sequence::size( ) const {
	 	return used;
	 }

	 bool sequence::is_item( ) const{
        return(current_index < used); 
	 	}

	 
	 sequence::value_type sequence::current( ) const{
	 	assert(is_item());
	 	return data[current_index];
	}
}
