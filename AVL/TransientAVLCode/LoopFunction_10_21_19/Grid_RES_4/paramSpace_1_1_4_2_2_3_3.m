function [aeroForces] = paramSpace_1_1_4_2_2_3_3(sailStates,airStates)

	CL = (4.089880)*sailStates.alpha + (0.042683)*sailStates.beta + (-2.772733)*sailStates.p + (34.641026)*sailStates.q + (-0.098487)*sailStates.r + (0.010089)*sailStates.de;
	CD = -0.316310;
	CY = (0.073734)*sailStates.alpha + (-0.025650)*sailStates.beta + (0.222534)*sailStates.p + (0.301044)*sailStates.q + (0.044297)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.424608)*sailStates.alpha + (-0.133473)*sailStates.beta + (-1.495634)*sailStates.p + (12.533773)*sailStates.q + (0.174911)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-14.775722)*sailStates.alpha + (-0.299147)*sailStates.beta + (10.044866)*sailStates.p + (-144.677322)*sailStates.q + (0.366538)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.119931)*sailStates.alpha + (-0.032729)*sailStates.beta + (-0.765751)*sailStates.p + (4.161559)*sailStates.q + (-0.058740)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end