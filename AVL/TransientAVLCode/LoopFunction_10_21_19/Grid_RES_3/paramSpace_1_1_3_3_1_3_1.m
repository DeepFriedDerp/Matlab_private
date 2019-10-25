function [aeroForces] = paramSpace_1_1_3_3_1_3_1(sailStates,airStates)

	CL = (4.053025)*sailStates.alpha + (0.025045)*sailStates.beta + (-2.202004)*sailStates.p + (30.671144)*sailStates.q + (0.011931)*sailStates.r + (0.010182)*sailStates.de;
	CD = -0.155480;
	CY = (-0.104376)*sailStates.alpha + (-0.023320)*sailStates.beta + (0.232687)*sailStates.p + (-0.665001)*sailStates.q + (0.040966)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.200078)*sailStates.alpha + (-0.087187)*sailStates.beta + (-0.996053)*sailStates.p + (7.799239)*sailStates.q + (0.213186)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-14.955574)*sailStates.alpha + (-0.184355)*sailStates.beta + (7.982449)*sailStates.p + (-128.181442)*sailStates.q + (-0.011792)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.404365)*sailStates.alpha + (-0.021645)*sailStates.beta + (-0.639911)*sailStates.p + (3.768630)*sailStates.q + (-0.044434)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end