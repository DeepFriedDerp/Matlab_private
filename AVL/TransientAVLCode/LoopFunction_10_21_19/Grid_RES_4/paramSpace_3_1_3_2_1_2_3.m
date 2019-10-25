function [aeroForces] = paramSpace_3_1_3_2_1_2_3(sailStates,airStates)

	CL = (3.975636)*sailStates.alpha + (0.115056)*sailStates.beta + (-2.941445)*sailStates.p + (38.012272)*sailStates.q + (0.589403)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.014060;
	CY = (-0.071664)*sailStates.alpha + (-0.025807)*sailStates.beta + (0.223229)*sailStates.p + (-0.870359)*sailStates.q + (-0.014662)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.478801)*sailStates.alpha + (-0.035007)*sailStates.beta + (-1.571362)*sailStates.p + (13.379081)*sailStates.q + (0.449537)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.242190)*sailStates.alpha + (-0.439065)*sailStates.beta + (9.942564)*sailStates.p + (-146.834122)*sailStates.q + (-1.996500)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.055587)*sailStates.alpha + (0.005708)*sailStates.beta + (-0.376246)*sailStates.p + (1.951153)*sailStates.q + (0.001962)*sailStates.r + (0.000276)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end