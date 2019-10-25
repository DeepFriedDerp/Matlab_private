function [aeroForces] = paramSpace_1_2_1_2_3_1_2(sailStates,airStates)

	CL = (4.823748)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.550834)*sailStates.p + (38.618031)*sailStates.q + (-2.106886)*sailStates.r + (0.011279)*sailStates.de;
	CD = -0.634530;
	CY = (0.105046)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.809527)*sailStates.p + (0.759373)*sailStates.q + (-0.142814)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.662157)*sailStates.alpha + (0.374479)*sailStates.beta + (-1.183628)*sailStates.p + (10.772516)*sailStates.q + (-1.743550)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-12.817895)*sailStates.alpha + (0.000000)*sailStates.beta + (7.478142)*sailStates.p + (-134.568695)*sailStates.q + (7.041797)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.173471)*sailStates.alpha + (0.066031)*sailStates.beta + (1.624416)*sailStates.p + (-7.147582)*sailStates.q + (0.015648)*sailStates.r + (-0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end