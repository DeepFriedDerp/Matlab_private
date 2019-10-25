function [aeroForces] = paramSpace_4_2_2_1_3_1_3(sailStates,airStates)

	CL = (6.248937)*sailStates.alpha + (-0.113377)*sailStates.beta + (-3.211965)*sailStates.p + (34.315716)*sailStates.q + (-1.353733)*sailStates.r + (0.009552)*sailStates.de;
	CD = -2.488020;
	CY = (-0.270012)*sailStates.alpha + (-0.023945)*sailStates.beta + (-0.976980)*sailStates.p + (1.002333)*sailStates.q + (0.194298)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (2.483857)*sailStates.alpha + (0.421933)*sailStates.beta + (-1.855420)*sailStates.p + (14.660269)*sailStates.q + (-1.489261)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-16.356197)*sailStates.alpha + (0.454986)*sailStates.beta + (12.971971)*sailStates.p + (-161.102386)*sailStates.q + (4.354108)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (0.694293)*sailStates.alpha + (-0.096385)*sailStates.beta + (2.531533)*sailStates.p + (-13.506383)*sailStates.q + (-0.133925)*sailStates.r + (-0.000512)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end