function [aeroForces] = paramSpace_1_4_4_2_2_3_1(sailStates,airStates)

	CL = (4.121240)*sailStates.alpha + (-0.084987)*sailStates.beta + (-1.997525)*sailStates.p + (28.036745)*sailStates.q + (0.211467)*sailStates.r + (0.009716)*sailStates.de;
	CD = -0.357500;
	CY = (-0.089595)*sailStates.alpha + (-0.025650)*sailStates.beta + (0.317910)*sailStates.p + (-0.301043)*sailStates.q + (0.063204)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (0.932349)*sailStates.alpha + (-0.165748)*sailStates.beta + (-0.765056)*sailStates.p + (5.220256)*sailStates.q + (0.447748)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-15.110798)*sailStates.alpha + (0.439971)*sailStates.beta + (7.540215)*sailStates.p + (-122.964470)*sailStates.q + (-0.658443)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.526295)*sailStates.alpha + (-0.022417)*sailStates.beta + (-0.819628)*sailStates.p + (4.083262)*sailStates.q + (-0.043984)*sailStates.r + (0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end