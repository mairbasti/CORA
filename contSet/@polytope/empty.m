function P_out = empty(n)
% empty - instantiates an empty n-dimensional polytope
%
% Syntax:
%    P_out = polytope.empty(n)
%
% Inputs:
%    n - dimension
%
% Outputs:
%    P_out - empty n-dimensional polytope
%
% Examples:
%    P = polytope.empty(2);
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

% the polytope 0*x <= -1 is empty
nrRows = min([n,1]);
P_out = polytope(zeros(nrRows,n),-ones(nrRows,1));
% assign properties
P_out.emptySet.val = true;
P_out.bounded.val = true;
P_out.fullDim.val = false;
P_out.minHRep.val = true;
P_out.minVRep.val = true;
P_out.V.val = zeros(n,0);

% ------------------------------ END OF CODE ------------------------------
