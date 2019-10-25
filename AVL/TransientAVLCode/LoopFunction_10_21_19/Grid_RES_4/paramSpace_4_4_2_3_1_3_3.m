function [aeroForces] = paramSpace_4_4_2_3_1_3_3(sailStates,airStates)

	CL = (4.262103)*sailStates.alpha + (-0.378590)*sailStates.beta + (-2.747818)*sailStates.p + (39.536156)*sailStates.q + (1.861988)*sailStates.r + (0.011099)*sailStates.de;
	CD = -0.255400;
	CY = (-0.022757)*sailStates.alpha + (-0.022679)*sailStates.beta + (0.624603)*sailStates.p + (-0.684400)*sailStates.q + (-0.124217)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.438904)*sailStates.alpha + (-0.404404)*sailStates.beta + (-1.319794)*sailStates.p + (11.858559)*sailStates.q + (1.449813)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-12.791719)*sailStates.alpha + (1.359793)*sailStates.beta + (8.323831)*sailStates.p + (-140.146637)*sailStates.q + (-6.177458)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.150249)*sailStates.alpha + (0.054273)*sailStates.beta + (-1.181977)*sailStates.p + (5.045040)*sailStates.q + (-0.001119)*sailStates.r + (0.000302)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end