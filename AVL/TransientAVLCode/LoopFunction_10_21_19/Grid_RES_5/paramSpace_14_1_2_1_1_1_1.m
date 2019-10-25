function [aeroForces] = paramSpace_14_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.101452)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.846662)*sailStates.p + (26.431965)*sailStates.q + (-0.220482)*sailStates.r + (0.009450)*sailStates.de;
	CD = -0.454190;
	CY = (-0.002580)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.277629)*sailStates.p + (-0.550480)*sailStates.q + (0.059032)*sailStates.r + (-0.000115)*sailStates.de;

	Cl = (0.833882)*sailStates.alpha + (0.160626)*sailStates.beta + (-0.704385)*sailStates.p + (4.810721)*sailStates.q + (-0.466683)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-14.956821)*sailStates.alpha + (0.000000)*sailStates.beta + (7.080202)*sailStates.p + (-119.415161)*sailStates.q + (0.667916)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (-0.473886)*sailStates.alpha + (-0.034142)*sailStates.beta + (0.762478)*sailStates.p + (-3.260038)*sailStates.q + (-0.031133)*sailStates.r + (0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end