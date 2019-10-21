function [aeroForces] = paramSpace_1_1_1_1_1_2_3(sailStates,airStates)

	CL = (3.410294)*sailStates.alpha + (-0.105953)*sailStates.beta + (-3.413135)*sailStates.p + (42.770298)*sailStates.q + (-1.084450)*sailStates.r + (0.011086)*sailStates.de;
	CD = 0.108820;
	CY = (-0.078735)*sailStates.alpha + (-0.025120)*sailStates.beta + (-0.236417)*sailStates.p + (0.117054)*sailStates.q + (-0.041698)*sailStates.r + (0.000025)*sailStates.de;

	Cl = (1.287431)*sailStates.alpha + (0.076836)*sailStates.beta + (-1.941623)*sailStates.p + (17.181063)*sailStates.q + (-0.796699)*sailStates.r + (0.001637)*sailStates.de;
	Cm = (-12.306013)*sailStates.alpha + (0.415267)*sailStates.beta + (11.379991)*sailStates.p + (-161.105606)*sailStates.q + (3.687042)*sailStates.r + (-0.070968)*sailStates.de;
	Cn = (0.502091)*sailStates.alpha + (0.017305)*sailStates.beta + (0.206175)*sailStates.p + (0.399179)*sailStates.q + (-0.043965)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end