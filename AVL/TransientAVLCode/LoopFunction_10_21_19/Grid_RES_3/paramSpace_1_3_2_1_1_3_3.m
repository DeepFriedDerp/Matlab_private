function [aeroForces] = paramSpace_1_3_2_1_1_3_3(sailStates,airStates)

	CL = (6.300031)*sailStates.alpha + (-0.317343)*sailStates.beta + (-3.237731)*sailStates.p + (34.940693)*sailStates.q + (1.494352)*sailStates.r + (0.009652)*sailStates.de;
	CD = -2.528640;
	CY = (0.270528)*sailStates.alpha + (-0.027557)*sailStates.beta + (1.011912)*sailStates.p + (-1.081939)*sailStates.q + (0.178427)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.443216)*sailStates.alpha + (-0.540184)*sailStates.beta + (-1.808746)*sailStates.p + (14.079081)*sailStates.q + (1.595525)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-16.069710)*sailStates.alpha + (1.249426)*sailStates.beta + (12.879504)*sailStates.p + (-160.704956)*sailStates.q + (-4.869436)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.693586)*sailStates.alpha + (-0.064344)*sailStates.beta + (-2.558867)*sailStates.p + (13.508963)*sailStates.q + (-0.113627)*sailStates.r + (0.000547)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end