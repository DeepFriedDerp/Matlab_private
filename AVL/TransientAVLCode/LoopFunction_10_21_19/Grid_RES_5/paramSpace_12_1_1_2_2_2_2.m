function [aeroForces] = paramSpace_12_1_1_2_2_2_2(sailStates,airStates)

	CL = (4.103953)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.779931)*sailStates.p + (38.153671)*sailStates.q + (1.188557)*sailStates.r + (0.011358)*sailStates.de;
	CD = -0.079030;
	CY = (0.068663)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.342536)*sailStates.p + (0.291854)*sailStates.q + (-0.048171)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.307250)*sailStates.alpha + (-0.182977)*sailStates.beta + (-1.376509)*sailStates.p + (11.818993)*sailStates.q + (0.915522)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-13.817106)*sailStates.alpha + (0.000000)*sailStates.beta + (9.052495)*sailStates.p + (-142.523422)*sailStates.q + (-3.969821)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.192487)*sailStates.alpha + (0.025716)*sailStates.beta + (-0.632126)*sailStates.p + (2.155273)*sailStates.q + (-0.012862)*sailStates.r + (-0.000005)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end