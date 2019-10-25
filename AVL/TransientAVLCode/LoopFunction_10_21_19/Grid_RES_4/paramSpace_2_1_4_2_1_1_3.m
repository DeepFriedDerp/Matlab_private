function [aeroForces] = paramSpace_2_1_4_2_1_1_3(sailStates,airStates)

	CL = (4.245159)*sailStates.alpha + (-0.251030)*sailStates.beta + (-2.983833)*sailStates.p + (39.101818)*sailStates.q + (-1.177833)*sailStates.r + (0.011364)*sailStates.de;
	CD = -0.345460;
	CY = (-0.155133)*sailStates.alpha + (-0.024285)*sailStates.beta + (-0.421343)*sailStates.p + (-0.668512)*sailStates.q + (-0.027687)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.405155)*sailStates.alpha + (0.157914)*sailStates.beta + (-1.589605)*sailStates.p + (13.669552)*sailStates.q + (-1.016967)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-13.617030)*sailStates.alpha + (0.897275)*sailStates.beta + (9.902143)*sailStates.p + (-147.557632)*sailStates.q + (3.966662)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (0.338218)*sailStates.alpha + (0.015683)*sailStates.beta + (0.891843)*sailStates.p + (-3.337635)*sailStates.q + (-0.001509)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end