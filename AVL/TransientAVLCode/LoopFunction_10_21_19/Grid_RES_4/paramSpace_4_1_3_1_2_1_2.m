function [aeroForces] = paramSpace_4_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.644206)*sailStates.alpha + (-0.308598)*sailStates.beta + (-2.290959)*sailStates.p + (27.105585)*sailStates.q + (-1.269083)*sailStates.r + (0.008872)*sailStates.de;
	CD = -1.973870;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.804849)*sailStates.p + (0.000000)*sailStates.q + (0.160094)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.709496)*sailStates.alpha + (0.317718)*sailStates.beta + (-1.147470)*sailStates.p + (8.332219)*sailStates.q + (-1.395256)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-16.401424)*sailStates.alpha + (1.196823)*sailStates.beta + (9.577038)*sailStates.p + (-133.820877)*sailStates.q + (4.089889)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.566215)*sailStates.alpha + (-0.093040)*sailStates.beta + (2.040625)*sailStates.p + (-9.965362)*sailStates.q + (-0.082965)*sailStates.r + (-0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end