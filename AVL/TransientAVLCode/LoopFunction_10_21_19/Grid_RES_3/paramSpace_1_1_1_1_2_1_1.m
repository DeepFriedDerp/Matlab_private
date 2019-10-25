function [aeroForces] = paramSpace_1_1_1_1_2_1_1(sailStates,airStates)

	CL = (6.197664)*sailStates.alpha + (-0.613633)*sailStates.beta + (-1.777331)*sailStates.p + (34.879105)*sailStates.q + (-2.823502)*sailStates.r + (0.011496)*sailStates.de;
	CD = -2.362590;
	CY = (0.351841)*sailStates.alpha + (-0.023200)*sailStates.beta + (-1.158216)*sailStates.p + (-0.589405)*sailStates.q + (-0.204169)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.372005)*sailStates.alpha + (0.442829)*sailStates.beta + (-0.551843)*sailStates.p + (5.488543)*sailStates.q + (-2.474104)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-9.454649)*sailStates.alpha + (2.398723)*sailStates.beta + (4.140665)*sailStates.p + (-110.634644)*sailStates.q + (9.413173)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-1.940876)*sailStates.alpha + (0.112167)*sailStates.beta + (2.572317)*sailStates.p + (-10.943271)*sailStates.q + (0.034101)*sailStates.r + (0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end