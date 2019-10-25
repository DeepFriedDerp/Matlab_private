function [aeroForces] = paramSpace_2_4_1_2_3_2_3(sailStates,airStates)

	CL = (3.956311)*sailStates.alpha + (0.136580)*sailStates.beta + (-2.941167)*sailStates.p + (38.028835)*sailStates.q + (-0.598656)*sailStates.r + (0.011026)*sailStates.de;
	CD = 0.024750;
	CY = (0.069171)*sailStates.alpha + (-0.023582)*sailStates.beta + (-0.238188)*sailStates.p + (0.870358)*sailStates.q + (-0.015704)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.349645)*sailStates.alpha + (0.123617)*sailStates.beta + (-1.473538)*sailStates.p + (12.171268)*sailStates.q + (-0.467168)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.178904)*sailStates.alpha + (-0.576392)*sailStates.beta + (9.939020)*sailStates.p + (-146.834106)*sailStates.q + (2.050565)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.034899)*sailStates.alpha + (0.004439)*sailStates.beta + (0.404762)*sailStates.p + (-2.041767)*sailStates.q + (0.002098)*sailStates.r + (-0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end