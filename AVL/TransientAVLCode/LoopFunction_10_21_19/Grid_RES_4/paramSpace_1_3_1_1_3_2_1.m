function [aeroForces] = paramSpace_1_3_1_1_3_2_1(sailStates,airStates)

	CL = (3.755719)*sailStates.alpha + (0.082873)*sailStates.beta + (-1.578160)*sailStates.p + (28.363335)*sailStates.q + (-1.080081)*sailStates.r + (0.010118)*sailStates.de;
	CD = -0.012020;
	CY = (0.284071)*sailStates.alpha + (-0.023806)*sailStates.beta + (-0.402258)*sailStates.p + (1.002333)*sailStates.q + (-0.080122)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.746695)*sailStates.alpha + (0.180463)*sailStates.beta + (-0.416812)*sailStates.p + (3.061426)*sailStates.q + (-0.777226)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-12.352164)*sailStates.alpha + (-0.325112)*sailStates.beta + (4.837562)*sailStates.p + (-108.591927)*sailStates.q + (3.609548)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-0.789087)*sailStates.alpha + (0.029921)*sailStates.beta + (0.821306)*sailStates.p + (-4.351280)*sailStates.q + (0.025163)*sailStates.r + (-0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end