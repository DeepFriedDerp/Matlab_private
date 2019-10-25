function [aeroForces] = paramSpace_4_4_2_1_3_2_1(sailStates,airStates)

	CL = (3.604004)*sailStates.alpha + (-0.087740)*sailStates.beta + (-1.658417)*sailStates.p + (27.450998)*sailStates.q + (0.206246)*sailStates.r + (0.010138)*sailStates.de;
	CD = 0.022660;
	CY = (0.334802)*sailStates.alpha + (-0.031949)*sailStates.beta + (-0.156824)*sailStates.p + (2.326708)*sailStates.q + (0.031111)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.508810)*sailStates.alpha + (-0.015404)*sailStates.beta + (-0.438194)*sailStates.p + (2.412587)*sailStates.q + (0.021039)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-13.371246)*sailStates.alpha + (0.316801)*sailStates.beta + (5.931226)*sailStates.p + (-112.315697)*sailStates.q + (-0.752348)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-0.468577)*sailStates.alpha + (0.011269)*sailStates.beta + (0.333626)*sailStates.p + (-3.172564)*sailStates.q + (-0.053118)*sailStates.r + (-0.000677)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end