function [aeroForces] = paramSpace_1_4_2_1_2_3_2(sailStates,airStates)

	CL = (5.644206)*sailStates.alpha + (-0.308598)*sailStates.beta + (-2.290959)*sailStates.p + (27.105585)*sailStates.q + (1.269084)*sailStates.r + (0.008872)*sailStates.de;
	CD = -1.973870;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.804849)*sailStates.p + (-0.000000)*sailStates.q + (0.160094)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.544424)*sailStates.alpha + (-0.484148)*sailStates.beta + (-1.053097)*sailStates.p + (7.144338)*sailStates.q + (1.414071)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-16.401426)*sailStates.alpha + (1.196823)*sailStates.beta + (9.577039)*sailStates.p + (-133.820877)*sailStates.q + (-4.089889)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.642591)*sailStates.alpha + (-0.066461)*sailStates.beta + (-2.021853)*sailStates.p + (9.729077)*sailStates.q + (-0.079223)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end