// sorts the backing array in place and returns its view.
// an optional comparator returns negative, zero, or positive for ascending order.
quick_sort_ascending :: #bake_arguments quick_sort_in_order(descending = false);
quick_sort_descending :: #bake_arguments quick_sort_in_order(descending = true);

#scope_file

Sort :: #import "Sort";

quick_sort_in_order :: (
    array: [] $T,
    $descending: bool,
    $compare: (T, T) -> int = compare_ascending,
) -> [] T {
    #if descending {
        reversed_comparison :: (a: T, b: T) -> int {
            return compare(b, a);
        }
        return Sort.quick_sort(array, reversed_comparison);
    } else {
        return Sort.quick_sort(array, compare);
    }
}

/*
direct comparisons avoid integer subtraction overflow.

In the jai quicksort impl, a negative value means leave as is in the order of the array
therefore that explains the following procs return value.

*/

compare_ascending :: (a: $T, b: T) -> int {
    if a < b return -1;
    if a > b return 1;
    return 0;
}
