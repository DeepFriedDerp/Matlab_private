function [aeroForces] = paramSpace_3_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.964771)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.247628)*sailStates.p + (31.821898)*sailStates.q + (-0.363916)*sailStates.r + (0.010349)*sailStates.de;
	CD = -0.023790;
	CY = (0.030499)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.017640)*sailStates.p + (0.261303)*sailStates.q + (0.003120)*sailStates.r + (0.000055)*sailStates.de;

	Cl = (1.100157)*sailStates.alpha + (-0.019244)*sailStates.beta + (-0.986033)*sailStates.p + (7.827228)*sailStates.q + (-0.113287)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-14.606981)*sailStates.alpha + (0.000000)*sailStates.beta + (7.836863)*sailStates.p + (-129.217163)*sailStates.q + (1.236873)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (0.145406)*sailStates.alpha + (-0.003393)*sailStates.beta + (-0.187104)*sailStates.p + (1.072317)*sailStates.q + (-0.022366)*sailStates.r + (-0.000061)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end