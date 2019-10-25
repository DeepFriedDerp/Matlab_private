function [aeroForces] = paramSpace_4_1_1_1_1_3_2(sailStates,airStates)

	CL = (7.774517)*sailStates.alpha + (0.754012)*sailStates.beta + (-2.583265)*sailStates.p + (43.147606)*sailStates.q + (3.644140)*sailStates.r + (0.012152)*sailStates.de;
	CD = -3.026140;
	CY = (-0.257428)*sailStates.alpha + (-0.029565)*sailStates.beta + (1.495058)*sailStates.p + (-1.664518)*sailStates.q + (-0.297207)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (3.058620)*sailStates.alpha + (-0.437040)*sailStates.beta + (-1.225165)*sailStates.p + (12.603004)*sailStates.q + (3.084866)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-12.354197)*sailStates.alpha + (-2.731240)*sailStates.beta + (6.081005)*sailStates.p + (-131.445847)*sailStates.q + (-11.996399)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.327330)*sailStates.alpha + (0.147436)*sailStates.beta + (-3.170582)*sailStates.p + (14.856592)*sailStates.q + (0.065066)*sailStates.r + (0.000737)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end