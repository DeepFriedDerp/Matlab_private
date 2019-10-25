function [aeroForces] = paramSpace_2_1_2_3_1_1_3(sailStates,airStates)

	CL = (4.104311)*sailStates.alpha + (-0.218734)*sailStates.beta + (-2.829264)*sailStates.p + (37.572910)*sailStates.q + (-0.892098)*sailStates.r + (0.011144)*sailStates.de;
	CD = -0.142090;
	CY = (-0.089150)*sailStates.alpha + (-0.024279)*sailStates.beta + (-0.320853)*sailStates.p + (-0.432842)*sailStates.q + (-0.021015)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.384575)*sailStates.alpha + (0.116495)*sailStates.beta + (-1.468717)*sailStates.p + (12.486928)*sailStates.q + (-0.774296)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-13.913563)*sailStates.alpha + (0.870497)*sailStates.beta + (9.469221)*sailStates.p + (-143.531296)*sailStates.q + (3.039938)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.186244)*sailStates.alpha + (0.011344)*sailStates.beta + (0.643506)*sailStates.p + (-2.240948)*sailStates.q + (-0.002325)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end