function [aeroForces] = paramSpace_1_4_4_2_2_3_3(sailStates,airStates)

	CL = (4.089880)*sailStates.alpha + (-0.042683)*sailStates.beta + (-2.772733)*sailStates.p + (34.641022)*sailStates.q + (-0.098487)*sailStates.r + (0.010089)*sailStates.de;
	CD = -0.316310;
	CY = (0.073734)*sailStates.alpha + (-0.023922)*sailStates.beta + (0.222534)*sailStates.p + (0.301044)*sailStates.q + (0.044297)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.288988)*sailStates.alpha + (-0.114288)*sailStates.beta + (-1.401228)*sailStates.p + (11.345889)*sailStates.q + (0.193562)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-14.775723)*sailStates.alpha + (0.299147)*sailStates.beta + (10.044865)*sailStates.p + (-144.677322)*sailStates.q + (0.366538)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.126397)*sailStates.alpha + (-0.016553)*sailStates.beta + (-0.746972)*sailStates.p + (3.925274)*sailStates.q + (-0.055030)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end