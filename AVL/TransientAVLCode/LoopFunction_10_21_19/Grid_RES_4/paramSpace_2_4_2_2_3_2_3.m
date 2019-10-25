function [aeroForces] = paramSpace_2_4_2_2_3_2_3(sailStates,airStates)

	CL = (3.975636)*sailStates.alpha + (0.115056)*sailStates.beta + (-2.941445)*sailStates.p + (38.012272)*sailStates.q + (-0.589403)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.014060;
	CY = (0.071664)*sailStates.alpha + (-0.023766)*sailStates.beta + (-0.223229)*sailStates.p + (0.870359)*sailStates.q + (-0.014662)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.346453)*sailStates.alpha + (0.115142)*sailStates.beta + (-1.473668)*sailStates.p + (12.170521)*sailStates.q + (-0.443091)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.242190)*sailStates.alpha + (-0.439065)*sailStates.beta + (9.942564)*sailStates.p + (-146.834106)*sailStates.q + (1.996501)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.026873)*sailStates.alpha + (0.004134)*sailStates.beta + (0.382649)*sailStates.p + (-2.030366)*sailStates.q + (0.002384)*sailStates.r + (-0.000276)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end