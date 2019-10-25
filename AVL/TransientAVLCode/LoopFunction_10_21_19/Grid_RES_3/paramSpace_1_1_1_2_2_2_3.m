function [aeroForces] = paramSpace_1_1_1_2_2_2_3(sailStates,airStates)

	CL = (3.738908)*sailStates.alpha + (-0.204001)*sailStates.beta + (-2.875707)*sailStates.p + (38.354401)*sailStates.q + (-1.025791)*sailStates.r + (0.010697)*sailStates.de;
	CD = 0.085810;
	CY = (-0.010447)*sailStates.alpha + (-0.025572)*sailStates.beta + (-0.259196)*sailStates.p + (0.267957)*sailStates.q + (-0.045729)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.371163)*sailStates.alpha + (0.053323)*sailStates.beta + (-1.529074)*sailStates.p + (13.413810)*sailStates.q + (-0.753428)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-13.256960)*sailStates.alpha + (0.801687)*sailStates.beta + (9.520295)*sailStates.p + (-145.513718)*sailStates.q + (3.478382)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.285350)*sailStates.alpha + (0.017853)*sailStates.beta + (0.326079)*sailStates.p + (-0.596757)*sailStates.q + (-0.027991)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end