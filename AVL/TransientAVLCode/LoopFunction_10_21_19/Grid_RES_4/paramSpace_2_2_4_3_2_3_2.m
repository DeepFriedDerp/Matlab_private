function [aeroForces] = paramSpace_2_2_4_3_2_3_2(sailStates,airStates)

	CL = (4.241420)*sailStates.alpha + (0.038407)*sailStates.beta + (-2.550003)*sailStates.p + (34.163258)*sailStates.q + (0.332114)*sailStates.r + (0.010929)*sailStates.de;
	CD = -0.159350;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.255176)*sailStates.p + (-0.000000)*sailStates.q + (0.016725)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.319102)*sailStates.alpha + (-0.120153)*sailStates.beta + (-1.219162)*sailStates.p + (9.781230)*sailStates.q + (0.416730)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.093846)*sailStates.alpha + (-0.183852)*sailStates.beta + (8.906568)*sailStates.p + (-137.194580)*sailStates.q + (-1.157274)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.156541)*sailStates.alpha + (-0.008793)*sailStates.beta + (-0.624764)*sailStates.p + (2.943885)*sailStates.q + (-0.008708)*sailStates.r + (0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end