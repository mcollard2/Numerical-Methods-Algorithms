function [L,U,P] = luFactor(A)
%luFactor This function determines the LU Factorization
%         of a 3x3 matrix. 
%   Inputs:
%       -A: Square coefficient matrix
%   Outputs:
%       -L: Lower triangular matrix
%       -U: Upper triangular matrix
%       -P: Pivot matrix


%Check for user errors
if size(A,1)~= size(A,2)
    error('The matrix is not square')
end
if nargin~=1
    error('Too many input arguments')
end
%Define matrices to be used later
P = [1 0 0;0 1 0;0 0 1];
L = [1 0 0;0 1 0;0 0 1];
U = A;

%1st Pivot
[~,I1] = max(abs(U(:,1)));%find where largest element is
    if I1 ~= 1 %checks if pivot is necessary
    Row1 = U(I1,:); %pivots rows
    RowS = U(1,:);
    U(I1,:) = RowS;
    U(1,:) = Row1;
    PRow1 = P(I1,:); %updates P matrix
    PRowS = P(1,:);
    P(I1,:) = PRowS;
    P(1,:) = PRow1;
    end
    [~,i1] = min(abs(U(:,1)));% find where smallest element is
    if i1 ~= size(U,1) %checks  if further pivoting is necessary
    RowLast = U(i1,:); %pivots rows
    RowLS = U(size(U,1),:);
    U(i1,:) = RowLS;
    U(size(U,1),:) = RowLast;
    PRowL = P(i1,:); %updates P matrix
    PRowLS = P(size(U,1),:);
    P(i1,:) = PRowLS;
    P(size(U,1),:) = PRowL;
    end
    
%First Elimination
L1 = U(2,1)/U(1,1); 
U(2,:) = U(2,:)-L1*U(1,:);
L2 = U(3,1)/U(1,1);
U(3,:) = U(3,:)-L2*U(1,:); 
L(2,1) = L1; %update L matrix
L(3,1) = L2;

%Second Pivot
[~,I2] = max(abs(U(:,2)));
if I2 == 3 %checks if pivot is necessary
    Row2 = U(I2,:); %pivots rows
    RowS2 = U(2,:);
    U(I2,:) = RowS2;
    U(2,:) = Row2;
    PRow2 = P(I2,:); %updates P matrix
    PRowS2 = P(2,:);
    P(I2,:) = PRowS2;
    P(2,:) = PRow2;
    LRow3 = L(2,1); %update L matrix
    LRow2 = L(3,1);
    L(3,1)=LRow3;
    L(2,1)=LRow2;
end
%second elimination
L3 = U(3,2)/U(2,2);
U(3,:) = U(3,:)-L3*U(2,:);
L(3,2) = L3; %updatAe L matrix

%error checking
if P*A ~= L*U
    error('The P matrix times the A matrix does not equal the L matrix times the U matrix')
end

%Outputs (not necessary but helpful)
L = L
U = U
P = P
end

