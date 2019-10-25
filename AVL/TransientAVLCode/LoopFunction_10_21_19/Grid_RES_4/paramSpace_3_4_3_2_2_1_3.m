function [aeroForces] = paramSpace_3_4_3_2_2_1_3(sailStates,airStates)

	CL = (4.318738)*sailStates.alpha + (0.148154)*sailStates.beta + (-2.922858)*sailStates.p + (36.762131)*sailStates.q + (-0.620722)*sailStates.r + (0.010815)*sailStates.de;
	CD = -0.398910;
	CY = (-0.075336)*sailStates.alpha + (-0.024668)*sailStates.beta + (-0.378010)*sailStates.p + (-0.100924)*sailStates.q + (0.024773)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.390777)*sailStates.alpha + (0.231040)*sailStates.beta + (-1.470158)*sailStates.p + (11.838232)*sailStates.q + (-0.665262)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.577095)*sailStates.alpha + (-0.579103)*sailStates.beta + (10.255086)*sailStates.p + (-147.195892)*sailStates.q + (2.094927)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.025659)*sailStates.alpha + (-0.010554)*sailStates.beta + (0.943516)*sailStates.p + (-4.562009)*sailStates.q + (-0.011932)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end