function [aeroForces] = paramSpace_3_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.239268)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.894470)*sailStates.p + (27.069990)*sailStates.q + (0.354185)*sailStates.r + (0.009828)*sailStates.de;
	CD = -0.500720;
	CY = (0.003274)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.321400)*sailStates.p + (0.624082)*sailStates.q + (0.056738)*sailStates.r + (0.000132)*sailStates.de;

	Cl = (0.851246)*sailStates.alpha + (-0.185600)*sailStates.beta + (-0.724924)*sailStates.p + (4.972830)*sailStates.q + (0.574588)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-15.177196)*sailStates.alpha + (0.000000)*sailStates.beta + (7.175401)*sailStates.p + (-120.478767)*sailStates.q + (-1.168552)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (0.490673)*sailStates.alpha + (-0.032726)*sailStates.beta + (-0.832710)*sailStates.p + (3.407675)*sailStates.q + (-0.023416)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end