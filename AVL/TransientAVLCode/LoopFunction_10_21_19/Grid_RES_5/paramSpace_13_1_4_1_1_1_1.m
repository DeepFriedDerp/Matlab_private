function [aeroForces] = paramSpace_13_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.090682)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.893021)*sailStates.p + (27.199200)*sailStates.q + (-0.331354)*sailStates.r + (0.009595)*sailStates.de;
	CD = -0.422340;
	CY = (-0.012710)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.278068)*sailStates.p + (-0.624082)*sailStates.q + (0.048964)*sailStates.r + (-0.000132)*sailStates.de;

	Cl = (0.863307)*sailStates.alpha + (0.163923)*sailStates.beta + (-0.724107)*sailStates.p + (4.978868)*sailStates.q + (-0.505086)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-14.649676)*sailStates.alpha + (0.000000)*sailStates.beta + (7.152135)*sailStates.p + (-120.478767)*sailStates.q + (1.036602)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (-0.466069)*sailStates.alpha + (-0.028904)*sailStates.beta + (0.767752)*sailStates.p + (-3.373429)*sailStates.q + (-0.023909)*sailStates.r + (0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end