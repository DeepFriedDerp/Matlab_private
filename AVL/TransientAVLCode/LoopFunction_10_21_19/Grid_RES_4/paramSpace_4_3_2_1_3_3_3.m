function [aeroForces] = paramSpace_4_3_2_1_3_3_3(sailStates,airStates)

	CL = (5.078396)*sailStates.alpha + (-0.235757)*sailStates.beta + (-3.551986)*sailStates.p + (50.179935)*sailStates.q + (3.150182)*sailStates.r + (0.012741)*sailStates.de;
	CD = -1.862340;
	CY = (0.560106)*sailStates.alpha + (-0.026007)*sailStates.beta + (1.087061)*sailStates.p + (1.002333)*sailStates.q + (-0.216266)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.133741)*sailStates.alpha + (-0.654172)*sailStates.beta + (-1.931421)*sailStates.p + (18.451786)*sailStates.q + (2.681526)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-8.642096)*sailStates.alpha + (0.880312)*sailStates.beta + (10.026878)*sailStates.p + (-161.102386)*sailStates.q + (-10.451873)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-1.792447)*sailStates.alpha + (0.116382)*sailStates.beta + (-2.171048)*sailStates.p + (7.629480)*sailStates.q + (-0.025071)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end