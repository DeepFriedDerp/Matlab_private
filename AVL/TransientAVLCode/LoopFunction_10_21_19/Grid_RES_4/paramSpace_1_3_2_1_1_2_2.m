function [aeroForces] = paramSpace_1_3_2_1_1_2_2(sailStates,airStates)

	CL = (3.805398)*sailStates.alpha + (0.052427)*sailStates.beta + (-2.528901)*sailStates.p + (35.032261)*sailStates.q + (-0.564595)*sailStates.r + (0.010600)*sailStates.de;
	CD = 0.063990;
	CY = (-0.202270)*sailStates.alpha + (-0.026804)*sailStates.beta + (0.035566)*sailStates.p + (-1.664521)*sailStates.q + (0.007134)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.134496)*sailStates.alpha + (0.060196)*sailStates.beta + (-1.177710)*sailStates.p + (9.622707)*sailStates.q + (-0.336196)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-13.835888)*sailStates.alpha + (-0.204530)*sailStates.beta + (8.736550)*sailStates.p + (-137.222183)*sailStates.q + (1.962859)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.383961)*sailStates.alpha + (0.013163)*sailStates.beta + (-0.235492)*sailStates.p + (3.061360)*sailStates.q + (-0.067236)*sailStates.r + (0.000493)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end