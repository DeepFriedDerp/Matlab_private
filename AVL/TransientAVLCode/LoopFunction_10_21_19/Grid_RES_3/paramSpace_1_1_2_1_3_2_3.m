function [aeroForces] = paramSpace_1_1_2_1_3_2_3(sailStates,airStates)

	CL = (3.903602)*sailStates.alpha + (-0.252905)*sailStates.beta + (-3.301500)*sailStates.p + (42.491066)*sailStates.q + (-1.610485)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.034360;
	CY = (0.090351)*sailStates.alpha + (-0.030527)*sailStates.beta + (-0.557698)*sailStates.p + (2.260755)*sailStates.q + (-0.098337)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.685760)*sailStates.alpha + (0.085173)*sailStates.beta + (-1.886572)*sailStates.p + (17.159039)*sailStates.q + (-1.210646)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-13.243344)*sailStates.alpha + (0.887987)*sailStates.beta + (10.549961)*sailStates.p + (-156.476898)*sailStates.q + (5.363164)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (0.538486)*sailStates.alpha + (0.035510)*sailStates.beta + (0.894672)*sailStates.p + (-4.457348)*sailStates.q + (0.002941)*sailStates.r + (-0.000731)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end