function [aeroForces] = paramSpace_2_1_4_2_3_1_1(sailStates,airStates)

	CL = (4.716949)*sailStates.alpha + (-0.292850)*sailStates.beta + (-2.163823)*sailStates.p + (32.669888)*sailStates.q + (-1.476180)*sailStates.r + (0.010971)*sailStates.de;
	CD = -0.585340;
	CY = (0.192305)*sailStates.alpha + (-0.025288)*sailStates.beta + (-0.637848)*sailStates.p + (0.668514)*sailStates.q + (-0.041736)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.438713)*sailStates.alpha + (0.193797)*sailStates.beta + (-0.922811)*sailStates.p + (7.598683)*sailStates.q + (-1.260197)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.211033)*sailStates.alpha + (1.041704)*sailStates.beta + (7.039311)*sailStates.p + (-124.743294)*sailStates.q + (4.967327)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.656058)*sailStates.alpha + (0.020836)*sailStates.beta + (1.379397)*sailStates.p + (-6.738953)*sailStates.q + (0.011443)*sailStates.r + (-0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end