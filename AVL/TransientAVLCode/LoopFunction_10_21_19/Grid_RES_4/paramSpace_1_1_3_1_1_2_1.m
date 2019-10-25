function [aeroForces] = paramSpace_1_1_3_1_1_2_1(sailStates,airStates)

	CL = (3.604004)*sailStates.alpha + (-0.087740)*sailStates.beta + (-1.658417)*sailStates.p + (27.450998)*sailStates.q + (-0.206246)*sailStates.r + (0.010138)*sailStates.de;
	CD = 0.022660;
	CY = (-0.334802)*sailStates.alpha + (-0.017623)*sailStates.beta + (0.156824)*sailStates.p + (-2.326708)*sailStates.q + (0.031111)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.683731)*sailStates.alpha + (0.008755)*sailStates.beta + (-0.532584)*sailStates.p + (3.600468)*sailStates.q + (-0.039772)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-13.371249)*sailStates.alpha + (0.316801)*sailStates.beta + (5.931226)*sailStates.p + (-112.315697)*sailStates.q + (0.752348)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (0.507178)*sailStates.alpha + (-0.006463)*sailStates.beta + (-0.352402)*sailStates.p + (3.408849)*sailStates.q + (-0.056845)*sailStates.r + (0.000677)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end