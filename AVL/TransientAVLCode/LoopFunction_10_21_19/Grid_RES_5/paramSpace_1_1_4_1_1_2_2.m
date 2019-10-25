function [aeroForces] = paramSpace_1_1_4_1_1_2_2(sailStates,airStates)

	CL = (4.391676)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.826419)*sailStates.p + (33.772575)*sailStates.q + (0.101401)*sailStates.r + (0.009711)*sailStates.de;
	CD = -0.673310;
	CY = (0.039962)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.412952)*sailStates.p + (-0.476206)*sailStates.q + (0.102909)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.562544)*sailStates.alpha + (-0.187754)*sailStates.beta + (-1.516743)*sailStates.p + (12.322744)*sailStates.q + (0.404187)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-15.407547)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.818004)*sailStates.p + (-148.858078)*sailStates.q + (-0.186034)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (0.154737)*sailStates.alpha + (-0.046812)*sailStates.beta + (-1.258989)*sailStates.p + (7.243681)*sailStates.q + (-0.119128)*sailStates.r + (0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end