function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (3.383756)*sailStates.alpha + (0.419214)*sailStates.beta + (-5.323405)*sailStates.p + (52.250313)*sailStates.q + (1.316968)*sailStates.r + (0.010900)*sailStates.de;
	CD = -3.490960;
	CY = (1.410098)*sailStates.alpha + (-0.032168)*sailStates.beta + (0.826582)*sailStates.p + (3.155598)*sailStates.q + (0.108598)*sailStates.r + (0.000707)*sailStates.de;

	Cl = (-0.208959)*sailStates.alpha + (-0.477281)*sailStates.beta + (-3.618408)*sailStates.p + (31.562664)*sailStates.q + (1.509484)*sailStates.r + (0.004554)*sailStates.de;
	Cm = (-1.446826)*sailStates.alpha + (-1.692856)*sailStates.beta + (19.420704)*sailStates.p + (-216.953018)*sailStates.q + (-4.390203)*sailStates.r + (-0.078710)*sailStates.de;
	Cn = (-5.010961)*sailStates.alpha + (-0.079027)*sailStates.beta + (-2.435091)*sailStates.p + (10.811844)*sailStates.q + (-0.058854)*sailStates.r + (-0.000571)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end