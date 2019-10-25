function [aeroForces] = paramSpace_1_4_3_2_2_1_2(sailStates,airStates)

	CL = (4.476188)*sailStates.alpha + (0.431185)*sailStates.beta + (-2.538839)*sailStates.p + (38.591778)*sailStates.q + (-1.997382)*sailStates.r + (0.011225)*sailStates.de;
	CD = -0.488650;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.681506)*sailStates.p + (0.000000)*sailStates.q + (-0.135560)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.313825)*sailStates.alpha + (0.465592)*sailStates.beta + (-1.131633)*sailStates.p + (10.187457)*sailStates.q + (-1.599656)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.210909)*sailStates.alpha + (-1.576721)*sailStates.beta + (7.445393)*sailStates.p + (-133.820877)*sailStates.q + (6.626620)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.087647)*sailStates.alpha + (0.065349)*sailStates.beta + (1.371083)*sailStates.p + (-5.569715)*sailStates.q + (-0.000712)*sailStates.r + (-0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end