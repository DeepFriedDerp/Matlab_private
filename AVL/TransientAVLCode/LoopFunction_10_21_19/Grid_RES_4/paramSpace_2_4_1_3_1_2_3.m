function [aeroForces] = paramSpace_2_4_1_3_1_2_3(sailStates,airStates)

	CL = (3.924700)*sailStates.alpha + (0.088021)*sailStates.beta + (-2.811972)*sailStates.p + (36.808567)*sailStates.q + (-0.248639)*sailStates.r + (0.010957)*sailStates.de;
	CD = 0.044600;
	CY = (-0.056499)*sailStates.alpha + (-0.025385)*sailStates.beta + (-0.027456)*sailStates.p + (-0.432842)*sailStates.q + (-0.001754)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.246954)*sailStates.alpha + (0.047737)*sailStates.beta + (-1.365512)*sailStates.p + (11.072950)*sailStates.q + (-0.181305)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.243442)*sailStates.alpha + (-0.410608)*sailStates.beta + (9.610720)*sailStates.p + (-143.531296)*sailStates.q + (0.881076)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.128877)*sailStates.alpha + (0.003402)*sailStates.beta + (-0.020344)*sailStates.p + (0.813917)*sailStates.q + (-0.007694)*sailStates.r + (0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end