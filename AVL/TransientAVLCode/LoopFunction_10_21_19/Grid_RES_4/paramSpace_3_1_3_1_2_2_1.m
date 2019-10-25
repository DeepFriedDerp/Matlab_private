function [aeroForces] = paramSpace_3_1_3_1_2_2_1(sailStates,airStates)

	CL = (3.685072)*sailStates.alpha + (0.063701)*sailStates.beta + (-1.662346)*sailStates.p + (27.543161)*sailStates.q + (0.218513)*sailStates.r + (0.010469)*sailStates.de;
	CD = 0.031090;
	CY = (0.010443)*sailStates.alpha + (-0.024526)*sailStates.beta + (0.046457)*sailStates.p + (0.221995)*sailStates.q + (-0.003037)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (0.677145)*sailStates.alpha + (-0.020996)*sailStates.beta + (-0.524937)*sailStates.p + (3.610374)*sailStates.q + (0.146849)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-13.478029)*sailStates.alpha + (-0.263670)*sailStates.beta + (5.735212)*sailStates.p + (-111.854546)*sailStates.q + (-0.753672)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (0.038100)*sailStates.alpha + (0.001832)*sailStates.beta + (-0.082370)*sailStates.p + (0.137541)*sailStates.q + (-0.002011)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end