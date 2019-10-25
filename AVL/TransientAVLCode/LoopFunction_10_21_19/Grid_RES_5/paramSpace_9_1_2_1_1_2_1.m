function [aeroForces] = paramSpace_9_1_2_1_1_2_1(sailStates,airStates)

	CL = (5.170902)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.077627)*sailStates.p + (31.687256)*sailStates.q + (1.674459)*sailStates.r + (0.011035)*sailStates.de;
	CD = -0.961170;
	CY = (-0.282605)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.786830)*sailStates.p + (-0.910012)*sailStates.q + (-0.027445)*sailStates.r + (-0.000195)*sailStates.de;

	Cl = (1.484774)*sailStates.alpha + (-0.356577)*sailStates.beta + (-0.797609)*sailStates.p + (6.143226)*sailStates.q + (1.488795)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.714278)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.892860)*sailStates.p + (-123.255226)*sailStates.q + (-5.669473)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (1.044969)*sailStates.alpha + (0.012452)*sailStates.beta + (-1.719976)*sailStates.p + (8.481474)*sailStates.q + (0.008986)*sailStates.r + (0.000394)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end