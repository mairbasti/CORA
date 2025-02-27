function P_out = Inf(n)
% Inf - instantiates an n-dimensional polytope that is equivalent to R^n
%
% Syntax:
%    P_out = polytope.Inf(n)
%
% Inputs:
%    n - dimension
%
% Outputs:
%    P_out - polytope representing R^n
%
% Examples:
%    P = polytope.Inf(2);
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: none

% Authors:       Mark Wetzlinger
% Written:       16-December-2023
% Last update:   ---
% Last revision: ---

% ------------------------------ BEGIN CODE -------------------------------

if n <= 0
    throw(CORAerror('CORA:wrongValue','first','positive'));
end

% the polytope 0*x <= 1 is R^n
nrRows = min([n,1]);
P_out = polytope(zeros(nrRows,n),ones(nrRows,1));
% assign properties
P_out.emptySet.val = false;
P_out.bounded.val = false;
P_out.fullDim.val = true;
P_out.minHRep.val = true;
% only store vertices for low-dimensional polytopes
if n <= 8
    % compute all possible combinations of lower/upper bounds
    fac = logical(combinator(2,n,'p','r')-1);
    nrComb = size(fac,1);
    % init all points with -Inf
    V = -Inf(n,nrComb);
    % loop over all factors
    for i=1:nrComb
        V(fac(i,:)',i) = Inf;
    end

    P_out.minVRep.val = true;
    P_out.V.val = V;
end

% ------------------------------ END OF CODE ------------------------------
