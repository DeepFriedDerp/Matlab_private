function [aeroForces] = paramSpace_2_3_1_2_2_1_3(sailStates,airStates)

	CL = (4.509450)*sailStates.alpha + (0.115276)*sailStates.beta + (-2.994768)*sailStates.p + (39.460346)*sailStates.q + (-1.409532)*sailStates.r + (0.011440)*sailStates.de;
	CD = -0.484510;
	CY = (-0.085791)*sailStates.alpha + (-0.024930)*sailStates.beta + (-0.591394)*sailStates.p + (0.100922)*sailStates.q + (-0.038773)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.505847)*sailStates.alpha + (0.322716)*sailStates.beta + (-1.528402)*sailStates.p + (12.953506)*sailStates.q + (-1.251360)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-13.881960)*sailStates.alpha + (-0.470520)*sailStates.beta + (9.869746)*sailStates.p + (-148.239990)*sailStates.q + (4.809561)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.257617)*sailStates.alpha + (0.018698)*sailStates.beta + (1.218940)*sailStates.p + (-5.154268)*sailStates.q + (0.004133)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end