function [aeroForces] = paramSpace_1_3_2_3_1_2_1(sailStates,airStates)

	CL = (3.825371)*sailStates.alpha + (0.135736)*sailStates.beta + (-2.245848)*sailStates.p + (32.801765)*sailStates.q + (-0.658193)*sailStates.r + (0.010487)*sailStates.de;
	CD = 0.060710;
	CY = (-0.072379)*sailStates.alpha + (-0.026506)*sailStates.beta + (-0.090868)*sailStates.p + (-0.665001)*sailStates.q + (-0.016023)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (0.975857)*sailStates.alpha + (0.105520)*sailStates.beta + (-0.925126)*sailStates.p + (7.288404)*sailStates.q + (-0.415626)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-13.765046)*sailStates.alpha + (-0.496521)*sailStates.beta + (7.586578)*sailStates.p + (-128.181442)*sailStates.q + (2.233303)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.116761)*sailStates.alpha + (0.015991)*sailStates.beta + (0.094048)*sailStates.p + (0.462179)*sailStates.q + (-0.027940)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end