function [aeroForces] = paramSpace_4_3_2_1_3_1_3(sailStates,airStates)

	CL = (6.248937)*sailStates.alpha + (0.113377)*sailStates.beta + (-3.211965)*sailStates.p + (34.315720)*sailStates.q + (-1.353733)*sailStates.r + (0.009552)*sailStates.de;
	CD = -2.488020;
	CY = (-0.270012)*sailStates.alpha + (-0.026007)*sailStates.beta + (-0.976980)*sailStates.p + (1.002333)*sailStates.q + (0.194298)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (2.440079)*sailStates.alpha + (0.474956)*sailStates.beta + (-1.823877)*sailStates.p + (14.263307)*sailStates.q + (-1.495521)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-16.356197)*sailStates.alpha + (-0.454986)*sailStates.beta + (12.971972)*sailStates.p + (-161.102386)*sailStates.q + (4.354112)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (0.662311)*sailStates.alpha + (-0.082018)*sailStates.beta + (2.525259)*sailStates.p + (-13.427423)*sailStates.q + (-0.132680)*sailStates.r + (-0.000512)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end