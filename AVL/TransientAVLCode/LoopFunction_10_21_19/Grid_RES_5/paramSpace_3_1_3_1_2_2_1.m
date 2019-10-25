function [aeroForces] = paramSpace_3_1_3_1_2_2_1(sailStates,airStates)

	CL = (4.195931)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.893972)*sailStates.p + (27.113052)*sailStates.q + (0.346489)*sailStates.r + (0.009750)*sailStates.de;
	CD = -0.481190;
	CY = (0.006419)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.306956)*sailStates.p + (0.624083)*sailStates.q + (0.054147)*sailStates.r + (0.000132)*sailStates.de;

	Cl = (0.855352)*sailStates.alpha + (-0.178374)*sailStates.beta + (-0.724644)*sailStates.p + (4.974843)*sailStates.q + (0.551380)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-15.001356)*sailStates.alpha + (0.000000)*sailStates.beta + (7.167646)*sailStates.p + (-120.478767)*sailStates.q + (-1.124569)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (0.482512)*sailStates.alpha + (-0.031452)*sailStates.beta + (-0.811098)*sailStates.p + (3.396258)*sailStates.q + (-0.023351)*sailStates.r + (-0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end