function [aeroForces] = paramSpace_2_3_2_3_3_1_2(sailStates,airStates)

	CL = (4.407336)*sailStates.alpha + (0.083771)*sailStates.beta + (-2.578549)*sailStates.p + (35.785686)*sailStates.q + (-1.120531)*sailStates.r + (0.011182)*sailStates.de;
	CD = -0.248380;
	CY = (0.063703)*sailStates.alpha + (-0.024781)*sailStates.beta + (-0.471961)*sailStates.p + (0.498141)*sailStates.q + (-0.030952)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.395692)*sailStates.alpha + (0.239945)*sailStates.beta + (-1.193919)*sailStates.p + (9.799912)*sailStates.q + (-0.956398)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.500920)*sailStates.alpha + (-0.327422)*sailStates.beta + (8.552820)*sailStates.p + (-136.960373)*sailStates.q + (3.801737)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.166867)*sailStates.alpha + (0.013642)*sailStates.beta + (0.971626)*sailStates.p + (-4.515301)*sailStates.q + (0.006114)*sailStates.r + (-0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end