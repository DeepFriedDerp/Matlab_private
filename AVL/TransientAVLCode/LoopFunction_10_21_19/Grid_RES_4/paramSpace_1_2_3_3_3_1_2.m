function [aeroForces] = paramSpace_1_2_3_3_3_1_2(sailStates,airStates)

	CL = (4.351881)*sailStates.alpha + (-0.122401)*sailStates.beta + (-2.515980)*sailStates.p + (37.667713)*sailStates.q + (-1.768789)*sailStates.r + (0.011138)*sailStates.de;
	CD = -0.254220;
	CY = (0.066406)*sailStates.alpha + (-0.025480)*sailStates.beta + (-0.595315)*sailStates.p + (0.489621)*sailStates.q + (-0.118398)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.446246)*sailStates.alpha + (0.239410)*sailStates.beta + (-1.185829)*sailStates.p + (10.744670)*sailStates.q + (-1.384916)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-13.035059)*sailStates.alpha + (0.440678)*sailStates.beta + (7.576266)*sailStates.p + (-134.148560)*sailStates.q + (5.868414)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.050104)*sailStates.alpha + (0.055897)*sailStates.beta + (1.148110)*sailStates.p + (-4.841508)*sailStates.q + (-0.000237)*sailStates.r + (-0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end