function [aeroForces] = paramSpace_1_2_1_2_2_1_1(sailStates,airStates)

	CL = (7.594728)*sailStates.alpha + (-0.543773)*sailStates.beta + (-2.580727)*sailStates.p + (29.351545)*sailStates.q + (0.528811)*sailStates.r + (0.008682)*sailStates.de;
	CD = -5.013580;
	CY = (1.813313)*sailStates.alpha + (0.000491)*sailStates.beta + (-0.119529)*sailStates.p + (14.786492)*sailStates.q + (-0.013642)*sailStates.r + (0.003150)*sailStates.de;

	Cl = (-2.039136)*sailStates.alpha + (-0.562322)*sailStates.beta + (-1.375605)*sailStates.p + (11.209964)*sailStates.q + (1.140500)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-11.985160)*sailStates.alpha + (2.540690)*sailStates.beta + (9.442240)*sailStates.p + (-138.645599)*sailStates.q + (-1.996419)*sailStates.r + (-0.068459)*sailStates.de;
	Cn = (-1.902544)*sailStates.alpha + (-0.086269)*sailStates.beta + (-0.333689)*sailStates.p + (-9.023571)*sailStates.q + (0.126149)*sailStates.r + (-0.004158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end