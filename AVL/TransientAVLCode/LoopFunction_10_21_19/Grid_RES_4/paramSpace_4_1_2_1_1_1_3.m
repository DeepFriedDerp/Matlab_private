function [aeroForces] = paramSpace_4_1_2_1_1_1_3(sailStates,airStates)

	CL = (4.794703)*sailStates.alpha + (-0.222206)*sailStates.beta + (-3.094833)*sailStates.p + (34.595802)*sailStates.q + (-0.508868)*sailStates.r + (0.009374)*sailStates.de;
	CD = -1.484380;
	CY = (-0.431204)*sailStates.alpha + (-0.031949)*sailStates.beta + (-0.449559)*sailStates.p + (-2.326708)*sailStates.q + (0.089506)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (1.339175)*sailStates.alpha + (0.292114)*sailStates.beta + (-1.816847)*sailStates.p + (15.153802)*sailStates.q + (-0.788501)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-14.240134)*sailStates.alpha + (0.975863)*sailStates.beta + (11.769600)*sailStates.p + (-155.326050)*sailStates.q + (1.626163)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.612661)*sailStates.alpha + (-0.070174)*sailStates.beta + (1.423939)*sailStates.p + (-6.015626)*sailStates.q + (-0.054705)*sailStates.r + (0.000531)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end