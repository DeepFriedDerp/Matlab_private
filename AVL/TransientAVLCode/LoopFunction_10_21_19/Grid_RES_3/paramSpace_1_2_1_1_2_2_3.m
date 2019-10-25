function [aeroForces] = paramSpace_1_2_1_1_2_2_3(sailStates,airStates)

	CL = (3.521312)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.361380)*sailStates.p + (42.543201)*sailStates.q + (-1.199645)*sailStates.r + (0.011095)*sailStates.de;
	CD = 0.096760;
	CY = (-0.041852)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.312122)*sailStates.p + (0.589407)*sailStates.q + (-0.055092)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.332970)*sailStates.alpha + (0.132555)*sailStates.beta + (-1.879117)*sailStates.p + (16.620564)*sailStates.q + (-0.887294)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-12.561445)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.102013)*sailStates.p + (-159.507309)*sailStates.q + (4.060730)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (0.490895)*sailStates.alpha + (0.023373)*sailStates.beta + (0.374640)*sailStates.p + (-0.778911)*sailStates.q + (-0.032110)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end