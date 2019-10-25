function [aeroForces] = paramSpace_2_1_2_2_3_2_1(sailStates,airStates)

	CL = (3.980877)*sailStates.alpha + (-0.100373)*sailStates.beta + (-2.137078)*sailStates.p + (31.494896)*sailStates.q + (-0.483192)*sailStates.r + (0.010672)*sailStates.de;
	CD = 0.014020;
	CY = (0.115340)*sailStates.alpha + (-0.025570)*sailStates.beta + (-0.190489)*sailStates.p + (0.668511)*sailStates.q + (-0.012509)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.132434)*sailStates.alpha + (0.037324)*sailStates.beta + (-0.914260)*sailStates.p + (7.281354)*sailStates.q + (-0.362957)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.295753)*sailStates.alpha + (0.388846)*sailStates.beta + (7.257463)*sailStates.p + (-124.743294)*sailStates.q + (1.638988)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.190325)*sailStates.alpha + (0.005314)*sailStates.beta + (0.352226)*sailStates.p + (-1.897450)*sailStates.q + (0.003230)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end