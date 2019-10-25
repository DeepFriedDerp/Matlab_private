function [aeroForces] = paramSpace_1_4_3_1_3_3_3(sailStates,airStates)

	CL = (4.794703)*sailStates.alpha + (-0.222206)*sailStates.beta + (-3.094832)*sailStates.p + (34.595802)*sailStates.q + (0.508867)*sailStates.r + (0.009374)*sailStates.de;
	CD = -1.484380;
	CY = (0.431204)*sailStates.alpha + (-0.017623)*sailStates.beta + (0.449559)*sailStates.p + (2.326708)*sailStates.q + (0.089506)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.209257)*sailStates.alpha + (-0.340556)*sailStates.beta + (-1.722457)*sailStates.p + (13.965906)*sailStates.q + (0.807233)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-14.240134)*sailStates.alpha + (0.975864)*sailStates.beta + (11.769600)*sailStates.p + (-155.326050)*sailStates.q + (-1.626162)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-0.552416)*sailStates.alpha + (-0.055671)*sailStates.beta + (-1.405164)*sailStates.p + (5.779339)*sailStates.q + (-0.050979)*sailStates.r + (-0.000531)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end