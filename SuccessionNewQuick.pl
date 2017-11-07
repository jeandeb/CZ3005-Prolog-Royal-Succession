
% QUICKSORT, NEW RULES

offspring( ann, elizabeth ).
offspring( andrew, elizabeth ).
offspring( edward, elizabeth ).
offspring( charles, elizabeth ).

order( 1, charles ).
order( 2, ann ).
order( 3, andrew ).
order( 4, edward ).

higher_rank( X, Y ) :-
	order( Nx, X ), order( Ny, Y ), Nx < Ny.


rank_successors( List, Sorted ) :- q_sort( List, [], Sorted ).

q_sort( [], Acc, Acc ).

q_sort( [H|T], Acc, Sorted ) :-
	pivoting( H, T, L1, L2 ),
	q_sort( L1, Acc, Sorted1 ), q_sort( L2, [H|Sorted1], Sorted ).

pivoting(H,[],[],[]).
pivoting( H, [X|T], [X|L], G ) :- not(higher_rank( X, H )), pivoting( H, T, L, G ).
pivoting( H, [X|T], L, [X|G] ) :- higher_rank( X, H ), pivoting( H, T, L, G ).

lineofsuccession( X, SuccessorsRanked ) :- 
	findall( Y, offspring( Y, X), OffspringList ),
	rank_successors( OffspringList, SuccessorsRanked ), 
	write( SuccessorsRanked ).






	


