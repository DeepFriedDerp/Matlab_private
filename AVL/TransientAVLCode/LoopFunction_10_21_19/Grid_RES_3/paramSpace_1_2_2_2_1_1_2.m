function [aeroForces] = paramSpace_1_2_2_2_1_1_2(sailStates,airStates)

	CL = (4.309739)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.591734)*sailStates.p + (38.337421)*sailStates.q + (-1.704851)*sailStates.r + (0.011393)*sailStates.de;
	CD = -0.367910;
	CY = (-0.101489)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.547761)*sailStates.p + (-0.759371)*sailStates.q + (-0.096585)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.197337)*sailStates.alpha + (0.304172)*sailStates.beta + (-1.208970)*sailStates.p + (10.699426)*sailStates.q + (-1.391819)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-12.492358)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.952569)*sailStates.p + (-136.489655)*sailStates.q + (5.704645)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.082426)*sailStates.alpha + (0.053634)*sailStates.beta + (1.087220)*sailStates.p + (-3.687775)*sailStates.q + (-0.016121)*sailStates.r + (0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end