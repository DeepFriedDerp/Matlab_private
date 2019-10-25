function [aeroForces] = paramSpace_1_1_4_1_1_2_2(sailStates,airStates)

	CL = (3.825549)*sailStates.alpha + (-0.113778)*sailStates.beta + (-2.511508)*sailStates.p + (34.666939)*sailStates.q + (-0.539826)*sailStates.r + (0.010613)*sailStates.de;
	CD = 0.044020;
	CY = (-0.200697)*sailStates.alpha + (-0.020007)*sailStates.beta + (0.066107)*sailStates.p + (-1.664521)*sailStates.q + (0.012971)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.228950)*sailStates.alpha + (-0.003371)*sailStates.beta + (-1.232540)*sailStates.p + (10.335320)*sailStates.q + (-0.296656)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-14.046412)*sailStates.alpha + (0.342146)*sailStates.beta + (8.694030)*sailStates.p + (-136.195908)*sailStates.q + (1.838743)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.404547)*sailStates.alpha + (-0.003435)*sailStates.beta + (-0.293806)*sailStates.p + (3.246372)*sailStates.q + (-0.068708)*sailStates.r + (0.000469)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end