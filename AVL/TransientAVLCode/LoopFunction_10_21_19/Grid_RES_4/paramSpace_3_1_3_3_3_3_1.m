function [aeroForces] = paramSpace_3_1_3_3_3_3_1(sailStates,airStates)

	CL = (4.121759)*sailStates.alpha + (0.209233)*sailStates.beta + (-2.308820)*sailStates.p + (33.356022)*sailStates.q + (0.823377)*sailStates.r + (0.010893)*sailStates.de;
	CD = -0.140360;
	CY = (0.038448)*sailStates.alpha + (-0.024125)*sailStates.beta + (0.299669)*sailStates.p + (0.563442)*sailStates.q + (-0.019622)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.171975)*sailStates.alpha + (-0.117994)*sailStates.beta + (-1.043557)*sailStates.p + (8.541555)*sailStates.q + (0.718277)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-13.980000)*sailStates.alpha + (-0.838004)*sailStates.beta + (7.731895)*sailStates.p + (-129.238037)*sailStates.q + (-2.808620)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.104357)*sailStates.alpha + (0.011089)*sailStates.beta + (-0.627964)*sailStates.p + (2.206202)*sailStates.q + (-0.001504)*sailStates.r + (-0.000115)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end