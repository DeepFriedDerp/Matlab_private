function [aeroForces] = paramSpace_1_1_2_2_3_3_3(sailStates,airStates)

	CL = (3.922416)*sailStates.alpha + (-0.025382)*sailStates.beta + (-2.748804)*sailStates.p + (34.862732)*sailStates.q + (-0.310058)*sailStates.r + (0.009908)*sailStates.de;
	CD = -0.193650;
	CY = (0.139333)*sailStates.alpha + (-0.028261)*sailStates.beta + (0.073460)*sailStates.p + (1.057314)*sailStates.q + (0.014574)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.363591)*sailStates.alpha + (-0.104519)*sailStates.beta + (-1.480943)*sailStates.p + (12.577561)*sailStates.q + (-0.031472)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.239129)*sailStates.alpha + (0.054924)*sailStates.beta + (9.765104)*sailStates.p + (-143.598221)*sailStates.q + (1.096274)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.081926)*sailStates.alpha + (-0.020784)*sailStates.beta + (-0.468704)*sailStates.p + (2.418790)*sailStates.q + (-0.040852)*sailStates.r + (-0.000251)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end