function [aeroForces] = paramSpace_2_1_3_2_1_1_3(sailStates,airStates)

	CL = (4.250248)*sailStates.alpha + (-0.272910)*sailStates.beta + (-2.983546)*sailStates.p + (39.118385)*sailStates.q + (-1.187247)*sailStates.r + (0.011333)*sailStates.de;
	CD = -0.360920;
	CY = (-0.157630)*sailStates.alpha + (-0.024143)*sailStates.beta + (-0.436316)*sailStates.p + (-0.668512)*sailStates.q + (-0.028621)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.401363)*sailStates.alpha + (0.164008)*sailStates.beta + (-1.589468)*sailStates.p + (13.670300)*sailStates.q + (-1.041172)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-13.544703)*sailStates.alpha + (1.034673)*sailStates.beta + (9.898583)*sailStates.p + (-147.557632)*sailStates.q + (4.020988)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (0.348094)*sailStates.alpha + (0.016019)*sailStates.beta + (0.913947)*sailStates.p + (-3.349031)*sailStates.q + (-0.001494)*sailStates.r + (0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end