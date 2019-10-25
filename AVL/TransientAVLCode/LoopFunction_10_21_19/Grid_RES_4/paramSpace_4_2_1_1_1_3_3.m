function [aeroForces] = paramSpace_4_2_1_1_1_3_3(sailStates,airStates)

	CL = (7.581086)*sailStates.alpha + (0.267969)*sailStates.beta + (-3.454737)*sailStates.p + (50.679070)*sailStates.q + (3.992444)*sailStates.r + (0.012799)*sailStates.de;
	CD = -3.081440;
	CY = (0.241570)*sailStates.alpha + (-0.027209)*sailStates.beta + (1.601477)*sailStates.p + (-2.326710)*sailStates.q + (-0.318304)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (3.231685)*sailStates.alpha + (-0.617865)*sailStates.beta + (-1.902266)*sailStates.p + (19.020014)*sailStates.q + (3.363103)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-12.364048)*sailStates.alpha + (-0.965865)*sailStates.beta + (8.897974)*sailStates.p + (-156.352325)*sailStates.q + (-13.148357)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-1.937571)*sailStates.alpha + (0.144751)*sailStates.beta + (-3.258841)*sailStates.p + (15.114073)*sailStates.q + (0.053946)*sailStates.r + (0.001007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end