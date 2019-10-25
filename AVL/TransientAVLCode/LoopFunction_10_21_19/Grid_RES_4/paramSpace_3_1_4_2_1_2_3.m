function [aeroForces] = paramSpace_3_1_4_2_1_2_3(sailStates,airStates)

	CL = (3.956310)*sailStates.alpha + (0.136580)*sailStates.beta + (-2.941167)*sailStates.p + (38.028831)*sailStates.q + (0.598656)*sailStates.r + (0.011026)*sailStates.de;
	CD = 0.024750;
	CY = (-0.069171)*sailStates.alpha + (-0.025991)*sailStates.beta + (0.238188)*sailStates.p + (-0.870358)*sailStates.q + (-0.015704)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.481746)*sailStates.alpha + (-0.041111)*sailStates.beta + (-1.571226)*sailStates.p + (13.379827)*sailStates.q + (0.473698)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.178904)*sailStates.alpha + (-0.576392)*sailStates.beta + (9.939020)*sailStates.p + (-146.834122)*sailStates.q + (-2.050565)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.065558)*sailStates.alpha + (0.006357)*sailStates.beta + (-0.398360)*sailStates.p + (1.962554)*sailStates.q + (0.001670)*sailStates.r + (0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end