function [aeroForces] = paramSpace_2_4_4_2_3_1_1(sailStates,airStates)

	CL = (4.716949)*sailStates.alpha + (0.292850)*sailStates.beta + (-2.163823)*sailStates.p + (32.669888)*sailStates.q + (-1.476180)*sailStates.r + (0.010971)*sailStates.de;
	CD = -0.585340;
	CY = (0.192305)*sailStates.alpha + (-0.024285)*sailStates.beta + (-0.637848)*sailStates.p + (0.668514)*sailStates.q + (-0.041736)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.277316)*sailStates.alpha + (0.384105)*sailStates.beta + (-0.825107)*sailStates.p + (6.390121)*sailStates.q + (-1.253921)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.211034)*sailStates.alpha + (-1.041704)*sailStates.beta + (7.039311)*sailStates.p + (-124.743294)*sailStates.q + (4.967328)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.743165)*sailStates.alpha + (0.017042)*sailStates.beta + (1.385801)*sailStates.p + (-6.818166)*sailStates.q + (0.011854)*sailStates.r + (-0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end