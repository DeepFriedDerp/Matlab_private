function [aeroForces] = paramSpace_4_3_1_3_1_2_3(sailStates,airStates)

	CL = (3.961991)*sailStates.alpha + (-0.068682)*sailStates.beta + (-2.717574)*sailStates.p + (37.426414)*sailStates.q + (1.199197)*sailStates.r + (0.010891)*sailStates.de;
	CD = 0.043460;
	CY = (-0.054223)*sailStates.alpha + (-0.024320)*sailStates.beta + (0.308666)*sailStates.p + (-0.684402)*sailStates.q + (-0.061324)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.329325)*sailStates.alpha + (-0.153547)*sailStates.beta + (-1.344662)*sailStates.p + (11.712214)*sailStates.q + (0.824075)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-13.922516)*sailStates.alpha + (0.215541)*sailStates.beta + (8.828643)*sailStates.p + (-141.172913)*sailStates.q + (-3.977477)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.144661)*sailStates.alpha + (0.025727)*sailStates.beta + (-0.466620)*sailStates.p + (1.868695)*sailStates.q + (-0.018307)*sailStates.r + (0.000255)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end