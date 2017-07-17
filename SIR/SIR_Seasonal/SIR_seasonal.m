%% parameters
N = 3000000;                % population size
R0 = 2;                     % basic reproductive number; modeling influenza
gamma = 1/7;                % avg. infectious period = 7 days

phi = .3;                   % seasonal forcing parameter
tend = 700;                 

%% initial conditions (state values)
u = [ N - 1; 1; 0 ];
 
%% solve ODE with ode45
[T1, U1] = ode45(@(t, u) SIR_seasonal_fxn(t, u, R0, gamma, N, phi), 1:0.1:tend, u);
[T2, U2] = ode45(@(t, u) SIR_seasonal_fxn(t, u, R0, gamma, N, phi), 80:0.1:tend, u);
[T3, U3] = ode45(@(t, u) SIR_seasonal_fxn(t, u, R0, gamma, N, phi), 200:0.1:tend, u);


%% plot results
figure(1);
plot(T1,U1(:,2)/N, 'k', T2,U2(:,2)/N, 'r', T3,U3(:,2)/N, 'g');
axis([0 tend 0 .35]);
xlabel('time = days');
ylabel('proportion of population');
title('infected: black = day 1 outbreak, red = day 80, green = day 200');
