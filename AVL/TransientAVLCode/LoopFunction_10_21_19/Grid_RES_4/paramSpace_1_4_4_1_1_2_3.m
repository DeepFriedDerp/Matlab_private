function [aeroForces] = paramSpace_1_4_4_1_1_2_3(sailStates,airStates)

	CL = (3.381298)*sailStates.alpha + (0.160305)*sailStates.beta + (-3.364098)*sailStates.p + (41.930428)*sailStates.q + (-0.880720)*sailStates.r + (0.011071)*sailStates.de;
	CD = 0.078630;
	CY = (-0.137903)*sailStates.alpha + (-0.027664)*sailStates.beta + (-0.038788)*sailStates.p + (-1.002333)*sailStates.q + (-0.007823)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.146321)*sailStates.alpha + (0.122169)*sailStates.beta + (-1.837809)*sailStates.p + (15.884536)*sailStates.q + (-0.557565)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-12.500090)*sailStates.alpha + (-0.497027)*sailStates.beta + (11.448698)*sailStates.p + (-160.076111)*sailStates.q + (2.966037)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.411000)*sailStates.alpha + (0.022257)*sailStates.beta + (-0.195119)*sailStates.p + (2.836330)*sailStates.q + (-0.077147)*sailStates.r + (0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end