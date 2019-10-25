function [aeroForces] = paramSpace_1_2_1_3_3_2_2(sailStates,airStates)

	CL = (3.874546)*sailStates.alpha + (-0.084855)*sailStates.beta + (-2.464667)*sailStates.p + (35.435631)*sailStates.q + (-1.124319)*sailStates.r + (0.010501)*sailStates.de;
	CD = 0.074310;
	CY = (0.063166)*sailStates.alpha + (-0.025548)*sailStates.beta + (-0.321163)*sailStates.p + (0.489619)*sailStates.q + (-0.063936)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.283369)*sailStates.alpha + (0.116414)*sailStates.beta + (-1.169341)*sailStates.p + (10.134148)*sailStates.q + (-0.818567)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-13.412830)*sailStates.alpha + (0.333235)*sailStates.beta + (7.989331)*sailStates.p + (-134.148560)*sailStates.q + (3.791795)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.045822)*sailStates.alpha + (0.027719)*sailStates.beta + (0.502178)*sailStates.p + (-1.772204)*sailStates.q + (-0.016859)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end