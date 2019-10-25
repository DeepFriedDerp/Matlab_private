function [aeroForces] = paramSpace_1_1_1_1_1_2_3(sailStates,airStates)

	CL = (3.356246)*sailStates.alpha + (-0.171535)*sailStates.beta + (-3.388517)*sailStates.p + (42.059547)*sailStates.q + (-0.763862)*sailStates.r + (0.010961)*sailStates.de;
	CD = 0.092570;
	CY = (-0.149366)*sailStates.alpha + (-0.021838)*sailStates.beta + (-0.044026)*sailStates.p + (-1.081940)*sailStates.q + (-0.007660)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.258823)*sailStates.alpha + (0.010142)*sailStates.beta + (-1.940919)*sailStates.p + (17.006601)*sailStates.q + (-0.538078)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-12.246302)*sailStates.alpha + (0.695536)*sailStates.beta + (11.555102)*sailStates.p + (-160.704926)*sailStates.q + (2.641615)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (0.440236)*sailStates.alpha + (0.001486)*sailStates.beta + (-0.193828)*sailStates.p + (3.109734)*sailStates.q + (-0.069086)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end