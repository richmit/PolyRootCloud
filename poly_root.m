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
%% File      poly_root.m          
%% Author    Mitch Richling http://www.mitchr.me/
%% Std       matlab_2022b           
%% See       https://github.com/richmit/PolyRootCloud/
%% Usage 
%%  Description
%%    Plot roots of the polynomial p.  Two of the coefficients of p (c1 & c2) are parameterized by polynomials (p2 & p2)
%%    over the unit circle.  
%%  Inputs
%%    - n1 .... Number of samples for parameter 1
%%    - n2 .... Number of samples for parameter 2
%%    - c1 .... Coefficient to set with parameter polynomial 1
%%    - c2 .... Coefficient to set with parameter polynomial 1
%%    - p1 .... Parameter polynomial 1
%%    - p2 .... Parameter polynomial 1
%%    - p ..... The polynomial
%%    - file .. File name to use for output PNG image.  If not provided, then no image file is created.
%%  Outputs: None
%%  Details
%%    In pseudocode:
%%      Loop
%%        Select sample points on the unit circle for t1 & t2
%%        Plug t1 & t2 into p1 & p2
%%        Set coefficients c1 & c2 in p to the value of p1 & p2
%%        Find the roots of p and plot them
%%      Repeat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.H.E.%%

%-----------------------------------------------------------------------------------------------------------------------
function poly_root(n1, n2, c1, c2, p1, p2, p, file)
    validateattributes(n1, {'numeric'}, {'scalar', 'integer', 'positive'});
    validateattributes(n2, {'numeric'}, {'scalar', 'integer', 'positive'});
    validateattributes(c1, {'numeric'}, {'scalar', 'integer', 'positive'});
    validateattributes(c2, {'numeric'}, {'scalar', 'integer', 'positive'});
    validateattributes(p,  {'numeric'}, {'vector', 'nonempty'});
    validateattributes(p1, {'numeric'}, {'vector', 'nonempty'});
    validateattributes(p2, {'numeric'}, {'vector', 'nonempty'});
    if (nargin > 7)
        validateattributes(file, {'char', 'string'}, {'nonempty'});
    end
    fprintf("Starting\n");
    pdg = size(p, 2) - 1;
    r = zeros(n1*n2*pdg, 1, 'like', 1+1i);
    idx = 1;
    for m1 = 0:(n1-1)
        t1 = exp(i*m1*2*pi/n1);
        p(c1) = polyval(p1, t1);
        for m2 = 0:(n2-1)
            t2 = exp(i*m2*2*pi/n2);
            p(c2) = polyval(p2, t2);
            r(idx:(idx+pdg-1), 1) = roots(p);
            idx = idx + pdg;
        end
        fprintf("Percent Done: %4.1f\n", 100 * idx / n1 / n2 / pdg);
    end
    p(c1) = 0;
    p(c2) = 0;
    fprintf("Plotting\n");
    close();
    scatter(real(r), imag(r), 2,      ...
            'MarkerFaceColor', 'r',   ...
            'MarkerEdgeColor', 'b',   ...
            'MarkerFaceAlpha', 0.01,  ...
            'MarkerEdgeAlpha', 0.02);
    set(gcf, 'position', [100, 100, 1024, 1024]);
    axis equal;
    xlabel('Re');
    ylabel('Im');
    title({ ['p = ',  mat2str(p)],                    ...
            ['p1 = ', mat2str(p1)],                   ...
            ['p2 = ', mat2str(p2)],                   ...
            ['p(', mat2str(c1), ')=polyval(p1, t1)'], ...
            ['p(', mat2str(c2), ')=polyval(p2, t2)'], ...
            'Plot of roots(p) for all |t1|=|t2|=1'},  ...
          'interpreter', 'none');
    if (nargin > 7)
        fprintf("Saving\n");
        exportgraphics(gcf, file, 'Resolution', 300);
    end
    fprintf("Done\n");
end
