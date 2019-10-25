function [aeroForces] = paramSpace_3_2_2_1_1_2_1(sailStates,airStates)

	CL = (3.926045)*sailStates.alpha + (0.034904)*sailStates.beta + (-1.664996)*sailStates.p + (27.886549)*sailStates.q + (0.656098)*sailStates.r + (0.010661)*sailStates.de;
	CD = -0.040310;
	CY = (-0.299067)*sailStates.alpha + (-0.025449)*sailStates.beta + (0.306154)*sailStates.p + (-1.471502)*sailStates.q + (-0.020015)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.770853)*sailStates.alpha + (-0.080170)*sailStates.beta + (-0.491093)*sailStates.p + (3.311327)*sailStates.q + (0.484701)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.893928)*sailStates.alpha + (-0.113793)*sailStates.beta + (5.610163)*sailStates.p + (-112.102478)*sailStates.q + (-2.197468)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.652821)*sailStates.alpha + (0.006782)*sailStates.beta + (-0.625848)*sailStates.p + (3.956535)*sailStates.q + (0.011254)*sailStates.r + (0.000462)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end