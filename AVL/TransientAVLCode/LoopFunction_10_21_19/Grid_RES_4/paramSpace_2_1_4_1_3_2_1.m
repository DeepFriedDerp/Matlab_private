function [aeroForces] = paramSpace_2_1_4_1_3_2_1(sailStates,airStates)

	CL = (3.868310)*sailStates.alpha + (-0.082849)*sailStates.beta + (-1.645621)*sailStates.p + (27.604280)*sailStates.q + (-0.646316)*sailStates.r + (0.010526)*sailStates.de;
	CD = -0.036710;
	CY = (0.292093)*sailStates.alpha + (-0.025890)*sailStates.beta + (-0.291030)*sailStates.p + (1.471501)*sailStates.q + (-0.018920)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.807412)*sailStates.alpha + (0.044802)*sailStates.beta + (-0.514519)*sailStates.p + (3.638421)*sailStates.q + (-0.462128)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.729778)*sailStates.alpha + (0.205347)*sailStates.beta + (5.546207)*sailStates.p + (-111.058342)*sailStates.q + (2.147879)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-0.624331)*sailStates.alpha + (0.006992)*sailStates.beta + (0.601466)*sailStates.p + (-3.916735)*sailStates.q + (0.010847)*sailStates.r + (-0.000462)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end