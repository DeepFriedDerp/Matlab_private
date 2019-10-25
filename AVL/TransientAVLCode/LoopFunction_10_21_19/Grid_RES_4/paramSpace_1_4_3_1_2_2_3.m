function [aeroForces] = paramSpace_1_4_3_1_2_2_3(sailStates,airStates)

	CL = (3.484163)*sailStates.alpha + (0.240891)*sailStates.beta + (-3.313969)*sailStates.p + (42.253708)*sailStates.q + (-1.316920)*sailStates.r + (0.010967)*sailStates.de;
	CD = 0.082970;
	CY = (-0.035722)*sailStates.alpha + (-0.022747)*sailStates.beta + (-0.317935)*sailStates.p + (0.662188)*sailStates.q + (-0.063217)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.247813)*sailStates.alpha + (0.224437)*sailStates.beta + (-1.806802)*sailStates.p + (15.973428)*sailStates.q + (-0.931496)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-12.450833)*sailStates.alpha + (-0.826619)*sailStates.beta + (10.867126)*sailStates.p + (-157.701080)*sailStates.q + (4.400337)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.480848)*sailStates.alpha + (0.030155)*sailStates.beta + (0.384935)*sailStates.p + (-0.961833)*sailStates.q + (-0.037301)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end