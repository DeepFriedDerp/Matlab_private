function [aeroForces] = paramSpace_1_3_1_1_1_2_3(sailStates,airStates)

	CL = (3.356245)*sailStates.alpha + (0.171535)*sailStates.beta + (-3.388518)*sailStates.p + (42.059544)*sailStates.q + (-0.763862)*sailStates.r + (0.010961)*sailStates.de;
	CD = 0.092570;
	CY = (-0.149366)*sailStates.alpha + (-0.027824)*sailStates.beta + (-0.044026)*sailStates.p + (-1.081940)*sailStates.q + (-0.007660)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.165899)*sailStates.alpha + (0.116366)*sailStates.beta + (-1.856301)*sailStates.p + (15.945729)*sailStates.q + (-0.523057)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-12.246301)*sailStates.alpha + (-0.695536)*sailStates.beta + (11.555103)*sailStates.p + (-160.704956)*sailStates.q + (2.641615)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (0.408250)*sailStates.alpha + (0.020821)*sailStates.beta + (-0.178907)*sailStates.p + (2.922673)*sailStates.q + (-0.066437)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end