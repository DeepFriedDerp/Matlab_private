function [aeroForces] = paramSpace_2_2_3_1_3_3_3(sailStates,airStates)

	CL = (5.152737)*sailStates.alpha + (0.127678)*sailStates.beta + (-3.376497)*sailStates.p + (39.562706)*sailStates.q + (1.335079)*sailStates.r + (0.010970)*sailStates.de;
	CD = -1.702740;
	CY = (0.476608)*sailStates.alpha + (-0.025592)*sailStates.beta + (0.672287)*sailStates.p + (1.915491)*sailStates.q + (0.044131)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.337172)*sailStates.alpha + (-0.384983)*sailStates.beta + (-1.918197)*sailStates.p + (16.022072)*sailStates.q + (1.405454)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.388676)*sailStates.alpha + (-0.530180)*sailStates.beta + (12.011228)*sailStates.p + (-160.694275)*sailStates.q + (-4.565498)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.980686)*sailStates.alpha + (-0.027648)*sailStates.beta + (-1.679668)*sailStates.p + (6.636665)*sailStates.q + (-0.009897)*sailStates.r + (-0.000394)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end