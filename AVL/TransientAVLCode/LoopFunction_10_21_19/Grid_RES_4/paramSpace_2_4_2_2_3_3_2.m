function [aeroForces] = paramSpace_2_4_2_2_3_3_2(sailStates,airStates)

	CL = (4.250459)*sailStates.alpha + (-0.127630)*sailStates.beta + (-2.512931)*sailStates.p + (33.545918)*sailStates.q + (0.472857)*sailStates.r + (0.010616)*sailStates.de;
	CD = -0.306020;
	CY = (0.093627)*sailStates.alpha + (-0.023884)*sailStates.beta + (0.269987)*sailStates.p + (0.769435)*sailStates.q + (0.017669)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.143399)*sailStates.alpha + (-0.196393)*sailStates.beta + (-1.136788)*sailStates.p + (8.802809)*sailStates.q + (0.544375)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.667562)*sailStates.alpha + (0.509159)*sailStates.beta + (8.824205)*sailStates.p + (-135.788696)*sailStates.q + (-1.602812)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.117922)*sailStates.alpha + (-0.010095)*sailStates.beta + (-0.700078)*sailStates.p + (2.861160)*sailStates.q + (-0.005297)*sailStates.r + (-0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end