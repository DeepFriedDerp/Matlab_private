function [aeroForces] = paramSpace_1_1_1_3_1_2_1(sailStates,airStates)

	CL = (3.772211)*sailStates.alpha + (-0.160013)*sailStates.beta + (-2.245095)*sailStates.p + (32.859119)*sailStates.q + (-0.668970)*sailStates.r + (0.010384)*sailStates.de;
	CD = 0.081010;
	CY = (-0.070238)*sailStates.alpha + (-0.022991)*sailStates.beta + (-0.110127)*sailStates.p + (-0.665000)*sailStates.q + (-0.019355)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.106624)*sailStates.alpha + (0.043805)*sailStates.beta + (-1.009371)*sailStates.p + (8.351920)*sailStates.q + (-0.461566)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-13.523772)*sailStates.alpha + (0.653452)*sailStates.beta + (7.575596)*sailStates.p + (-128.181442)*sailStates.q + (2.295588)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.153598)*sailStates.alpha + (0.010135)*sailStates.beta + (0.108045)*sailStates.p + (0.634215)*sailStates.q + (-0.031257)*sailStates.r + (0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end