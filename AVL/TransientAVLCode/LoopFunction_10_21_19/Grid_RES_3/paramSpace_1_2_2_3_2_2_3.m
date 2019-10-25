function [aeroForces] = paramSpace_1_2_2_3_2_2_3(sailStates,airStates)

	CL = (3.887782)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.755619)*sailStates.p + (37.372585)*sailStates.q + (-0.970590)*sailStates.r + (0.010877)*sailStates.de;
	CD = 0.063470;
	CY = (-0.002977)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.225979)*sailStates.p + (0.173374)*sailStates.q + (-0.039846)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.306198)*sailStates.alpha + (0.106074)*sailStates.beta + (-1.382040)*sailStates.p + (11.867679)*sailStates.q + (-0.678114)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-13.825408)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.139764)*sailStates.p + (-142.582367)*sailStates.q + (3.264434)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.197128)*sailStates.alpha + (0.018704)*sailStates.beta + (0.294731)*sailStates.p + (-0.654697)*sailStates.q + (-0.024632)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end