function [aeroForces] = paramSpace_2_3_1_1_2_1_2(sailStates,airStates)

	CL = (6.509988)*sailStates.alpha + (0.207334)*sailStates.beta + (-2.624266)*sailStates.p + (37.653084)*sailStates.q + (-2.568786)*sailStates.r + (0.011531)*sailStates.de;
	CD = -2.368050;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-1.148057)*sailStates.p + (0.000002)*sailStates.q + (-0.075248)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.893553)*sailStates.alpha + (0.629389)*sailStates.beta + (-1.209875)*sailStates.p + (10.287886)*sailStates.q + (-2.342556)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-13.568038)*sailStates.alpha + (-0.832546)*sailStates.beta + (8.257989)*sailStates.p + (-137.194580)*sailStates.q + (8.738131)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.343425)*sailStates.alpha + (0.036490)*sailStates.beta + (2.493711)*sailStates.p + (-10.974571)*sailStates.q + (0.014734)*sailStates.r + (-0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end