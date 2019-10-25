function [aeroForces] = paramSpace_11_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.126078)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.323565)*sailStates.p + (32.275524)*sailStates.q + (-0.152423)*sailStates.r + (0.010652)*sailStates.de;
	CD = -0.096430;
	CY = (0.078467)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.204434)*sailStates.p + (0.493724)*sailStates.q + (0.021504)*sailStates.r + (0.000106)*sailStates.de;

	Cl = (1.188740)*sailStates.alpha + (0.082329)*sailStates.beta + (-1.023471)*sailStates.p + (7.913728)*sailStates.q + (-0.248974)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-14.953482)*sailStates.alpha + (0.000000)*sailStates.beta + (8.207687)*sailStates.p + (-131.315216)*sailStates.q + (0.489296)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (-0.306531)*sailStates.alpha + (-0.008653)*sailStates.beta + (0.540745)*sailStates.p + (-3.144512)*sailStates.q + (-0.019407)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end