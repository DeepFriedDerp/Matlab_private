function [aeroForces] = paramSpace_1_1_1_3_3_1_3(sailStates,airStates)

	CL = (4.245111)*sailStates.alpha + (-0.350017)*sailStates.beta + (-2.769421)*sailStates.p + (39.337448)*sailStates.q + (-1.762164)*sailStates.r + (0.011035)*sailStates.de;
	CD = -0.247710;
	CY = (0.019554)*sailStates.alpha + (-0.026671)*sailStates.beta + (-0.626781)*sailStates.p + (0.664999)*sailStates.q + (-0.110582)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.563888)*sailStates.alpha + (0.178908)*sailStates.beta + (-1.422010)*sailStates.p + (12.904059)*sailStates.q + (-1.429399)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-12.826447)*sailStates.alpha + (1.356849)*sailStates.beta + (8.536736)*sailStates.p + (-141.044128)*sailStates.q + (5.907278)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.231348)*sailStates.alpha + (0.051726)*sailStates.beta + (1.169202)*sailStates.p + (-4.791381)*sailStates.q + (-0.001814)*sailStates.r + (-0.000274)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end