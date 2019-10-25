function [aeroForces] = paramSpace_2_1_1_2_1_1_1(sailStates,airStates)

	CL = (5.328143)*sailStates.alpha + (-2.782428)*sailStates.beta + (-6.512167)*sailStates.p + (76.286438)*sailStates.q + (5.839355)*sailStates.r + (0.014580)*sailStates.de;
	CD = -9.343760;
	CY = (3.876382)*sailStates.alpha + (-0.026937)*sailStates.beta + (2.363976)*sailStates.p + (0.442405)*sailStates.q + (-0.311067)*sailStates.r + (0.000098)*sailStates.de;

	Cl = (-1.889890)*sailStates.alpha + (-2.009442)*sailStates.beta + (-4.251253)*sailStates.p + (40.299488)*sailStates.q + (5.293540)*sailStates.r + (0.005345)*sailStates.de;
	Cm = (13.718333)*sailStates.alpha + (11.213398)*sailStates.beta + (19.104433)*sailStates.p + (-238.540329)*sailStates.q + (-19.796913)*sailStates.r + (-0.079192)*sailStates.de;
	Cn = (-14.860805)*sailStates.alpha + (0.151055)*sailStates.beta + (-4.762034)*sailStates.p + (18.414835)*sailStates.q + (-0.000788)*sailStates.r + (0.000439)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end