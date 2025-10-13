% Create a solution for Exercise 5.8(c)
% Base facts
fib(0, 1).
fib(1, 1).

% Recursive rule with memoization
fib(N, R) :-
    N > 1,
    % Kiểm tra xem kết quả đã có trong cơ sở dữ liệu chưa
    (   clause(fib(N, R), true)       % fact đã được assert trước đó
    ->  true                          % dùng luôn, không tính lại
    ;   N1 is N - 1,
        N2 is N - 2,
        fib(N1, R1),
        fib(N2, R2),
        R is R1 + R2,
        asserta(fib(N, R))            % ghi nhớ kết quả mới
    ).
