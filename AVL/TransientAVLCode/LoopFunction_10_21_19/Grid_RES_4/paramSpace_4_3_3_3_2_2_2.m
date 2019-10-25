function [aeroForces] = paramSpace_4_3_3_3_2_2_2(sailStates,airStates)

	CL = (3.853929)*sailStates.alpha + (-0.072229)*sailStates.beta + (-2.479795)*sailStates.p + (35.306404)*sailStates.q + (0.990643)*sailStates.r + (0.010591)*sailStates.de;
	CD = 0.074610;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.228915)*sailStates.p + (-0.000000)*sailStates.q + (-0.045534)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.178792)*sailStates.alpha + (-0.135540)*sailStates.beta + (-1.147140)*sailStates.p + (9.709442)*sailStates.q + (0.685949)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-13.588923)*sailStates.alpha + (0.269746)*sailStates.beta + (8.166643)*sailStates.p + (-134.847153)*sailStates.q + (-3.338509)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.107909)*sailStates.alpha + (0.023752)*sailStates.beta + (-0.322494)*sailStates.p + (0.725938)*sailStates.q + (-0.026935)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end