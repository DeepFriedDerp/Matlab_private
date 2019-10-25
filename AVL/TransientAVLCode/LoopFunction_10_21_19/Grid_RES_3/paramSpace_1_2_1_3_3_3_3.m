function [aeroForces] = paramSpace_1_2_1_3_3_3_3(sailStates,airStates)

	CL = (3.897461)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.697141)*sailStates.p + (35.429615)*sailStates.q + (-0.449513)*sailStates.r + (0.010354)*sailStates.de;
	CD = -0.012900;
	CY = (0.079673)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.019660)*sailStates.p + (0.665001)*sailStates.q + (-0.003530)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.304692)*sailStates.alpha + (-0.016691)*sailStates.beta + (-1.359414)*sailStates.p + (11.345735)*sailStates.q + (-0.200913)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-14.279491)*sailStates.alpha + (0.000000)*sailStates.beta + (9.362670)*sailStates.p + (-141.960541)*sailStates.q + (1.562150)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.130308)*sailStates.alpha + (-0.002943)*sailStates.beta + (-0.201680)*sailStates.p + (1.319605)*sailStates.q + (-0.028818)*sailStates.r + (-0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end