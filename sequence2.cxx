#include "sequence2.h"
#include <algorithm>
#include <cassert>
#include <cstdlib>
using namespace std;

namespace main_savitch_4
{
    const sequence::size_type sequence::DEFAULT_CAPACITY; //Keeps default capacity of 30 constant

    //CONSTRUCTOR for the sequence class:
    sequence::sequence(size_type initial_capacity) //Default constructor: Sequence to be initialized as an empty sequence
    {
        data = new value_type[initial_capacity];
        complete_capacity = initial_capacity;
        used = 0;
    }

    sequence::sequence(const sequence& source) //Copy constructor: Creates copy of source sequence
    {
        data = new value_type[source.complete_capacity];
        complete_capacity = source.complete_capacity;
        used = source.used;
        copy(source.data, source.data + used, data);
        if(source.is_item())
        {
            current_index = source.current_index;
        }
    }

    sequence::~sequence() //Destructor: Releases dynamic memory 
    {
        delete [] data;
    }

    //MODIFICATION MEMBER FUNCTIONS for the sequence class:
    void sequence::resize(size_type new_capacity) //Changes sequence's current capacity to a new capacity
    {
        value_type *larger_array;
        if(new_capacity == complete_capacity)
        {
            return;
        }
        if(new_capacity < used)
        {
            new_capacity = used;
        }
        larger_array = new value_type[new_capacity];
        copy(data, data + used, larger_array);
        delete [] data;
        data = larger_array;
        complete_capacity = new_capacity;
    }

    void sequence::start() //First item in the sequence becomes the current item
    {
        current_index = 0;
    }

    void sequence::advance() //Goes to the next item in the sequence and that item becomes the current item
    {
        assert(is_item());
        current_index++;
    }

    void sequence::insert(const value_type& entry) //Adds an item before the current item
    {
        if(used == complete_capacity)
        {
            resize(complete_capacity+1);
        }
        if(!is_item())
        {
            current_index = 0;
        }
        size_type i;
        for(i = used; i > current_index; --i)
        {
            data[i] = data[i-1];
        }
        data[current_index] = entry;
        ++used;
    }

    void sequence::attach(const value_type& entry) //Adds an item after the current item
    {
        if (used == complete_capacity)
        {
            resize(complete_capacity+1);
        }
        if(!is_item())
        {
            current_index = used-1;
        }
        current_index++;
        size_type i;
        for(i = used; i > current_index; --i)
        {
            data[i] = data[i-1];
        }
        data[current_index] = entry;
        ++used;
    }

    void sequence::remove_current() //Removes the current item from the sequence and makes the item after the current item
    {
        assert(is_item());
        size_type i;
        for(i = current_index; i<used-1; ++i)
        {
            data[i] = data[i+1];
        }
        --used;
    }

    void sequence::operator=(const sequence& source) //Operator overloading = operator
    {
        value_type *new_data;
        if(this == &source)
        {
            return;
        }
        if(complete_capacity != source.complete_capacity)
        {
            new_data = new value_type[source.complete_capacity];
            delete [] data;
            data = new_data;
            complete_capacity = source.complete_capacity;
        }
        used = source.used;
        copy(source.data, source.data + used, data);
        if(source.is_item())
        {
            current_index = source.current_index;
        }
        else
        {
            current_index = used;
        }
    }

    //CONSTANT MEMBER FUNCTIONS for the sequence class:
    sequence::size_type sequence::size() const //Returns the number of items in the sequence
    {
        return used;
    }

    bool sequence::is_item() const //Checks if a current valid item can be received if called by current function
    {
        return(current_index < used && current_index >= 0); //Returns true if there is a current valid item, false if there isn't
    }

    sequence::value_type sequence::current() const //Returns the value of the current item in the sequence
    {
        assert(is_item());
        return data[current_index];
    }
}
