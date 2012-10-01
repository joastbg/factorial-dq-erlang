-module(factorial).
-compile(export_all).

%% Divide and conquer recursive (2x faster than tail recursion)
factorial(N) -> factorial_1(N, 1).
factorial_1(0, X) -> X;
factorial_1(N, X) -> factorial_1(N-1, N*X).

fact(N) -> 
	fact_range(1,N).

fact_range(N, M) -> 
	if
		N == M ->
			N;
		M < N ->
			1;
		true ->
			fact_range(N, (N + M) div 2) * fact_range((N + M) div 2+1, M)
	end.
