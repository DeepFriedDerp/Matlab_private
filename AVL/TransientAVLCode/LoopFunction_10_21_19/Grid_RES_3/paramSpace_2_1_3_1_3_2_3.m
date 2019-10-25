function [aeroForces] = paramSpace_2_1_3_1_3_2_3(sailStates,airStates)

	CL = (3.819145)*sailStates.alpha + (-0.028657)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (-0.430913)*sailStates.r + (0.011424)*sailStates.de;
	CD = -0.024710;
	CY = (0.117465)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.254720)*sailStates.p + (1.697131)*sailStates.q + (0.000159)*sailStates.r + (0.000370)*sailStates.de;

	Cl = (1.529432)*sailStates.alpha + (0.034719)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (-0.329876)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-13.690158)*sailStates.alpha + (0.022222)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (1.410367)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (0.038612)*sailStates.alpha + (-0.000668)*sailStates.beta + (0.532915)*sailStates.p + (-3.789398)*sailStates.q + (-0.000461)*sailStates.r + (-0.000560)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end