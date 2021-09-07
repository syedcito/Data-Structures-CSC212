#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <cassert>
#include "node1.h"
#include "sequence3.h"
using namespace std;

namespace main_savitch_5
{
    //CONSTRUCTORS AND DESTRUCTOR
    sequence::sequence() //Default constructor: sequence to be initialized as an empty sequence BIG O: O(5)
    {
        head_ptr = NULL;
        tail_ptr = NULL;
        cursor = NULL;
        precursor = NULL;
        many_nodes = 0;
    }

    sequence::sequence(const sequence& source) //Copy constructor: Creates copy of source sequence BIG O: O(3n+5)
    {
        many_nodes = source.size();
        list_copy(source.head_ptr,head_ptr,tail_ptr);
        cursor = head_ptr;
        precursor = NULL;
        node* move = source.head_ptr;
        while(move != NULL && move != source.cursor)
        {
            move = move->link();
            precursor = cursor;
            cursor = cursor->link();
        }
    }

    sequence::~sequence() //Destructor: Releases dynamic memory O(1)
    {
        list_clear(head_ptr);
    }

    //MODIFICATION MEMBER FUNCTIONS
    void sequence::start() //First item in the sequence becomes the current item O(2)
    {
        cursor = head_ptr;
        precursor = NULL;
    }

    void sequence::advance() //Goes to next item in the sequence and that item becomes the current item O(3)
    {
        assert(is_item());
        precursor = cursor;
        cursor = cursor->link();
    }

    void sequence::insert(const value_type& entry) //Adds an item before the current item O(3n+1)
    {
        if(!is_item())
        {
            list_head_insert(head_ptr, entry);
            precursor = NULL;
            cursor = head_ptr;
        }
        else
        {
            if(cursor == head_ptr)
            {
                list_head_insert(head_ptr, entry);
                cursor = head_ptr;
                precursor = NULL;
            }
            else
            {
                list_insert(precursor, entry);
                cursor = precursor->link();
            }
        }
        many_nodes++;
    }

    void sequence::attach(const value_type& entry) //Adds an item after the current item O(3n+1)
    {
        if(is_item())
        {
            list_insert(cursor, entry);
            precursor = cursor;
            cursor = cursor->link();
        }
        else
        {
            if(precursor == NULL)
            {
                list_head_insert(head_ptr, entry);
                cursor = head_ptr;
                precursor = NULL;
            }
            else
            {
                cursor = list_locate(head_ptr, list_length(head_ptr));
                list_insert(cursor, entry);
                cursor = precursor->link();
            }
        }
        many_nodes++;
    }

    void sequence::remove_current() //Removes the current item from the sequence and makes the item after the current item O(3n+2)
    {
        assert(is_item());
        if(precursor == NULL)
        {
            list_head_remove(head_ptr);
            cursor = head_ptr;
            precursor = NULL;
        }
        else
        {
            cursor = cursor->link();
            list_remove(precursor);
        }
        many_nodes--;
    }

    void sequence::operator= (const sequence& source) //Operator overloading = operator O(6n+5)
    {
        if(this == &source)
        {
            return;
        }
        list_clear(head_ptr);
        list_copy(source.head_ptr, head_ptr, tail_ptr);
        many_nodes = source.size();
        cursor = head_ptr;
        precursor = NULL;
        node* move = source.head_ptr;
        while(move != NULL && move != source.cursor)
        {
            move = move->link();
            precursor = cursor;
            cursor = cursor->link();
        }
    }

    //CONSTANT MEMBER FUNCTIONS
    size_t sequence::size() const //Returns the number of items in the sequence O(1)
    {
        return many_nodes;
    }

    bool sequence::is_item() const //Checks if a current valid item can be received if called by the current function O(1)
    {
        return (cursor != NULL && size() > 0);
    }

    sequence::value_type sequence::current() const //Returns the value of the current item in the sequence O(2)
    {
        assert(is_item());
        return cursor->data();
    }
}