function [aeroForces] = paramSpace_1_3_3_1_2_3_3(sailStates,airStates)

	CL = (5.513709)*sailStates.alpha + (-0.288827)*sailStates.beta + (-3.194762)*sailStates.p + (35.127251)*sailStates.q + (1.077434)*sailStates.r + (0.009749)*sailStates.de;
	CD = -2.006640;
	CY = (0.352060)*sailStates.alpha + (-0.023492)*sailStates.beta + (0.764863)*sailStates.p + (0.589405)*sailStates.q + (0.134922)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.726244)*sailStates.alpha + (-0.460728)*sailStates.beta + (-1.781830)*sailStates.p + (14.154008)*sailStates.q + (1.275377)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-15.063993)*sailStates.alpha + (1.233314)*sailStates.beta + (12.383606)*sailStates.p + (-158.590927)*sailStates.q + (-3.546512)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.661700)*sailStates.alpha + (-0.060423)*sailStates.beta + (-2.029232)*sailStates.p + (9.732781)*sailStates.q + (-0.077937)*sailStates.r + (0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end