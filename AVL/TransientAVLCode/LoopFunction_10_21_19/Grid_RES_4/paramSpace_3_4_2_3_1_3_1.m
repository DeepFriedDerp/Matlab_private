function [aeroForces] = paramSpace_3_4_2_3_1_3_1(sailStates,airStates)

	CL = (4.325068)*sailStates.alpha + (-0.223910)*sailStates.beta + (-2.299014)*sailStates.p + (33.394657)*sailStates.q + (1.075315)*sailStates.r + (0.010921)*sailStates.de;
	CD = -0.242100;
	CY = (-0.103097)*sailStates.alpha + (-0.024370)*sailStates.beta + (0.445953)*sailStates.p + (-0.432841)*sailStates.q + (-0.029214)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.180924)*sailStates.alpha + (-0.272218)*sailStates.beta + (-0.939732)*sailStates.p + (7.349639)*sailStates.q + (0.900907)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.261199)*sailStates.alpha + (0.825553)*sailStates.beta + (7.620646)*sailStates.p + (-128.769608)*sailStates.q + (-3.629723)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.384925)*sailStates.alpha + (0.011995)*sailStates.beta + (-0.943288)*sailStates.p + (4.510931)*sailStates.q + (0.006770)*sailStates.r + (0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end