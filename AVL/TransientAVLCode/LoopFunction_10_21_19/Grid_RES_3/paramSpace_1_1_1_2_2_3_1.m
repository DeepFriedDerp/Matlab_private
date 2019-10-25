function [aeroForces] = paramSpace_1_1_1_2_2_3_1(sailStates,airStates)

	CL = (4.058383)*sailStates.alpha + (0.041493)*sailStates.beta + (-2.025238)*sailStates.p + (28.562506)*sailStates.q + (0.273699)*sailStates.r + (0.009690)*sailStates.de;
	CD = -0.309070;
	CY = (-0.082080)*sailStates.alpha + (-0.024090)*sailStates.beta + (0.297194)*sailStates.p + (-0.267956)*sailStates.q + (0.052429)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.110947)*sailStates.alpha + (-0.118071)*sailStates.beta + (-0.866366)*sailStates.p + (6.448236)*sailStates.q + (0.422574)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-14.691198)*sailStates.alpha + (-0.125634)*sailStates.beta + (7.572173)*sailStates.p + (-123.711861)*sailStates.q + (-0.834142)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.504557)*sailStates.alpha + (-0.029992)*sailStates.beta + (-0.806447)*sailStates.p + (4.345010)*sailStates.q + (-0.040957)*sailStates.r + (0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end