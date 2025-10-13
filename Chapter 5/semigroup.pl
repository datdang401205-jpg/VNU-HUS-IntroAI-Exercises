
% Create a solution for Exercise 5.1, page 88. More precisely, you will attempt to prove the equality of left- and right-neutral elements of semigroups with PROLOG and fail. Try to explain why?
% associative law
equal(mul(mul(X,Y),Z), mul(X,mul(Y,Z))).

% left neutral element
equal(mul(el, X), X).

% right neutral element
equal(mul(X, er), X).

% goal: prove equal(el, er).

Prolog thì thất bại, vì:

Nó chỉ dùng đơn nhất hóa cú pháp (syntactic unification),

Không có quy tắc thay thế tương đương hai chiều,

Và sử dụng chiến lược procedural depth-first, không phải logic đầy đủ.
