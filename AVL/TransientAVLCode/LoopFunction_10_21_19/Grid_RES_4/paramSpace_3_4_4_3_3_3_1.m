function [aeroForces] = paramSpace_3_4_4_3_3_3_1(sailStates,airStates)

	CL = (4.109106)*sailStates.alpha + (-0.230522)*sailStates.beta + (-2.308602)*sailStates.p + (33.372402)*sailStates.q + (0.831649)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.137530;
	CY = (0.036847)*sailStates.alpha + (-0.025566)*sailStates.beta + (0.314462)*sailStates.p + (0.563443)*sailStates.q + (-0.020551)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.013183)*sailStates.alpha + (-0.230389)*sailStates.beta + (-0.945755)*sailStates.p + (7.333750)*sailStates.q + (0.735330)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-13.909598)*sailStates.alpha + (0.973580)*sailStates.beta + (7.728767)*sailStates.p + (-129.238022)*sailStates.q + (-2.856346)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.164554)*sailStates.alpha + (0.011883)*sailStates.beta + (-0.656236)*sailStates.p + (2.296966)*sailStates.q + (-0.001506)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end