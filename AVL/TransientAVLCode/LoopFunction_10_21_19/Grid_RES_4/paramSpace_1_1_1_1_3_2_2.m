function [aeroForces] = paramSpace_1_1_1_1_3_2_2(sailStates,airStates)

	CL = (4.070093)*sailStates.alpha + (-0.293933)*sailStates.beta + (-2.411153)*sailStates.p + (35.359993)*sailStates.q + (-1.417358)*sailStates.r + (0.010336)*sailStates.de;
	CD = -0.012060;
	CY = (0.219943)*sailStates.alpha + (-0.030602)*sailStates.beta + (-0.505962)*sailStates.p + (1.664522)*sailStates.q + (-0.100821)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.532831)*sailStates.alpha + (0.091200)*sailStates.beta + (-1.170330)*sailStates.p + (10.515402)*sailStates.q + (-1.066277)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-13.449271)*sailStates.alpha + (1.127600)*sailStates.beta + (7.525104)*sailStates.p + (-131.445847)*sailStates.q + (4.736425)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.134432)*sailStates.alpha + (0.041376)*sailStates.beta + (0.887138)*sailStates.p + (-4.361512)*sailStates.q + (0.010673)*sailStates.r + (-0.000519)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end