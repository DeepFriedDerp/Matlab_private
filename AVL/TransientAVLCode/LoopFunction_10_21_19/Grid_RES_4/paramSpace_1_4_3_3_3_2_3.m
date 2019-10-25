function [aeroForces] = paramSpace_1_4_3_3_3_2_3(sailStates,airStates)

	CL = (3.869700)*sailStates.alpha + (0.225195)*sailStates.beta + (-2.697895)*sailStates.p + (37.206886)*sailStates.q + (-1.200699)*sailStates.r + (0.010640)*sailStates.de;
	CD = 0.048030;
	CY = (0.052123)*sailStates.alpha + (-0.022679)*sailStates.beta + (-0.321549)*sailStates.p + (0.684402)*sailStates.q + (-0.063936)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.268577)*sailStates.alpha + (0.211077)*sailStates.beta + (-1.304004)*sailStates.p + (11.243584)*sailStates.q + (-0.836516)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-13.514637)*sailStates.alpha + (-0.773118)*sailStates.beta + (8.756246)*sailStates.p + (-140.146637)*sailStates.q + (4.003565)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.128318)*sailStates.alpha + (0.027328)*sailStates.beta + (0.492440)*sailStates.p + (-1.953353)*sailStates.q + (-0.016919)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end