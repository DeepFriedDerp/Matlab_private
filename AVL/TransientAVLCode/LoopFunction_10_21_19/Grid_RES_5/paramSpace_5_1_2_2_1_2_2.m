function [aeroForces] = paramSpace_5_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.108681)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.748506)*sailStates.p + (35.753136)*sailStates.q + (0.062468)*sailStates.r + (0.010856)*sailStates.de;
	CD = -0.089110;
	CY = (-0.023540)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.176715)*sailStates.p + (-0.322047)*sailStates.q + (0.018585)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.371178)*sailStates.alpha + (-0.075385)*sailStates.beta + (-1.370945)*sailStates.p + (11.161676)*sailStates.q + (0.175560)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-14.832690)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.617371)*sailStates.p + (-143.031982)*sailStates.q + (-0.187509)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.165927)*sailStates.alpha + (-0.007923)*sailStates.beta + (-0.520257)*sailStates.p + (3.098960)*sailStates.q + (-0.021123)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end