function [aeroForces] = paramSpace_2_1_1_3_2_1_3(sailStates,airStates)

	CL = (4.185215)*sailStates.alpha + (-0.258306)*sailStates.beta + (-2.823984)*sailStates.p + (37.616959)*sailStates.q + (-1.031282)*sailStates.r + (0.011112)*sailStates.de;
	CD = -0.188360;
	CY = (-0.036732)*sailStates.alpha + (-0.024876)*sailStates.beta + (-0.416314)*sailStates.p + (0.065300)*sailStates.q + (-0.027294)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.462672)*sailStates.alpha + (0.134231)*sailStates.beta + (-1.465466)*sailStates.p + (12.496384)*sailStates.q + (-0.904626)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-13.955100)*sailStates.alpha + (1.069011)*sailStates.beta + (9.408576)*sailStates.p + (-143.297119)*sailStates.q + (3.527060)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.142731)*sailStates.alpha + (0.013907)*sailStates.beta + (0.830955)*sailStates.p + (-3.370915)*sailStates.q + (0.001173)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end