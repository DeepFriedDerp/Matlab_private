function [aeroForces] = paramSpace_2_2_4_1_3_1_1(sailStates,airStates)

	CL = (7.299952)*sailStates.alpha + (-0.200795)*sailStates.beta + (-1.723143)*sailStates.p + (30.529434)*sailStates.q + (-2.870697)*sailStates.r + (0.011219)*sailStates.de;
	CD = -2.909680;
	CY = (0.690316)*sailStates.alpha + (-0.025345)*sailStates.beta + (-1.341421)*sailStates.p + (1.471503)*sailStates.q + (-0.087766)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.230365)*sailStates.alpha + (0.548714)*sailStates.beta + (-0.509529)*sailStates.p + (4.012639)*sailStates.q + (-2.540534)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-14.132232)*sailStates.alpha + (0.748013)*sailStates.beta + (5.119223)*sailStates.p + (-112.102478)*sailStates.q + (9.687766)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.598634)*sailStates.alpha + (0.041562)*sailStates.beta + (2.961769)*sailStates.p + (-14.656473)*sailStates.q + (0.029396)*sailStates.r + (-0.000629)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end