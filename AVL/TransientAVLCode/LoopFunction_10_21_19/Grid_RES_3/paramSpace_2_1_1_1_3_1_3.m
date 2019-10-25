function [aeroForces] = paramSpace_2_1_1_1_3_1_3(sailStates,airStates)

	CL = (7.144623)*sailStates.alpha + (-0.541196)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (-2.676184)*sailStates.r + (0.011424)*sailStates.de;
	CD = -2.939530;
	CY = (-0.282201)*sailStates.alpha + (-0.025257)*sailStates.beta + (-1.347458)*sailStates.p + (1.697131)*sailStates.q + (-0.000159)*sailStates.r + (0.000370)*sailStates.de;

	Cl = (2.974243)*sailStates.alpha + (0.444041)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (-2.473597)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-15.099621)*sailStates.alpha + (2.164915)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (9.116559)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (1.372597)*sailStates.alpha + (0.000792)*sailStates.beta + (2.951446)*sailStates.p + (-14.554399)*sailStates.q + (-0.000079)*sailStates.r + (-0.000752)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end