function [aeroForces] = paramSpace_2_2_3_1_3_1_3(sailStates,airStates)

	CL = (7.345943)*sailStates.alpha + (-0.218513)*sailStates.beta + (-3.492460)*sailStates.p + (44.881119)*sailStates.q + (-3.108963)*sailStates.r + (0.012056)*sailStates.de;
	CD = -2.988250;
	CY = (-0.266389)*sailStates.alpha + (-0.025592)*sailStates.beta + (-1.427686)*sailStates.p + (1.915495)*sailStates.q + (-0.093508)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.061162)*sailStates.alpha + (0.567098)*sailStates.beta + (-1.954879)*sailStates.p + (17.426239)*sailStates.q + (-2.752597)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-14.465562)*sailStates.alpha + (0.828363)*sailStates.beta + (11.023899)*sailStates.p + (-160.694275)*sailStates.q + (10.498227)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.510671)*sailStates.alpha + (0.043349)*sailStates.beta + (3.035635)*sailStates.p + (-14.786800)*sailStates.q + (0.026849)*sailStates.r + (-0.000862)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end