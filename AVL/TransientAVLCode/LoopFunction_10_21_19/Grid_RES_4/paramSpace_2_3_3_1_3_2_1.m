function [aeroForces] = paramSpace_2_3_3_1_3_2_1(sailStates,airStates)

	CL = (3.926044)*sailStates.alpha + (0.034904)*sailStates.beta + (-1.664996)*sailStates.p + (27.886545)*sailStates.q + (-0.656098)*sailStates.r + (0.010661)*sailStates.de;
	CD = -0.040310;
	CY = (0.299067)*sailStates.alpha + (-0.024503)*sailStates.beta + (-0.306154)*sailStates.p + (1.471502)*sailStates.q + (-0.020015)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.708715)*sailStates.alpha + (0.106722)*sailStates.beta + (-0.458444)*sailStates.p + (2.907448)*sailStates.q + (-0.482575)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.893928)*sailStates.alpha + (-0.113793)*sailStates.beta + (5.610163)*sailStates.p + (-112.102478)*sailStates.q + (2.197468)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.665094)*sailStates.alpha + (0.005467)*sailStates.beta + (0.627988)*sailStates.p + (-3.983006)*sailStates.q + (0.011393)*sailStates.r + (-0.000462)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end