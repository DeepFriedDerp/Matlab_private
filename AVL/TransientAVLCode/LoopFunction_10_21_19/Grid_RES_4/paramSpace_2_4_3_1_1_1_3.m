function [aeroForces] = paramSpace_2_4_3_1_1_1_3(sailStates,airStates)

	CL = (5.153967)*sailStates.alpha + (0.530758)*sailStates.beta + (-3.507017)*sailStates.p + (44.428017)*sailStates.q + (-2.221717)*sailStates.r + (0.011891)*sailStates.de;
	CD = -1.815280;
	CY = (-0.514318)*sailStates.alpha + (-0.026201)*sailStates.beta + (-0.879566)*sailStates.p + (-1.471501)*sailStates.q + (-0.057702)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.199733)*sailStates.alpha + (0.641941)*sailStates.beta + (-1.901727)*sailStates.p + (16.486378)*sailStates.q + (-2.023983)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-11.222220)*sailStates.alpha + (-2.058808)*sailStates.beta + (11.346090)*sailStates.p + (-161.242615)*sailStates.q + (7.536119)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.304398)*sailStates.alpha + (0.031713)*sailStates.beta + (1.914707)*sailStates.p + (-7.232727)*sailStates.q + (0.001083)*sailStates.r + (0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end