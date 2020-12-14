typedef long data_t;

struct vec
{
    long length;
    data_t* data;
};

typedef struct vec* vec_ptr;

long vec_length(vec_ptr x) {
    return x->length;
}

long* get_vec_start(vec_ptr x) {
    return x->data;
}