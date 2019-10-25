function [aeroForces] = paramSpace_1_4_2_1_1_3_1(sailStates,airStates)

	CL = (6.386078)*sailStates.alpha + (-0.415200)*sailStates.beta + (-1.487966)*sailStates.p + (19.566462)*sailStates.q + (2.038714)*sailStates.r + (0.008513)*sailStates.de;
	CD = -2.636950;
	CY = (-0.669337)*sailStates.alpha + (-0.032432)*sailStates.beta + (1.174666)*sailStates.p + (-2.326710)*sailStates.q + (0.233739)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (1.743076)*sailStates.alpha + (-0.636563)*sailStates.beta + (-0.384162)*sailStates.p + (0.320591)*sailStates.q + (2.044924)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-18.076292)*sailStates.alpha + (1.551527)*sailStates.beta + (7.395637)*sailStates.p + (-112.315697)*sailStates.q + (-6.609746)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (2.630551)*sailStates.alpha + (-0.078386)*sailStates.beta + (-2.660439)*sailStates.p + (13.689738)*sailStates.q + (-0.107352)*sailStates.r + (0.000844)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end