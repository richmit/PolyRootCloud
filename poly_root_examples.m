% -*- Mode:octave; Coding:us-ascii-unix; fill-column:120 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.H.S.%%
%% Copyright (c) 2025, Mitchell Jay Richling <http://www.mitchr.me/> All rights reserved.
%% 
%% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
%% following conditions are met:
%% 
%% 1. Redistributions of source code must retain the above copyright notice, this list of conditions, and the
%%    following disclaimer.
%% 
%% 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the
%%    following disclaimer in the documentation and/or other materials provided with the distribution.
%% 
%% 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote
%%    products derived from this software without specific prior written permission.
%% 
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
%% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
%% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
%% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
%% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
%% WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
%% USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%%
%% File      poly_root_examples.m          
%% Author    Mitch Richling http://www.mitchr.me/
%% Std       matlab_2022b           
%% See       https://github.com/richmit/PolyRootCloud/
%%  Details
%%    Just some examples of how to use poly_root.m.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.H.E.%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%***********************************************************************************************************************
%=======================================================================================================================
%-----------------------------------------------------------------------------------------------------------------------
% I started with a polynomial with the following roots:
%
%   [ 5, -5,  4+3i, -4-3i,  3-4i, -3+4i,  2+4.6i, -2-4.6i,  1-5i, -1+5i]
%
% Then I selected a nearby polynomial with integer components:
%
%   x^10 + (16-9i)*x^8 + (94-396i)*x^6 + (-9202-3106i)*x^4 + (-248435+113921i)*x^2 + -5582192+8562306i
%
% Then I picked 5th and 2nd degree polynomials to set a pair of coefficients in the above polynomial.
%
%   p1(x) = 10i*x^5-100*x^4+100i*x^2-100*x
%   p2(x) = (1-10i)*x^2-100i*x^1

poly_root( 300, 300, 1,  2, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_01_02.png')
poly_root(1000, 100, 1,  3, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_01_03.png')
poly_root(1000, 100, 1,  4, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_01_04.png')
poly_root(1000,  10, 1, 10, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_01_10.png')
poly_root( 200, 500, 2,  1, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_02_01.png')
poly_root( 300, 300, 3,  4, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_03_04.png')
poly_root( 200, 500, 4,  3, [10i, -100,  0, 100i, -100,  0], [1-10i, -100i, 0], [1, 0, 16-9i, 0, 94-396i, 0, -9202-3106i, 0, -248435+113921i, 0, -5582192+8562306i], 'poly_root_10_04_03.png')

% This one is from a reddit post: % https://www.reddit.com/r/math/comments/1mnf0o2/roots_of_polynomials/

poly_root(400, 400, 9, 13, [100i, -100i, 100i, -100i, -100, 100i], [-100i, -100i, 100i, 100i, 100], [1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.1, 0.1], 'poly_root_18.png')

% A couple degree 5 examples

poly_root(100, 1000, 3, 4, [1, -1, 1],       [-1, 1, -1],      [1,  1, 0, 0, 1,  1], 'poly_root_05a_1.png')

poly_root(200, 1000, 3, 4, [-1i, 1i, -1, 1], [1i, -1i, 1, -1], [1, -1, 0, 0, 1, -1], 'poly_root_05b_1.png')

% A quadratic example

poly_root(100, 1000, 2, 3, [1, 0], [1, 0], [1, 1, 1], 'poly_root_02_1.png')
