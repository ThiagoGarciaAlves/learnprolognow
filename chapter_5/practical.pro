% 1. In the text we discussed the 3-place predicate accMax which returned the
% maximum of a list of integers. By changing the code slightly, turn this into
% a 3-place predicate accMin which returns the minimum of a list of integers.

accMin([],Min,Min).
accMin([Head|Tail], Acc, Min) :-
  Head < Acc,
  accMin(Tail, Head, Min);
  accMin(Tail, Acc, Min).



% 2. In mathematics, an n-dimensional vector is a list of numbers of length n.
% For example, [2,5,12] is a 3-dimensional vector, and [45,27,3,-4,6] is a
% 5-dimensional vector. One of the basic operations on vectors is scalar
% multiplication . In this operation, every element of a vector is multiplied
% by some number. For example, if we scalar multiply the 3-dimensional vector
% [2,7,4] by 3 the result is the 3-dimensional vector [6,21,12] .
%
% Write a 3-place predicate scalarMult whose first argument is an integer,
% whose second argument is a list of integers, and whose third argument is the
% result of scalar multiplying the second argument by the first. For example,
% the query
%
%   ?-  scalarMult(3,[2,7,4],Result).
%
% should yield
%
%   Result  =  [6,21,12]


scalarMult(_,[],[]).
scalarMult(Int, [H1|T1], [H2|T2]) :-
  H2 is H1 * Int,
  scalarMult(Int, T1, T2).



% 3. Another fundamental operation on vectors is the dot product . This
% operation combines two vectors of the same dimension and yields a number as
% a result. The operation is carried out as follows: the corresponding elements
% of the two vectors are multiplied, and the results added. For example, the
% dot product of [2,5,6] and [3,4,1] is 6+20+6 , that is, 32 . Write a 3-place
% predicate dot whose first argument is a list of integers, whose second
% argument is a list of integers of the same length as the first, and whose
% third argument is the dot product of the first argument with the second. For
% example, the query
%
%   ?-  dot([2,5,6],[3,4,1],Result).
%
% should yield
%
%   Result  =  32


dot_help([],[],Res,Res).
dot_help([H1|T1], [H2|T2], Acc, Result) :-
  Prod is H1 * H2,
  Sum is Acc + Prod,
  dot_help(T1,T2,Sum,Result).

dot(L1, L2, Sum) :-
  dot_help(L1, L2, 0, Sum).
