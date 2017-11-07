
% The succession rule doesnt take into account the gender of the childs (or offsprings)
% so the male() and female() facts are now useless. Also,
% the higher rank comparison doesnt need any male or female facts, therefore, only the age is
% important


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

rank_successors( OffspringList, Sorted ) :-
	r_successors( OffspringList, [], Sorted).

r_successors( [], Acc, Acc ).

r_successors( [H|T], Acc, Sorted ) :-
	bubble( H, T, NT, Max ),
	r_successors( NT, [Max|Acc], Sorted ).

bubble(X,[],[],X).

bubble( X, [Y|T], [Y|NT], Max ) :- 
	not(higher_rank( X, Y )),	
	bubble( X, T, NT, Max ).

bubble( X, [Y|T], [X|NT], Max ) :- 
	higher_rank( X, Y ),	
	bubble( Y, T, NT, Max ).


lineofsuccession( X, SuccessorsRanked ) :- 
	findall( Y, offspring( Y, X), OffspringList ),
	rank_successors( OffspringList, SuccessorsRanked ), 
	write( SuccessorsRanked ).

% The bubble sort is not very efficient, on the next page, 
% the same results using this time a quick sort.





	


