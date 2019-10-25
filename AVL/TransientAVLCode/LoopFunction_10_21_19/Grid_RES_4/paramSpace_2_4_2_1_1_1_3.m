function [aeroForces] = paramSpace_2_4_2_1_1_1_3(sailStates,airStates)

	CL = (5.166292)*sailStates.alpha + (0.552884)*sailStates.beta + (-3.506682)*sailStates.p + (44.444733)*sailStates.q + (-2.231911)*sailStates.r + (0.011860)*sailStates.de;
	CD = -1.839090;
	CY = (-0.519853)*sailStates.alpha + (-0.026512)*sailStates.beta + (-0.894676)*sailStates.p + (-1.471500)*sailStates.q + (-0.058588)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.191674)*sailStates.alpha + (0.651129)*sailStates.beta + (-1.901581)*sailStates.p + (16.487116)*sailStates.q + (-2.048521)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-11.143721)*sailStates.alpha + (-2.197569)*sailStates.beta + (11.342206)*sailStates.p + (-161.242615)*sailStates.q + (7.595376)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.321524)*sailStates.alpha + (0.032580)*sailStates.beta + (1.937033)*sailStates.p + (-7.244007)*sailStates.q + (0.000722)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end