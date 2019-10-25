function [aeroForces] = paramSpace_1_4_1_1_3_2_2(sailStates,airStates)

	CL = (4.070093)*sailStates.alpha + (0.293933)*sailStates.beta + (-2.411154)*sailStates.p + (35.359993)*sailStates.q + (-1.417358)*sailStates.r + (0.010336)*sailStates.de;
	CD = -0.012060;
	CY = (0.219943)*sailStates.alpha + (-0.018970)*sailStates.beta + (-0.505962)*sailStates.p + (1.664522)*sailStates.q + (-0.100821)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.395276)*sailStates.alpha + (0.275197)*sailStates.beta + (-1.075973)*sailStates.p + (9.327521)*sailStates.q + (-1.047381)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-13.449271)*sailStates.alpha + (-1.127599)*sailStates.beta + (7.525104)*sailStates.p + (-131.445847)*sailStates.q + (4.736425)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.212507)*sailStates.alpha + (0.031505)*sailStates.beta + (0.905907)*sailStates.p + (-4.597796)*sailStates.q + (0.014431)*sailStates.r + (-0.000519)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end