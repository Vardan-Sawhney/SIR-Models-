% right-hand side of SEIR model. u is state values
function rhs = SIR_seasonal_fxn(t, u, R0, gamma, N, phi)

% beta parameter adjusted to model seasonality. B0 = (R0 * gamma) / N)
beta = (R0 * gamma) / N * (1 + phi * cos(2 * pi * t/365));

S = u(1);  % susceptibles;     
I = u(2);  % infectious;   
R = u(3);  % recovered; 

rhs = [ -beta * S * I; 
        (beta * S * I) - (gamma * I); 
        gamma * I ];


