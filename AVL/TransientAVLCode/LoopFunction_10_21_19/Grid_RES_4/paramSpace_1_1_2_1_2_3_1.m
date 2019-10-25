function [aeroForces] = paramSpace_1_1_2_1_2_3_1(sailStates,airStates)

	CL = (5.364718)*sailStates.alpha + (0.355943)*sailStates.beta + (-1.438861)*sailStates.p + (19.840591)*sailStates.q + (1.612665)*sailStates.r + (0.008512)*sailStates.de;
	CD = -2.050220;
	CY = (-0.413316)*sailStates.alpha + (-0.022610)*sailStates.beta + (0.910185)*sailStates.p + (-0.662189)*sailStates.q + (0.181071)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (1.098313)*sailStates.alpha + (-0.310924)*sailStates.beta + (-0.447966)*sailStates.p + (1.595206)*sailStates.q + (1.676357)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-16.057545)*sailStates.alpha + (-1.356377)*sailStates.beta + (6.825735)*sailStates.p + (-109.940704)*sailStates.q + (-5.234093)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (1.940007)*sailStates.alpha + (-0.096922)*sailStates.beta + (-2.121225)*sailStates.p + (10.138720)*sailStates.q + (-0.070794)*sailStates.r + (0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end