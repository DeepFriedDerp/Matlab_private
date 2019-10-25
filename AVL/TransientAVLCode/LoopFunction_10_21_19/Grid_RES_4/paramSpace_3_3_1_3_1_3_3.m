function [aeroForces] = paramSpace_3_3_1_3_1_3_3(sailStates,airStates)

	CL = (4.378266)*sailStates.alpha + (-0.070739)*sailStates.beta + (-2.839315)*sailStates.p + (37.860813)*sailStates.q + (1.136511)*sailStates.r + (0.011372)*sailStates.de;
	CD = -0.233810;
	CY = (-0.023196)*sailStates.alpha + (-0.024835)*sailStates.beta + (0.452480)*sailStates.p + (-0.563442)*sailStates.q + (-0.029598)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.486523)*sailStates.alpha + (-0.228055)*sailStates.beta + (-1.406759)*sailStates.p + (11.771088)*sailStates.q + (0.936036)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.530698)*sailStates.alpha + (0.240619)*sailStates.beta + (9.428444)*sailStates.p + (-144.107040)*sailStates.q + (-3.811214)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.027447)*sailStates.alpha + (0.012984)*sailStates.beta + (-0.934985)*sailStates.p + (4.509630)*sailStates.q + (0.005630)*sailStates.r + (0.000266)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end