function [aeroForces] = paramSpace_4_3_2_1_1_1_2(sailStates,airStates)

	CL = (5.108066)*sailStates.alpha + (0.089446)*sailStates.beta + (-2.261371)*sailStates.p + (27.599886)*sailStates.q + (-0.843645)*sailStates.r + (0.009101)*sailStates.de;
	CD = -1.551870;
	CY = (-0.183970)*sailStates.alpha + (-0.023264)*sailStates.beta + (-0.553044)*sailStates.p + (-1.664519)*sailStates.q + (0.110067)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.072861)*sailStates.alpha + (0.361095)*sailStates.beta + (-1.063145)*sailStates.p + (7.699701)*sailStates.q + (-1.076263)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-15.725691)*sailStates.alpha + (-0.376939)*sailStates.beta + (9.078845)*sailStates.p + (-132.472137)*sailStates.q + (2.736873)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.324262)*sailStates.alpha + (-0.066137)*sailStates.beta + (1.489403)*sailStates.p + (-6.026425)*sailStates.q + (-0.040272)*sailStates.r + (0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end