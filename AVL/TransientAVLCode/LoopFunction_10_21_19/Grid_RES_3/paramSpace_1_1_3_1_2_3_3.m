function [aeroForces] = paramSpace_1_1_3_1_2_3_3(sailStates,airStates)

	CL = (5.513710)*sailStates.alpha + (0.288827)*sailStates.beta + (-3.194761)*sailStates.p + (35.127247)*sailStates.q + (1.077433)*sailStates.r + (0.009749)*sailStates.de;
	CD = -2.006640;
	CY = (0.352060)*sailStates.alpha + (-0.026170)*sailStates.beta + (0.764863)*sailStates.p + (0.589405)*sailStates.q + (0.134922)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.841983)*sailStates.alpha + (-0.348087)*sailStates.beta + (-1.866483)*sailStates.p + (15.214880)*sailStates.q + (1.260551)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-15.063993)*sailStates.alpha + (-1.233315)*sailStates.beta + (12.383604)*sailStates.p + (-158.590912)*sailStates.q + (-3.546511)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.738479)*sailStates.alpha + (-0.082194)*sailStates.beta + (-2.044159)*sailStates.p + (9.919842)*sailStates.q + (-0.080551)*sailStates.r + (0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end